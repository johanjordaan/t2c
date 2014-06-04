t2c  ![Travis CI Status](https://api.travis-ci.org/johanjordaan/t2c.svg?branch=master "Travis CI Status")
=========

This is a very simple templating engine. It is diffrent from other templating engines since it prodices code which will produce the output. It is further code centric and the text to be emitted is escaped, not the code. I believe this produces better looking template output.

Install
=========

`npm install t2c`

or 

`bower install t2c`

Usage
=========
t2c generates code which you include in your peoject. You then use this code to generate output based on a context. Thw workflow followis the folling progression : 
* Create a template.t2c file that contains the template and code.
* Compile the template.t2c to template.coffee using the t2c code.
* Compile the teample.coffee file to template.js.

PS: Have a look at grunt-t2c for a grunt task that does step 2 as a grun task. 

Here is a template example:
```
surnames = ['Jordaan','Smith']
for surname in surnames 
  #| Hallo from  #{ctx.name} surname
```
All indentation after the escape string `#| ` is emitted in the final template. All spaces/tabs before the escape string is relevant in the context of the code.

This will produce the following coffee script:
```
template = (ctx) ->
  output = ''
  surnames = ['Jordaan','Smith']
  for surname in surnames 
    output += "Hallo from  #{ctx.name} #{surname}\n"
module.exports = template
```

You can then use this template in you own code like this:
```
template = require './template'
context = {name:'johan'}
result = template.template(context)
```

To use t2c directly in your own code :
```
coffee = 
t2c = require 't2c'
cs = t2c.compile template_string 
js = coffee.compile(cs,{bare:true})
eval(js)
result = template(context)  
```






