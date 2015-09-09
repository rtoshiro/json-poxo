<?php

namespace Tox\Json2Poxo\Language;

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

      $property['name'] = $this->checkReservedWords($property['name']);

      // Translates php types to $language->types
      $property['type'] = $this->types[$property['type']];

      // Search for properties that can be used as primaryKeys
      if (array_search(strtolower($property['originalName']), $this->primaryKeys) !== false) {
        $cl['primaryKey'] = $property['name'];
        $cl['primaryKeyType'] = $property['type'];
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
