<?php namespace Printwtf\JsonPoxo;

use Handlebars\Handlebars;

/**
*
*/
class Parser
{
  function is_assoc($array) {
    foreach (array_keys($array) as $k => $v) {
      if ($k !== $v)
        return true;
    }
    return false;
  }

  // Auxiliar method to traverse classList looking for
  // className. Where classList is an array of _class(es)
  function &findClass(&$classList, $className)
  {
    $className = ucfirst(strtolower($className));
    for ($i=0; $i < count($classList); $i++) {
      $cl = &$classList[$i];
      if ($cl->originalName == $className) {
        return $cl;
      }
    }
    $newClass = new Classes($className);
    array_push($classList, $newClass);
    return $this->findClass($classList, $className);
  }

  // Receives one php 'array' (associative) and transforms into one
  // _class object
  function parse($obj = null, $className, &$classList)
  {
    $curClass = &$this->findClass($classList, $className);

    if ($obj == null)
      return ;

    foreach ($obj as $key => $value) {
      $propertyName = $key;//ucfirst(strtolower($key));

      $objType = gettype($value);
      switch ($objType) {
        case 'array':
        {
          // if is array and not object
          if (!$this->is_assoc($value))
          {
            if (count($value) == 0)
            {
              // if has no value, we consider being an array of objects
              $newProperty = new Properties($propertyName, 'object', true);
              $curClass->pushProperty($newProperty);
              $this->parse($value, $propertyName, $classList);
            }
            else
            {
              for ($i=0; $i < count($value); $i++) {
                $el = &$value[$i];

                if (gettype($el) == 'array')
                {
                  $objType = 'object';
                  $this->parse($el, $propertyName, $classList);
                }
                else
                {
                  $objType = strtolower(gettype($el));
                }
              }

              $newProperty = new Properties($propertyName, $objType, true);
              $curClass->pushProperty($newProperty);
            }
          } else {
            $newProperty = new Properties($propertyName, 'object', false);
            $curClass->pushProperty($newProperty);
            $this->parse($value, $propertyName, $classList);
          }

          break;
        }
        default:
        {
          $newProperty = new Properties($propertyName, strtolower($objType), false);
          $curClass->pushProperty($newProperty);

          break;
        }
      }
    }
  }

  // Receives a json string (or object) and return
  // a list of _class(es) objects.
  function classes($baseClassName, $src)
  {
    if (gettype($src) == 'string')
    {
      $src = utf8_encode($src);
      $src = json_decode($src, true);

      switch (json_last_error())
      {
         case JSON_ERROR_NONE:
         break;
         case JSON_ERROR_DEPTH:
             throw new Exception('Maximum stack depth exceeded');
         break;
         case JSON_ERROR_STATE_MISMATCH:
             throw new Exception('Underflow or the modes mismatch');
         break;
         case JSON_ERROR_CTRL_CHAR:
             throw new Exception('Unexpected control character found');
         break;
         case JSON_ERROR_SYNTAX:
             throw new Exception('Syntax error, malformed JSON');
         break;
         case JSON_ERROR_UTF8:
             throw new Exception('Malformed UTF-8 characters, possibly incorrectly encoded');
         break;
         default:
             throw new Exception('Unknown error');
         break;
      }
    }

    if (gettype($baseClassName) != 'string')
      throw new Exception("Argument 1 has to be a string", 1);

    // If is array not object
    if (!$this->is_assoc($src))
    {
      $src = array(
          $baseClassName . 'Object' => $src
      );
    }

    $classList = array();
    $result = $this->parse($src, $baseClassName, $classList);

    return $classList;
  }

  function toClasses($lang, $className, $params, $obj)
  {
    if (gettype($lang) !== 'string')
      throw new Exception("Argument 1 has to be a string", 1);

    if (gettype($className) !== 'string')
      throw new Exception("Argument 2 has to be a string", 1);

    $langComplete = "Printwtf\\JsonPoxo\\Language\\" . ucfirst(strtolower(trim($lang)));
    $language = new $langComplete();

    $results = array();
    $classes = $this->classes($className, $obj);

    if (count($classes) > 0)
    {
      for ($i=0; $i < count($classes); $i++) {
        $cl = &$classes[$i];
        $cl = $language->classes($cl, $params);
      }
    }
    return $classes;
  }

  // Convert one JSON object into an array of
  // _poxo objects
  function toX($lang, $className, $params, $obj)
  {
    $langComplete = "Printwtf\\JsonPoxo\\Language\\" . ucfirst(strtolower(trim($lang)));
    $language = new $langComplete();

    $results = array();
    $classes = $this->toClasses($lang, $className, $params, $obj);
    if (count($classes) > 0)
    {
      for ($i=0; $i < count($classes); $i++) {
        $cl = &$classes[$i];

        $models = $language->template($cl);
        for ($k=0; $k < count($models); $k++) {
          $model = &$models[$k];
          array_push($results, $model);
        }
      }
    }
    return $results;
  }

  function getURL($url)
  {
    $ch = curl_init();
    curl_setopt($ch, CURLOPT_URL,            $url);
    curl_setopt($ch, CURLOPT_RETURNTRANSFER, true);
    curl_setopt($ch, CURLOPT_POST,           false);
    $result = curl_exec($ch);
    curl_close($ch);
    return($result);
  }
}
