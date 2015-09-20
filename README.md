json2poxo
=========

PHP executable (or library) -  **json-poxo** generates "plain old x objects" from JSON. 


## Command line interface

Install json-poxo with Composer:

    composer require printwtf/json-poxo

Generating POJO (Java) from JSON

    json-poxo.phar java --input file.json --ouput newDirectory --base baseClassName --package com.github.rtoshiro --gson true

### Languages

```
$ json-poxo

Usage: json-poxo.phar <command>

Commands:
  java  Parse JSON and generates Java classes (POJO)
  objc  Parse JSON and generates Objective-C files (.h and .m)
```

### Options (java)

```
Options:
  -i, --input    Input file path or URL (GET)
  -o, --output   Output directory
  -b, --base     Name of JSON root class
  -p, --package  Package name
  -g, --gson     Includes GSON annotations
```

### Options (objc)

```
Options:
  -i, --input   Input file path or URL (GET)
  -o, --output  Output directory
  -b, --base    Name of JSON root class
  -p, --prefix  Class prefix
```

More languages will be come.


## MIT License

Copyright (C) 2015 Toshiro Sugii

Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
