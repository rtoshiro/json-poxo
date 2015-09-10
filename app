#!/usr/bin/env php
<?php
require __DIR__.'/vendor/autoload.php';

use Symfony\Component\Console\Application;

$javaCmd = new Tox\Json2Poxo\Console\Java();
$objcCmd = new Tox\Json2Poxo\Console\Objc();

$application = new Application('Json2Poxo Application', '1.0');
$application->add($javaCmd);
$application->add($objcCmd);
$application->run();

# $json = new Json2Poxo();
