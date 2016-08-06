[![Build Status](https://travis-ci.org/SkyzohKey/bbmlc.svg?branch=master)](https://travis-ci.org/SkyzohKey/bbmlc)

# The BBcode Markup Language transpiler
What if the following BBml code,

```bbcode
[!DOCTYPE html]
[html]
  [head]
    [title]The BBcode Markup Language[/title]
  [/head]
  [body]
    [h1]Use BBcode to write HTML pages[/h1]
    [h2]Who never wanted to write websites in BBcode ?[/h2]
    [p]
      The BBcode Markup language is the answer
      to peoples that always wanted to use BBcode
      in their developers lifes !
    [/p]
  [/body]
[/html]
```

...could be transpiled into valid HTML code ?  
The BBcode Markup Language gives you a simple transpiler to make that real!

So you just run this in a terminal ;
```shell
# Download bbmlc
$ cd /tmp
$ git clone https://github.com/SkyzohKey/bbml.git bbmlc && cd bbmlc

# Now install it. (`sudo` may be necessary)
$ cp bbmlc.sh /usr/bin/bbmlc

# Use it !
$ bbmlc index.bbml html

# Or import an html file to the bbml format with:
$ bbmlc index.html bblc
```

### And Enjoy it!

```html
<!DOCTYPE html>
<html>
  <head>
    <title>The BBcode Markup Language</title>
  </head>
  <body>
    <h1>Use BBcode to write HTML pages</h1>
    <h2>Who never wanted to write websites in BBcode ?</h2>
    <p>
      The BBcode Markup language is the answer
      to peoples that always wanted to use BBcode
      in their developers lifes !
    </p>
  </body>
</html>
```

# License
[The MIT License](LICENSE).
