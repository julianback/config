local g = vim.g -- Set global dictionary

-- show │ every indent
g.indent_blankline_char = "│"
g.indent_blankline_buftype_exclude = {
  'terminal', 'nofile',
--  "" -- for all buffers without a file type
}
g.indent_blankline_filetype_exclude = {
  'help',
  'packer',
  "TelescopePrompt",
  "txt"
}
g.indent_blankline_use_treesitter = true
g.indent_blankline_show_current_context = true
g.indent_blankline_context_patterns = {
  "class",
  "function",
  "block",
  "list_literal",
  "selector",
  "^table",
  "while",
  "for",
  "return",
  "method",
  "^if",
  "^while",
  "^for",
  "^object",
  "arguments",
  "if_statement",
  "else_clause",
  "jsx_element",
  "jsx_self_closing_element",
  "try_statement",
  "catch_clause",
  "import_statement",
  "operation_type",
  "array",
}
g.indent_blankline_show_trailing_blankline_indent = false
g.indent_blankline_space_char_blankline = " "
g.indent_blankline_space_char = '⋅'
