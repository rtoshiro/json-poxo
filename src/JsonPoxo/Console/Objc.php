<?php
namespace JsonPoxo\Console;

use Symfony\Component\Console\Command\Command;
use Symfony\Component\Console\Input\InputArgument;
use Symfony\Component\Console\Input\InputInterface;
use Symfony\Component\Console\Input\InputOption;
use Symfony\Component\Console\Output\OutputInterface;

use JsonPoxo;

class Objc extends Language
{
  protected function configure()
  {
    parent::configure();

    $this
      ->setName('objc')
      ->setDescription('Generates Object-C objects from JSON string (or URL)')
      ->addOption(
         'input',
         'i',
         InputOption::VALUE_REQUIRED,
         'JSON file path or URL'
      )
      ->addOption(
         'output',
         'o',
         InputOption::VALUE_REQUIRED,
         'Output directory'
      )
      ->addOption(
         'baseclass',
         'b',
         InputOption::VALUE_REQUIRED,
         'Name of base class'
      )
      ->addOption(
         'prefix',
         'p',
         InputOption::VALUE_OPTIONAL,
         'Class prefix'
      );
  }

  protected function execute(InputInterface $input, OutputInterface $output)
  {
    $opt_input = null;
    $opt_output = null;
    $opt_baseclass = null;
    $opt_prefix = null;

    $opt_input = $input->getOption('input');
    $opt_output = $input->getOption('output');
    $opt_baseclass = $input->getOption('baseclass');
    $opt_prefix = $input->getOption('prefix');

    if ($opt_input != null &&
        $opt_output != null &&
        $opt_baseclass != null)
    {
      $params = null;
      if ($opt_prefix != null)
      {
        $params = array();
        if ($opt_prefix != null)
          $params['prefix'] = $opt_prefix;
      }

      $jsonContent = null;
      if (strpos(trim($opt_input), 'http') == 0) {
        $jsonContent = file_get_contents($opt_input);
      } else {
        $jsonContent = $this->getUrl(trim($opt_input));
      }

      $json2poxo = new JsonPoxo\Parser();
      $result = $json2poxo->toX('objc', $opt_baseclass, $params, $jsonContent);

      $this->writeResults($result, $opt_output);
    }
    else {
      $output->writeln($this->asText());
    }
  }
}


 ?>
