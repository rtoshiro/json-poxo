<?php
namespace Tox\Json2Poxo\Console;

use Symfony\Component\Console\Command\Command;
use Symfony\Component\Console\Input\InputArgument;
use Symfony\Component\Console\Input\InputInterface;
use Symfony\Component\Console\Input\InputOption;
use Symfony\Component\Console\Output\OutputInterface;

use Tox\Json2Poxo\Json2Poxo;

class Java extends Language
{
  protected function configure()
  {
    parent::configure();

    $this
      ->setName('java')
      ->setDescription('Generates Java objects from JSON string (or URL)')
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
         'package',
         'p',
         InputOption::VALUE_OPTIONAL,
         'Package name'
      )
      ->addOption(
         'includeGson',
         'g',
         InputOption::VALUE_OPTIONAL,
         'If set, the task will include Gson serializable names'
      );
  }

  protected function execute(InputInterface $input, OutputInterface $output)
  {
    $opt_input = null;
    $opt_output = null;
    $opt_baseclass = null;
    $opt_package = null;
    $opt_includeGson = null;

    $opt_input = $input->getOption('input');
    $opt_output = $input->getOption('output');
    $opt_baseclass = $input->getOption('baseclass');
    $opt_package = $input->getOption('package');
    $opt_includeGson = $input->getOption('includeGson');

    if ($opt_input != null &&
        $opt_output != null &&
        $opt_baseclass != null)
    {
      $params = null;
      if ($opt_package != null || $opt_includeGson != null)
      {
        $params = array();
        if ($opt_package != null)
          $params['package'] = $opt_package;
        if ($opt_includeGson != null)
          $params['includeGson'] = $opt_includeGson;
      }

      $jsonContent = null;
      if (strpos(trim($opt_input), 'http') == 0) {
        $jsonContent = file_get_contents($opt_input);
      } else {
        $jsonContent = $this->getUrl(trim($opt_input));
      }

      $json2poxo = new Json2Poxo();
      $result = $json2poxo->toX('java', $opt_baseclass, $params, $jsonContent);

      $this->writeResults($result, $opt_output);
    }
    else {
      $output->writeln($this->asText());
    }
  }
}


 ?>
