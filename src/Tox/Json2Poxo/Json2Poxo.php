<?php namespace Tox\Json2Poxo;

use Handlebars\Handlebars;

date_default_timezone_set('UTC');

class Json2Poxo
{
  // Object model to normalize JSON
  // Represents a single class property.
  function _class($name)
  {
    return array(
      'name' => $name,
      'primaryKey' => false,
      'primaryKeyType' => null,
      'properties' => array(),
      'params' => array()
    );
  }

  // Object model to normalize JSON
  // Represents a single property.
  function _property($name, $type, $isArray)
  {
    return array(
      'name' => strtolower($name),
      'originalName' => $name,
      'type' => $type,
      'isArray' => $isArray
    );
  }

  // Object model to represent one file
  // class
  function _poxo()
  {
    return array(
      'fileName' => '',
      'sourceCode' => ''
    );
  }

  function is_assoc($array) {
    foreach (array_keys($array) as $k => $v) {
      if ($k !== $v)
        return true;
    }
    return false;
  }

  // Auxiliar method to insert one _property inside
  // _class, checking if it already exists
  function pushProperty(&$cl, $newProperty)
  {
    for ($i=0; $i < count($cl['properties']); $i++) {
      $property = &$cl['properties'][$i];
      if ($property['name'] == $newProperty['name'])
        return;
    }
    array_push($cl['properties'], $newProperty);
  }

  // Auxiliar method to traverse classList looking for
  // className. Where classList is an array of _class(es)
  function &findClass(&$classList, $className)
  {
    for ($i=0; $i < count($classList); $i++) {
      $cl = &$classList[$i];
      if ($cl['name'] == $className) {
        return $cl;
      }
    }
    $newClass = $this->_class($className);
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
      $propertyName = ucwords($key);
      $objType = gettype($value);
      switch ($objType) {
        case 'boolean':
        case 'integer':
        case 'double':
        case 'string':
        {
          $newProperty = $this->_property($key, $objType, false);
          $this->pushProperty($curClass, $newProperty);

          break;
        }
        case 'array':
        {
          if (!$this->is_assoc($value))
          {
            if (count($value) == 0)
            {
              $newProperty = $this->_property($key, 'object', false);
              $this->pushProperty($curClass, $newProperty);
              $this->parse($value, $propertyName, $classList);
            }
            else {
              for ($i=0; $i < count($value); $i++) {
                $el = &$value[$i];

                if (gettype($el) == 'array')
                {
                  $objType = 'object';
                  $this->parse($el, $propertyName, $classList);
                }
                else if (gettype($el) == 'boolean' || gettype($el) == 'integer' || gettype($el) == 'string')
                {
                  $objType = gettype($el);
                }
                else {
                  print_r('Error - ' . $objType); die;
                }
              }

              $newProperty = $this->_property($key, $objType, true);
              $this->pushProperty($curClass, $newProperty);
            }
          } else {
            $newProperty = $this->_property($key, 'object', false);
            $this->pushProperty($curClass, $newProperty);
            $this->parse($value, $propertyName, $classList);
          }

          break;
        }
        case 'NULL':
        {
          $newProperty = $this->_property($key, 'object', false);
          $this->pushProperty($curClass, $newProperty);
          $this->parse($value, $propertyName, $classList);
          break;
        }
        default:
        {
          print_r('Error - ' . $objType); die;
          break;
        }
      }
    }
  }

  // Receives a json string (or object) and return
  // a list of _class(es) objects.
  function classes($baseClassName, $src)
  {
    if (gettype($baseClassName) != 'string')
      throw new Exception("Argument 1 has to be a string", 1);

    $srcObj = $src;
    if (gettype($src) == 'string')
      $srcObj = json_decode($src, true);

    $classList = array();
    $result = $this->parse($srcObj, $baseClassName, $classList);

    return $classList;
  }

  function toClasses($lang, $className, $params, $obj)
  {
    if (gettype($lang) !== 'string')
      throw new Exception("Argument 1 has to be a string", 1);

    if (gettype($className) !== 'string')
      throw new Exception("Argument 2 has to be a string", 1);

    $langComplete = "Tox\\Json2Poxo\\Language\\" . ucwords(trim($lang));
    $language = new $langComplete();

    $results = array();
    $classes = $this->classes($className, $obj);

    if (count($classes) > 0)
    {
      for ($i=0; $i < count($classes); $i++) {
        $cl = &$classes[$i];
        $cl = $language->classes($cl, $params);
        // array_push($results, $cl);
      }
    }
    return $classes;
  }

  // Convert one JSON object into an array of
  // _poxo objects
  function toX($lang, $className, $params, $obj)
  {
    $langComplete = "Tox\\Json2Poxo\\Language\\" . ucwords(trim($lang));
    $language = new $langComplete();

    $results = array();
    $classes = $this->toClasses($lang, $className, $params, $obj);
    if (count($classes) > 0)
    {
      for ($i=0; $i < count($classes); $i++) {
        $cl = &$classes[$i];

        $newPoxo = $this->_poxo();
        $models = $language->template($cl, $newPoxo);
        for ($k=0; $k < count($models); $k++) {
          $model = $models[$k];
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
