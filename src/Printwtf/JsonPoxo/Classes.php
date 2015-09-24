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
    $this->params = array();
    $this->properties = array();
  }

  public function getName() {
      return $this->name;
  }

  public function setName($name) {
      $this->name = $name;
      $this->nameUppercase = strtoupper($name);
      $this->nameCapitalized = ucfirst(strtolower($name));

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
}
