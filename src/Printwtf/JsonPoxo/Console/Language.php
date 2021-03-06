<?php
namespace Printwtf\JsonPoxo\Console;

use Symfony\Component\Console\Command\Command;
use Symfony\Component\Console\Input\InputArgument;
use Symfony\Component\Console\Input\InputInterface;
use Symfony\Component\Console\Input\InputOption;
use Symfony\Component\Console\Output\OutputInterface;

use JsonPoxo;

class Language extends Command
{
  protected function configure()
  {
    parent::configure();
  }

  protected function getURL($url)
  {
    $ch = curl_init();
    curl_setopt($ch, CURLOPT_URL,            $url);
    curl_setopt($ch, CURLOPT_RETURNTRANSFER, true);
    curl_setopt($ch, CURLOPT_POST,           false);
    $result = curl_exec($ch);
    curl_close($ch);
    return($result);
  }

  protected function writeFile($filePath, $text)
  {
    $dir = dirname($filePath);
    if (!file_exists($dir)) {
      mkdir($dir, 0755, true);
    }

    $fp = fopen($filePath, 'w');
    fwrite($fp, $text);
    fclose($fp);
  }

  protected function writeResults($result, $outputDir)
  {
    $dir = dirname($outputDir) . '/' . basename($outputDir);
    for ($i = 0; $i < count($result); $i++)
    {
      $item = $result[$i];
      $filePath = $dir . '/' . $item->getFileName();
      $this->writeFile($filePath, $item->getSourceCode());
    }
  }
}

 ?>
