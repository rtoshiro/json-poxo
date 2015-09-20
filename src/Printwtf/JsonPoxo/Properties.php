<?php namespace Printwtf\JsonPoxo;

class Properties
{
  public $name;
  public $nameCapitalized;
  public $nameUppercase;

  public $originalName;
  public $originalNameCapitalized;
  public $originalNameUppercase;

  public $type;
  public $params;

  // Php types
  public $isArray;
  public $isObject;
  public $isString;
  public $isInterger;
  public $isDouble;
  public $isNull;
  public $isBoolean;

  public $arrayDepth;

  public function __construct($name, $type, $isArray)
  {
    $this->setName($name);
    $this->setOriginalName($name);
    $this->setType($type);
    $this->setIsArray($isArray);
    $this->setParams(array());

    $this->arrayDepth = 0;
  }

  public function getName() {
    return $this->name;
  }

  public function setName($name) {
      $this->name = Properties::normalize($name);
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

  public function setOriginalName($originalName) {
    $this->originalName = str_replace('"', '\"', $originalName);
    $this->originalNameCapitalized = ucfirst($originalName);
    $this->originalNameUppercase = strtoupper($originalName);
      return $this;
  }

  public function getOriginalName() {
      return $this->originalName;
  }

  public function getOriginalNameCapitalized() {
      return $this->originalNameCapitalized;
  }

  public function getOriginalNameUppercase() {
      return $this->originalNameUppercase;
  }

  public function getType() {
      return $this->type;
  }

  public function setType($type) {
      $this->type = $type;
      return $this;
  }

  public function isArray() {
      return $this->isArray;
  }

  public function setIsArray($isArray) {
      $this->isArray = $isArray;
      return $this;
  }

  public function &getParams() {
      return $this->params;
  }

  public function setParams($params) {
      $this->params = $params;
      return $this;
  }

  public function incrementArrayDepth()
  {
    $this->arrayDepth++;
  }

  public static function clean($string)
  {
    $string = str_replace(' ', '_', $string);
    return preg_replace('/[^A-Za-z0-9\-]/', '_', $string);
  }

  public static function normalize($name)
  {
    $name = Properties::clean($name);
    return strtolower($name);
  }
}
