<?php
namespace Printwtf\JsonPoxo\Language;

use Printwtf\JsonPoxo\Source;
use Handlebars\Handlebars;

class Objc extends Language
{
  public $reservedWords = array("auto", "break", "case", "char", "const", "continue",
  "class", "default", "do", "double", "else", "enum", "extern", "float", "for",
  "goto", "if", "id", "implementation", "inline", "int", "interface", "long",
  "nonatomic", "property", "protocol", "readonly", "readwrite", "register",
  "restrict", "retain", "return", "short", "signed", "sizeof", "static", "strong",
  "struct", "switch", "typedef", "union", "unsafe_unretained", "unsigned", "void",
  "volatile", "weak", "while", "_bool", "_complex", "_imaginary", "sel", "imp",
  "bool", "nil", "yes", "no", "self", "super", "__strong", "__weak", "oneway",
  "in", "out", "inout", "bycopy", "byref");

  public $primaryKeys = array("id", "identifier", "uid");

  public $types = array(
    "null" => "id",
    "string" => "NSString *",
    "integer" => "NSNumber *",
    "double" => "NSNumber *",
    "boolean" => "NSNumber *",
    "object" => "NSObject *"
  );

  public function template(&$_class)
  {
    $engine = new Handlebars(array(
      'loader' => new \Handlebars\Loader\FilesystemLoader(__DIR__.'/tpl/')
    ));

    $result = array();

    $sourceCode = $engine->render('objch', $_class);
    $_poxo = new Source();
    $_poxo->setFileName($_class->getName() . ".h");
    $_poxo->setSourceCode($sourceCode);
    array_push($result, $_poxo);

    $sourceCode = $engine->render('objcm', $_class);
    $_poxo = new Source();
    $_poxo->setFileName($_class->getName() . ".m");
    $_poxo->setSourceCode($sourceCode);
    array_push($result, $_poxo);

    return $result;
  }

  public function &classes(&$_cl, $params = null)
  {
    $_cl = parent::classes($_cl, $params);

    $cl_params = &$_cl->getParams();
    if ($params != null) {
      if (isset($params['prefix']))
      {
        $cl_params['prefix'] = $params['prefix'];
        $_cl->name = ($params['prefix'] . $_cl->getName());
      }

      if (isset($params['clean']))
        $cl_params['clean'] = $params['clean'];
    }

    $properties = &$_cl->getProperties();
    for ($i = 0; $i < count($properties); $i++) {
      $_property = &$properties[$i];
      $_params = &$_property->getParams();

      if ($_property->isArray())
      {
        // If is object and is array, we need to include "import"
        if ($_property->isObject)
          $_cl->pushImport('#import "' . $_property->getNameCapitalized() . '.h"');

        $_property->setType("NSMutableArray *");
      }
      else if ($_property->isObject)
      {
        $_cl->pushImport('#import "' . $_property->getNameCapitalized() . '.h"');
        $_property->setType($_property->getNameCapitalized() . " *");
      }

      $_params['memory'] = "strong";
    }

    $cl_params['year'] = date('Y');
    $cl_params['today'] = date('Y/m/d');
    return $_cl;
  }
}
