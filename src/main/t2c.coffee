t2c =
  compile : (t,source_file) ->
    emit_char = '#| '

    fragments = []
    lines = t.split '\n'

    fragments.push "`// This file was generate from a template using t2c"
    fragments.push " // Source file : #{source_file} "
    fragments.push " // `"
    fragments.push "template = (ctx) ->"
    fragments.push "  output = ''"
    indent = ""
    for line in lines
      trimmed_line = line.trim()

      if trimmed_line.indexOf(emit_char) == 0
        indent_offset = line.indexOf(emit_char)
        indent = line.substring(0,indent_offset)
        text = trimmed_line.substring(emit_char.length)
        fragments.push  "  #{indent}"+'output += "'+"#{text}"+'\\n"'
      else if trimmed_line.indexOf(emit_char.trim()) == 0
        fragments.push  "  #{indent}"+'output += "'+'\\n"'
      else
        fragments.push "  #{line}"
    fragments.push "module.exports = template"    

    return fragments.join('\n')

if module?
  module.exports = t2c

if define?
  define [],()->
    return t2c

