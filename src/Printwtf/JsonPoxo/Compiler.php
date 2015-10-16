<?php
namespace Printwtf\JsonPoxo;

use Symfony\Component\Finder\Finder;
use Symfony\Component\Process\Process;

class Compiler
{
    protected $version;

    /**
     * Compiles the Cilex source code into one single Phar file.
     *
     * @param string $pharFile Name of the output Phar file
     */
    public function compile($pharFile = 'json-poxo.phar')
    {
        if (file_exists($pharFile)) {
            unlink($pharFile);
        }

        $process = new Process('git log --pretty="%h %ci" -n1 HEAD');
        if ($process->run() > 0) {
            throw new \RuntimeException('The git binary cannot be found.');
        }
        $this->version = trim($process->getOutput());

        $phar = new \Phar($pharFile, 0, 'json-poxo.phar');
        $phar->setSignatureAlgorithm(\Phar::SHA1);

        $phar->startBuffering();

        $finder = new Finder();
        $finder->files()
            ->ignoreVCS(true)
            ->name('*.php')
            ->notName('Compiler.php')
            ->in(__DIR__.'/../../')
            // ->in(__DIR__.'/../../vendor/xamin/')
            ->in(__DIR__.'/../../../vendor/composer/')
            ->in(__DIR__.'/../../../vendor/doctrine/')
            ->in(__DIR__.'/../../../vendor/psr/')
            ->in(__DIR__.'/../../../vendor/symfony/')
            ->in(__DIR__.'/../../../vendor/twig/')
            ->in(__DIR__.'/../../../vendor/xamin/');

        foreach ($finder as $file) {
            $this->addFile($phar, $file);
        }

        $this->addFile($phar, new \SplFileInfo(__DIR__.'/../../../LICENSE'), false);
        $this->addFile($phar, new \SplFileInfo(__DIR__.'/../../../vendor/autoload.php'));
        $this->addFile($phar, new \SplFileInfo(__DIR__.'/../../../vendor/composer/autoload_psr4.php'));
        $this->addFile($phar, new \SplFileInfo(__DIR__.'/../../../vendor/composer/autoload_files.php'));
        $this->addFile($phar, new \SplFileInfo(__DIR__.'/../../../vendor/composer/ClassLoader.php'));
        $this->addFile($phar, new \SplFileInfo(__DIR__.'/../../../vendor/composer/autoload_real.php'));
        $this->addFile($phar, new \SplFileInfo(__DIR__.'/../../../vendor/composer/autoload_namespaces.php'));
        $this->addFile($phar, new \SplFileInfo(__DIR__.'/../../../vendor/composer/autoload_classmap.php'));
        if (file_exists(__DIR__.'/../../../vendor/composer/include_paths.php')) {
            $this->addFile($phar, new \SplFileInfo(__DIR__.'/../../../vendor/composer/include_paths.php'));
        }

        $this->addExecutable($phar);

        // Stubs
        $stub = $this->getStub();
        $phar->setStub($stub);

        $phar->stopBuffering();

        unset($phar);
    }

    private function addExecutable($phar)
    {
        $content = file_get_contents(__DIR__.'/../../../bin/app');
        $content = preg_replace('{^#!/usr/bin/env php\s*}', '', $content);
        $phar->addFromString('bin/app', $content);
    }

    protected function addFile(\Phar $phar, \splFileInfo $file, $strip = true)
    {
        $path = str_replace(dirname(dirname(dirname(__DIR__))).DIRECTORY_SEPARATOR, '', $file->getRealPath());

        $content = file_get_contents($file);
        if ($strip) {
            $content = self::stripWhitespace($content);
        }

        $phar->addFromString($path, $content);
    }

    protected function getStub()
    {
      $stub = <<<'EOF'
#!/usr/bin/env php
<?php
Phar::mapPhar('json-poxo.phar');
require 'phar://json-poxo.phar/bin/app';
EOF;

      // return file_get_contents(__DIR__.'/../../../bin/app') . "\n__HALT_COMPILER();";
      $stub = $stub . "\n__HALT_COMPILER();";
      return $stub;
    }

    /**
     * Removes whitespace from a PHP source string while preserving line numbers.
     *
     * Based on Kernel::stripComments(), but keeps line numbers intact.
     *
     * @param string $source A PHP string
     *
     * @return string The PHP string with the whitespace removed
     */
    public static function stripWhitespace($source)
    {
        if (!function_exists('token_get_all')) {
            return $source;
        }

        $output = '';
        foreach (token_get_all($source) as $token) {
            if (is_string($token)) {
                $output .= $token;
            } elseif (in_array($token[0], array(T_COMMENT, T_DOC_COMMENT))) {
                $output .= str_repeat("\n", substr_count($token[1], "\n"));
            } elseif (T_WHITESPACE === $token[0]) {
                // reduce wide spaces
                $whitespace = preg_replace('{[ \t]+}', ' ', $token[1]);
                // normalize newlines to \n
                $whitespace = preg_replace('{(?:\r\n|\r|\n)}', "\n", $whitespace);
                // trim leading spaces
                $whitespace = preg_replace('{\n +}', "\n", $whitespace);
                $output .= $whitespace;
            } else {
                $output .= $token[1];
            }
        }

        return $output;
    }
}
