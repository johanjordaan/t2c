template = (ctx) ->
  output = ''
  surnames = ['Jordaan','Evert']
  for surname in surnames 
    output += "Hallo #{ctx.name}"
  
module.exports = template