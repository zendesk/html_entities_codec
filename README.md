# html_entities_codec
============

This is a Zendesk-maintained fork of the gem created by Paul Battley [who announced that he will no longer update his gems](https://po-ru.com/2026/10/18/why-im-no-longer-updating-this-repository).

HTMLEntities is a simple library to facilitate encoding and decoding of named
(`&yacute;` and so on) or numerical (`&#123;` or `&#x12a;`) entities in HTML
and XHTML documents.

## Installation

You will need an explicit `require` in your `Gemfile` (we renamed the gem after forking, but internally it’s still `HTMLEntities` and `htmlentities`):

```ruby
gem "html_entities_codec", require: "htmlentities"
```

## Usage

### Decoding

```ruby
require 'htmlentities'
coder = HTMLEntities.new
string = "&eacute;lan"
coder.decode(string) # => "élan"
```

### Encoding

This is slightly more complicated, due to the various options. The encode
method takes a variable number of parameters, which tell it which instructions
to carry out.

```ruby
require 'htmlentities'
coder = HTMLEntities.new
string = "<élan>"
```

Escape unsafe codepoints only:

```ruby
coder.encode(string) # => "&lt;élan&gt;"
```

Or:

```ruby
coder.encode(string, :basic) # => "&lt;élan&gt;"
```

Escape all entities that have names:

```ruby
coder.encode(string, :named) # => "&lt;&eacute;lan&gt;"
```

Escape all non-ASCII/non-safe codepoints using decimal entities:

```ruby
coder.encode(string, :decimal) # => "&#60;&#233;lan&#62;"
```

As above, using hexadecimal entities:

```ruby
coder.encode(string, :hexadecimal) # => "&#x3c;&#xe9;lan&#x3e;"
```

You can also use several options, e.g. use named entities for unsafe codepoints, then decimal for all other non-ASCII:

```ruby
coder.encode(string, :basic, :decimal) # => "&lt;&#233;lan&gt;"
```

### Flavours

HTMLEntities knows about three different sets of entities:

* `:xhtml1` – Entities from the XHTML1 doctype
* `:html4` – Entities from the HTML4 doctype. Differs from +xhtml1+ only by the absence of +&apos+
* `:expanded` – Entities from a variety of SGML sets

The default is `:xhtml`, but you can override this:

```ruby
coder = HTMLEntities.new(:expanded)
```

## Licence

This fork is distributed under the Apache License, Version 2.0, except for  inherited code originally licensed under MIT. Modifications and new contributions made for this fork are licensed under Apache 2.0. See [LICENSE](LICENSE) for the full Apache license.

Code inherited from Paul Battley's htmlentities project remains licensed under MIT. The original copyright notice and full MIT license are preserved in [COPYING.txt](COPYING.txt).

These licenses apply to their respective portions of the code; they do not offer a choice of license for the entire gem.
