var coffee, expect, run_and_compare, should, t2c;

should = require('chai').should();

expect = require('chai').expect;

coffee = require('coffee-script');

t2c = require('../main/t2c');

run_and_compare = function(template, context, expected) {
  var cs, js, t;
  cs = t2c.compile(template);
  js = coffee.compile(cs, {
    bare: true
  });
  eval(js);
  t = template(context);
  return t.should.equal(expected);
};

describe('compile', function() {
  it('should do simple replacements', function() {
    return run_and_compare('#| #{ctx.name}', {
      name: 'johan'
    }, 'johan\n');
  });
  return it('should emit newlines if an empty line is encountered', function() {
    return run_and_compare('#| ', {}, '\n');
  });
});
