<?php namespace Tox\Json2Poxo;

class Poxo
{
  public $fileName;
  public $sourceCode;

  public function getFileName() {
      return $this->fileName;
  }

  public function setFileName($fileName) {
      $this->fileName = $fileName;
      return $this;
  }

  public function getSourceCode() {
      return $this->sourceCode;
  }

  public function setSourceCode($sourceCode) {
      $this->sourceCode = $sourceCode;
      return $this;
  }


}
