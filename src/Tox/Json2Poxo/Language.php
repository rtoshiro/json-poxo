<?php

namespace Tox\Json2Poxo;

class Language
{
  public $reservedWords;
  public $primaryKeys;
  public $types;

  public function template(&$_class, &$_poxo) {}

  public function classes(&$cl, $params = null)
  {
    for ($i=0; $i < count($cl['properties']); $i++)
    {
      $property = &$cl['properties'][$i];

      // Search for properties that can be used as primaryKeys
      if (array_search(strtolower($property['name']), $this->primaryKeys) !== false) {
        $cl['primaryKey'] = $property['name'];
      }

      $property['name'] = $this->checkReservedWords($property['name']);

      // Translates php types to $language->types
      $property['type'] = $this->types[$property['type']];
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
