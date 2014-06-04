var t2c;

t2c = {
  compile: function(t, source_file) {
    var emit_char, fragments, indent, indent_offset, line, lines, text, trimmed_line, _i, _len;
    emit_char = '#| ';
    fragments = [];
    lines = t.split('\n');
    fragments.push("`// This file was generate from a template using t2c");
    fragments.push(" // Source file : " + source_file + " ");
    fragments.push(" // `");
    fragments.push("template = (ctx) ->");
    fragments.push("  output = ''");
    indent = "";
    for (_i = 0, _len = lines.length; _i < _len; _i++) {
      line = lines[_i];
      trimmed_line = line.trim();
      if (trimmed_line.indexOf(emit_char) === 0) {
        indent_offset = line.indexOf(emit_char);
        indent = line.substring(0, indent_offset);
        text = trimmed_line.substring(emit_char.length);
        fragments.push(("  " + indent) + 'output += "' + ("" + text) + '\n"');
      } else {
        fragments.push("  " + line);
      }
    }
    fragments.push("module.exports = template");
    return fragments.join('\n');
  }
};

if (typeof module !== "undefined" && module !== null) {
  module.exports = t2c;
}

if (typeof define !== "undefined" && define !== null) {
  define([], function() {
    return t2c;
  });
}
