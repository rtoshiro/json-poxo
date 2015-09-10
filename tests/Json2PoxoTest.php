<?php
use PHPUnit_Framework_TestCase as PHPUnit;
use Tox\Json2Poxo\Json2Poxo;

class Json2PoxoTest extends PHPUnit
{
  public $json;
  public $rootClassName = 'RootClass';
  public $todayString = 'DATA_DE_HOJE';

  public function setUp()
  {
    $this->json = array(
      'id' => 'primaryKey',
      'str' => 'some string',
      'num' => 1,
      'flo' => 1.99,
      'boo' => false,
      'arrnum' => array(1, 2, 3),
      'arrstr' => array('1', '2', '3'),
      'arrboo' => array(true, false, true),
      'arrnull' => array(),
      'obj' => array(
        'str' => 'another string',
        'num' => 2,
        'flo' => 2.5,
        'boo' => true,
      ),
      'arrobj' => array(
        array(
          'str' => '3th string',
          'num' => 3,
          'flo' => 3.5,
          'boo' => true,
          'null' => null
        )
      )
    );
  }

  public function tearDown()
  {

  }

  public function loadTemplates($assetName)
  {
    $files = array();
    $dir = __DIR__ . '/assets/' . $assetName . '/';

    if ($dh = opendir($dir)) {
      while (($file = readdir($dh)) !== false) {
        array_push($files, ($dir . $file));
      }
      closedir($dh);
    }

    $templates = array();
    for ($i=0; $i < count($files); $i++) {
      $file = $files[$i];
      $templates[basename($file)] = file_get_contents($file);
    }

    return $templates;
  }

  public function parseResult($result)
  {
    $this->assertNotNull($result);
  }

  public function testParse()
  {
    $result = array();
    $json2poxo = new Json2Poxo();
    $parsed = $json2poxo->parse($this->json, $this->rootClassName, $result);

    $this->parseResult($result);
  }

  public function testClasses()
  {
    $json2poxo = new Json2Poxo();
    $result = $json2poxo->classes($this->rootClassName, $this->json);

    $this->parseResult($result);
  }

  public function testJava()
  {
    $json2poxo = new Json2Poxo();

    $result = $json2poxo->toX('java', $this->rootClassName, null, $this->json);

    $this->assertNotNull($result);
    $this->assertCount(4, $result);
    for ($i=0; $i < count($result); $i++) {
      $model = $result[$i];
      $this->assertNotNull($model->getFileName());
      $this->assertNotNull($model->getSourceCode());
      $this->writeFile(__DIR__ . '/assets/java01/'.$model->getFileName(), $model->getSourceCode());

      $this->assertEquals($this->loadTemplates('java01')[$model->getFileName()], $model->getSourceCode());
    }
  }

  public function testJavaWithGson()
  {
    $json2poxo = new Json2Poxo();

    $result = $json2poxo->toX('java', $this->rootClassName, array('includeGson' => true), $this->json);
    $this->assertNotNull($result);
    $this->assertCount(4, $result);
    for ($i=0; $i < count($result); $i++) {
      $model = $result[$i];
      $this->assertNotNull($model->getFileName());
      $this->assertNotNull($model->getSourceCode());
      $this->writeFile(__DIR__ . '/assets/java02/'.$model->getFileName(), $model->getSourceCode());

      $this->assertEquals($this->loadTemplates('java02')[$model->getFileName()], $model->getSourceCode());
    }
  }

  public function testObjc()
  {
    $json2poxo = new Json2Poxo();
    $result = $json2poxo->toX('objc', $this->rootClassName, null, $this->json);

    $this->assertNotNull($result);
    $this->assertCount(8, $result);
    for ($i=0; $i < count($result); $i++) {
      $model = $result[$i];
      $this->assertNotNull($model->getFileName());
      $this->assertNotNull($model->getSourceCode());
    }

    for ($i=0; $i < count($result); $i++) {
      $model = $result[$i];
      $dateStr = date('Ymd');

      $newSource = str_replace($dateStr, $this->todayString, $model->getSourceCode());
      $newSource = str_replace("Copyright (c) ".date('Y').". All rights reserved", 'Copyright (c) 2015. All rights reserved', $newSource);
      $this->writeFile(__DIR__ . '/assets/objc01/'.$model->getFileName(), $newSource);

      $this->assertEquals($this->loadTemplates('objc01')[$model->getFileName()], $newSource);
    }
  }

  public function testObjcWithPrefix()
  {
    $json2poxo = new Json2Poxo();
    $result = $json2poxo->toX('objc', $this->rootClassName, array('prefix' => 'PREFIX'), $this->json);
    $this->assertNotNull($result);
    $this->assertCount(8, $result);
    for ($i=0; $i < count($result); $i++) {
      $model = $result[$i];
      $this->assertNotNull($model->getFileName());
      $this->assertNotNull($model->getSourceCode());
    }

    for ($i=0; $i < count($result); $i++) {
      $model = $result[$i];
      $dateStr = date('Ymd');

      $newSource = str_replace($dateStr, $this->todayString, $model->getSourceCode());
      $newSource = str_replace("Copyright (c) ".date('Y').". All rights reserved", 'Copyright (c) 2015. All rights reserved', $newSource);
      $this->writeFile(__DIR__ . '/assets/objc02/'.$model->getFileName(), $newSource);

      $this->assertEquals($this->loadTemplates('objc02')[$model->getFileName()], $newSource);
    }
  }

  public function writeFile($filePath, $text)
  {
    $fp = fopen($filePath, 'w');
    fwrite($fp, $text);
    fclose($fp);
  }

  // public function writeFile($filePath, $text)
  // {
  //   $fp = fopen($dir = __DIR__ . '/assets/'.$model->getFileName(), 'w');
  //   fwrite($fp, $newSource);
  //   fclose($fp);
  // }

}
