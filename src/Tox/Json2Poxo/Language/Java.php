<?php
namespace Tox\Json2Poxo\Language;

use Handlebars\Handlebars;
use Tox\Json2Poxo\Poxo;

class Java extends Language
{
  public $reservedWords = array("abstract", "continue", "for", "new", "switch", "assert", "default", "goto",
  "package", "synchronized", "boolean", "do", "if", "private", "this", "break", "double", "implements",
  "protected", "throw", "byte", "else", "import", "public", "throws", "case", "enum", "instanceof",
  "return", "transient", "catch", "extends", "int", "short", "try", "char", "final", "interface", "static",
  "void", "class", "finally", "long", "strictfp", "volatile", "const", "float", "native", "super", "while");

  public $primaryKeys = array("id", "identifier", "uid");

  public $types = array(
    "null" => "Null",
    "string" => "String",
    "integer" => "Long",
    "double" => "Double",
    "boolean"=> "Boolean",
    "object" => "Object",
  );

  public function template(&$_class)
  {
    $engine = new Handlebars(array(
      'loader' => new \Handlebars\Loader\FilesystemLoader(__DIR__.'/tpl/')
    ));
    $_poxo = new Poxo();
    $result = $engine->render('java', $_class);
    $_poxo->setFileName($_class->getName() . ".java");
    $_poxo->setSourceCode($result);
    return array($_poxo);
  }

  public function &classes(&$cl, $params = null)
  {
    $cl = parent::classes($cl, $params);
    $clparams = &$cl->getParams();

    if ($params != null)
    {
      if (isset($params['package'])) {
        $clparams['package'] = $params['package'];
      }

      if (isset($params['includeGson'])) {
        $clparams['includeGson'] = $params['includeGson'];
      }
    }

    for ($i=0; $i < count($cl->getProperties()); $i++)
    {
      $property = &$cl->getProperties()[$i];
      $pparams = &$property->getParams();

      $pparams['isBoolean'] = ($property->getType() == "Boolean");

      if (isset($clparams['includeGson']) && !$clparams['includeGson']) {
        $property->setName($property->getOriginalName());
      }

      if ($property->isArray())
      {
        $cl->pushImport('import java.util.ArrayList;');

        switch ($property->getType()) {
          case 'Object':
          {
            $property->setType("ArrayList<" . $property->getNameCapitalized() . ">");
            break;
          }
          case 'Null':
          {
            $property->setType("ArrayList<Object>");
            break;
          }
          default:
          {
            $property->setType("ArrayList<" . $property->getType() . ">");
            break;
          }
        }
      }
      else
      {
        switch ($property->getType()) {
          case 'Object':
          {
            $property->setType($property->getNameCapitalized());
            break;
          }
          case 'Null':
          {
            $property->setType('Object');
            break;
          }
          default:
            break;
        }
      }
    }

    return $cl;
  }
}


 ?>
