Clap
====

Command line argument parsing for simple applications.

Description
-----------

Clap is a small library that can be bundled with your command line application.
It covers the simple case of executing code based on the flags or parameters
passed, and it does so with just under 30 lines of code.

Usage
-----

Using Clap is simple: just pass `ARGV` and a hash of flags, and it will extract
the arguments as needed.

    Clap.run(ARGV,
      "-a" => lambda { |param| ... },
      "-b" => lambda { ... }

To better illustrate the usage, in the following examples `ARGV` is replaced by
an array of strings.

If you want your command line application to require a file or display a
version number, you can configure it like this:

    Clap.run(%w(-r foo -v),
      "-r" => lambda { |file| require file },
      "-v" => lambda { puts VERSION }

This will detect the `-r` or `-v` flags and act accordingly. Note that it will
also read the necessary number of parameters for each flag based on the arity
of the passed lambda.

Another example, for an application that takes a `-v` flag and also a list of
files:

    files = Clap.run(%w(-v foo bar),
      "-v" => lambda { puts VERSION }

    files == %w(foo bar)

If you are in doubt, check the tests for the different use cases.

Installation
------------

    $ gem install clap

License
-------

Copyright (c) 2010 Michel Martens

Permission is hereby granted, free of charge, to any person
obtaining a copy of this software and associated documentation
files (the "Software"), to deal in the Software without
restriction, including without limitation the rights to use,
copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the
Software is furnished to do so, subject to the following
conditions:

The above copyright notice and this permission notice shall be
included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND,
EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES
OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND
NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT
HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY,
WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING
FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR
OTHER DEALINGS IN THE SOFTWARE.
