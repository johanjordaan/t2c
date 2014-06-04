should = require('chai').should()
expect = require('chai').expect

coffee = require 'coffee-script'

t2c = require '../main/t2c'

run_and_compare = (template,context,expected) ->
  cs = t2c.compile template 
  js = coffee.compile(cs,{bare:true})
  eval(js)
  t = template(context)
  t.should.equal expected  


describe 'compile', () ->
  it 'should do simple replacements', () ->
    run_and_compare '#| #{ctx.name}', {name:'johan'}, 'johan\n'
  
  it 'should emit newlines if an empty line is encountered', () ->
    run_and_compare '#| ', {}, '\n'