<?php
namespace Tox\Json2Poxo;

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
    "string" => "NSString *",
    "integer" => "NSNumber *",
    "double" => "NSNumber *",
    "boolean" => "NSNumber *",
    "object" => "id"
  );

  public function template(&$_class, &$_poxo)
  {
    $engine = new Handlebars(array(
      'loader' => new \Handlebars\Loader\FilesystemLoader(__DIR__.'/tpl/')
    ));

    $result = array();

    $sourceCode = $engine->render('objch', $_class);
    $_poxo['fileName'] = $_class['name'] . ".h";
    $_poxo['sourceCode'] = $sourceCode;
    array_push($result, $_poxo);

    $sourceCode = $engine->render('objcm', $_class);
    $_poxo['fileName'] = $_class['name'] . ".m";
    $_poxo['sourceCode'] = $sourceCode;
    array_push($result, $_poxo);

    return $result;
  }

  public function classes(&$_cl, $params = null)
  {
    $_cl = parent::classes($_cl, $params);

    if ($params != null) {
      if (isset($params['prefix']))
      $_cl['name'] = $params['prefix'] . $_cl['name'];
    }

    for ($i = 0; $i < count($_cl['properties']); $i++) {
      $_property = &$_cl['properties'][$i];
      $_property['isObject'] = ($_property['type'] == "id");
      $_property['isString'] = ($_property['type'] == "NSString *");
      $_property['isNumber'] = ($_property['type'] == "NSNumber *");
      // $_property['isBool'] = ($_property['type'] == "BOOL");

      $_property['uppername'] = strtoupper($_property['name']);
      $_property['capname'] = ucwords($_property['name']);
      if (isset($params['prefix']) && $_property['isObject']) {
        $_property['capname'] = $params['prefix'] . $_property['capname'];
      }

      if ($_property['isArray']) {
        $_property['type'] = "NSMutableArray *";
      } else if ($_property['type'] == 'id') {
        $_property['type'] = ucwords($_property['originalName']) . " *";
      }

      $_property['memory'] = "strong";
      // if ($_property['type'] == "BOOL"){
      //   $_property['memory'] = "assign";
      // }
    }

    $_cl['year'] = date('Y');
    $_cl['today'] = date('Ymd');
    $_cl['capkey'] = ($_cl['primaryKey'] ? strtoupper($_cl['primaryKey']) : false);
    return $_cl;
  }
}
