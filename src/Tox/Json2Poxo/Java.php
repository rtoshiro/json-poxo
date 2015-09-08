<?php
namespace Tox\Json2Poxo;

use Handlebars\Handlebars;

class Java extends Language
{
  public $reservedWords = array("abstract", "continue", "for", "new", "switch", "assert", "default", "goto",
  "package", "synchronized", "boolean", "do", "if", "private", "this", "break", "double", "implements",
  "protected", "throw", "byte", "else", "import", "public", "throws", "case", "enum", "instanceof",
  "return", "transient", "catch", "extends", "int", "short", "try", "char", "final", "interface", "static",
  "void", "class", "finally", "long", "strictfp", "volatile", "const", "float", "native", "super", "while");

  public $primaryKeys = array("id", "identifier", "uid");

  public $types = array(
    "string" => "String",
    "integer" => "Integer",
    "double" => "Double",
    "boolean"=> "Boolean",
    "object" => "Object",
  );

  public function template(&$_class, &$_poxo)
  {
    $engine = new Handlebars(array(
      'loader' => new \Handlebars\Loader\FilesystemLoader(__DIR__.'/tpl/')
    ));
    $result = $engine->render('java', $_class);
    $_poxo['fileName'] = $_class['name'] . ".java";
    $_poxo['sourceCode'] = $result;
    return array($_poxo);
  }

  public function classes(&$cl, $params = null)
  {
    $cl = parent::classes($cl, $params);

    if ($params != null)
    {
      if (isset($params['package'])) {
        $cl['package'] = $params['package'];
      }

      if (isset($params['includeGson'])) {
        $cl['includeGson'] = $params['includeGson'];
      }
    }

    for ($i=0; $i < count($cl['properties']); $i++)
    {
      $property = &$cl['properties'][$i];

      if (isset($cl['includeGson']) && !$cl['includeGson']) {
        $property['name'] = $property['originalName'];
      }

      $property['uppername'] = strtoupper($property['name']);
      $property['capname'] = ucwords($property['name']);
      $property['capOriginalName'] = ucwords($property['originalName']);
      if ($property['isArray'])
      {
        switch ($property['type']) {
          case 'Object':
          {
            $property['type'] = "ArrayList<" . ucwords($property['name']) . ">";
            break;
          }
          default:
          {
            $property['type'] = "ArrayList<" . $property['type'] . ">";
            break;
          }
        }
      }
    }

    $cl['capkey'] = $cl['primaryKey'] ? ucwords($cl['primaryKey']) : false;
    return $cl;
  }
}


 ?>
