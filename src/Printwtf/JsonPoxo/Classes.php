<?php namespace Printwtf\JsonPoxo;

/**
* Represents a new class from a JSON object
* just because JSON schema doesn't support
* decimals
*/
class Classes
{
  public $name;
  public $nameCapitalized;
  public $nameUppercase;
  public $originalName;

  public $primaryKey;
  public $primaryKeyCapitalized;

  public $primaryKeyType;

  /**
  * Array with all object properties (Property objects)
  */
  public $properties;

  public $imports;
  public $params;

  public $renderMode;

  public function __construct($name)
  {
    $this->setName($name);
    $this->originalName = $name;
    $this->params = array();
    $this->properties = array();
  }

  public function getName() {
      return $this->name;
  }

  public function setName($name) {
      $this->name = Classes::normalize($name);
      $this->nameUppercase = strtoupper($this->name);
      $this->nameCapitalized = ucfirst(strtolower($this->name));

      return $this;
  }

  public function getNameCapitalized() {
      return $this->nameCapitalized;
  }

  public function getNameUppercase() {
      return $this->nameUppercase;
  }

  public function setPrimaryKey($primaryKey) {
      $this->primaryKey = $primaryKey;
      $this->primaryKeyCapitalized = ucfirst(strtolower($primaryKey));
      return $this;
  }

  public function getPrimaryKey() {
      return $this->primaryKey;
  }

  public function getPrimaryKeyCapitalized() {
      return $this->primaryKeyCapitalized;
  }

  public function getPrimaryKeyType() {
      return $this->primaryKeyType;
  }

  public function setPrimaryKeyType($primaryKeyType) {
    $this->primaryKeyType = $primaryKeyType;
    return $this;
  }

  public function &getProperties() {
      return $this->properties;
  }

  public function &getImports() {
      return $this->imports;
  }

  public function setImports($imports) {
      $this->imports = $imports;
      return $this;
  }

  public function &getParams() {
      return $this->params;
  }

  public function setParams($params) {
      $this->params = $params;
      return $this;
  }

  public function pushProperty($newProperty)
  {
    for ($i=0; $i < count($this->properties); $i++) {
      $property = &$this->properties[$i];
      if ($property->getName() == $newProperty->getName())
        return;
    }
    if ($this->properties == null) $this->properties = array();
    array_push($this->properties, $newProperty);
    return $newProperty;
  }

  public function pushImport($newImport)
  {
    if (strpos($this->imports, $newImport) === false)
      $this->imports = $this->imports . "\n" . $newImport;
    return $this->imports;
  }

  public static function clean($string)
  {
    $string = str_replace(' ', '_', $string);
    if(is_numeric(substr($string, 0, 1))) {
      $string = str_replace($string, '_', substr($string, 0, 1), 1);
    }
    return preg_replace('/[^A-Za-z0-9\-]/', '_', $string);
  }

  public static function normalize($name)
  {
    $name = Classes::clean($name);
    return strtolower($name);
  }
}
