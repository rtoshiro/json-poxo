<?php namespace Tox\Json2Poxo;

class Properties
{
  public $name;
  public $nameCapitalized;
  public $nameUppercase;

  public $originalName;
  public $originalNameCapitalized;
  public $originalNameUppercase;

  public $type;
  public $isArray;
  public $params;

  public function __construct($name, $type, $isArray)
  {
    $this->setName($name);
    $this->type = $type;
    $this->isArray = $isArray;
  }

  public function getName() {
    return $this->name;
  }

  public function setName($name) {
      $this->name = $name;
      $this->nameUppercase = strtoupper($name);
      $this->nameCapitalized = ucwords($name);

      return $this;
  }

  public function getNameCapitalized() {
      return $this->nameCapitalized;
  }

  public function getNameUppercase() {
      return $this->nameUppercase;
  }

  public function setOriginalName($originalName) {
    $this->originalName = $originalName;
    $this->originalNameCapitalized = ucwords($originalName);
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

  public function getParams() {
      return $this->params;
  }

  public function setParams($params) {
      $this->params = $params;
      return $this;
  }

}
