local g = vim.g

g.tokyonight_style = "night"
g.tokyonight_italic_comments = true
g.tokyonight_italic_keywords = true
g.tokyonight_italic_functions = false
g.tokyonight_italic_variables = false
g.tokyonight_hide_inactive_statusline = false

-- Load the colorscheme
require("tokyonight").colorscheme()
