# bool

[![Build Status](https://travis-ci.org/cucumber/bool.png)](https://travis-ci.org/cucumber/bool)

This is a cross-platform library for parsing boolean arithmetic expressions like `a && b && (!c || !d)` and evaluating them by assigning values to the variables.

Boolean expressions are parsed into an [abstract syntax tree](http://en.wikipedia.org/wiki/Abstract_syntax_tree) (AST) using a 
lexer/parser generated by various Lex/Yacc clones for the various programming languages. This allows grammars to be fairly similar 
across languages.

Evaluation of the boolean expressions is done by traversing the AST with a visitor. (This is obviously overkill for something as 
simple as boolean expressions, keep reading to understand why).

Supported platforms are Ruby, JRuby, Java and JavaScript. The Ruby gem uses a C extension (for speed) and the JRuby gem uses a Java 
extension (also for speed). Support for e.g. Python could be added easily by using the same C code as the Ruby gem. Java programs (or 
any other JVM-based program such as Scala or Clojure) can also use the Java library as-is.

## Why?

The purpose of this library is twofold.

First, it serves as a simple example of how to build a custom interpreted language with a fast lexer/parser that build a 
visitor-traversable AST, and that runs on many different platforms. People who want to build a bigger cross-platform language could 
leverage the structure and build files in this project. A new [Gherkin](https://github.com/cucumber/gherkin) 3.0 project may use this 
project as a template.

Second, this project actually has a use. The Cucumber project may use it to evaluate _tag expressions_ as current Cucumber 
implementations don't have a proper parser for this.

## Building for all platforms

If you're lucky and already have all the needed software installed you can just run

```
make
```

If that fails for you (it probably will the first time), don't worry. Follow the OS-specific instructions below and try again. 
If you still run into problems, see the relevant READMEs in the sub directories.

You are definitely going to need [GNU Bison](http://www.gnu.org/software/bison/) 2.7 or newer to build any platform library (except for the JavaScript library).

If you don't already have Bison 2.7 installed then the top level `Makefile` will install it into `./bison-2.7`.

### OS X

OS X ships with an old Bison we can't use. If you prefer to install Bison 2.7 with [Homebrew](http://mxcl.github.com/homebrew/) instead of under `./bison-2.7`,
then you must first install [Homebrew-Dupes](https://github.com/Homebrew/homebrew-dupes) 
before you can install Bison and the other requirements:

```
brew tap homebrew/dupes
brew install bison flex wget node
```

### Ubuntu

Ubuntu users can install the needed software with:

```
sudo apt-get install bison flex wget node mingw32
```

At the time of this writing, `apt-get` will install Bison 2.5, which is too old, so the `Makefile` will install `./bison-2.7` anyway.
When `apt-get` installs Bison 2.7 some day in the future this step will be skipped.

### Fedora

Fedora 18 can install the needed software with:

```
yum install bison flex wget node mingw32-gcc
```
