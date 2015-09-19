<?php

namespace JsonPoxo\Language;

class Language
{
  public $reservedWords;
  public $primaryKeys;
  public $types;

  // Return an array of Poxo
  public function template(&$_class) {}

  public function &classes(&$cl, $params = null)
  {
    $properties = &$cl->getProperties();
    for ($i=0; $i < count($properties); $i++)
    {
      $property = &$properties[$i];

      $property->setName($this->checkReservedWords($property->getName()));

      // Translates php types to $language->types
      $property->setType($this->types[$property->getType()]);

      // Search for properties that can be used as primaryKeys
      if (array_search(strtolower($property->getOriginalName()), $this->primaryKeys) !== false) {
        $cl->setPrimaryKey($property->getName());
        $cl->setPrimaryKeyType($property->getType());
      }
    }
    return $cl;
  }

  // Checks if property's name is equal to a reserved word.
  public function checkReservedWords($name)
  {
    for ($i = 0; $i < count($this->reservedWords); $i++)
    {
      $reserved = $this->reservedWords[$i];
      if (strtolower($name) == strtolower($reserved)) {
        return "_" . $name;
      }
    }

    return $name;
  }
}
 ?>
