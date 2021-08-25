local g = vim.g -- Set global dictionary
local o = vim.o -- Set option
local wo = vim.wo -- Set window-scoped local-option
local api = vim.api -- Invoke Nvim API function
local cmd = vim.cmd -- Execute Vimscript
local opt = vim.opt

local function map(mode, lhs, rhs, opts)
  local options = {noremap = true}
  if opts then options = vim.tbl_extend('force', options, opts) end
  vim.api.nvim_set_keymap(mode, lhs, rhs, options)
end

-- Make leader <space>
g.mapleader = " "

-- Line numbers
wo.number = true
o.relativenumber = true
api.nvim_exec([[ autocmd InsertEnter * :set norelativenumber ]], false)
api.nvim_exec([[ autocmd InsertLeave * :set relativenumber ]], false)

-- Highlight current line
o.cursorline = true

-- Enable mouse mode
o.mouse = 'a'

-- Scrolling
o.scrolloff = 3
o.sidescrolloff = 3

-- Case insensitive searching UNLESS /C or capital in search
o.ignorecase = true
o.smartcase = true

o.smartindent = true
o.smarttab = true
o.shiftwidth = 0
o.softtabstop = -1
o.tabstop = 2
o.expandtab = true

-- Show cursor line only in active window
cmd([[
  autocmd InsertLeave,WinEnter * set cursorline
  autocmd InsertEnter,WinLeave * set nocursorline
]])

-- Always show the signcolumn
opt.signcolumn = "yes"

-- Decrease update time
o.updatetime = 250

-- Show eol character
vim.opt.list = true
vim.opt.listchars = {
  eol = "↲"
}

-- Highlight on yank
cmd("au TextYankPost * lua vim.highlight.on_yank {}")

-- Y yank until the end of line
map('n', 'Y', 'y$')

-- Copy to clipboard
map('v', '<leader>y', '"+y')
map('n', '<leader>y', '"+y')
map('n', '<leader>Y', '"+yg_')

-- Paste from clipboard
map('n', '<leader>p', '"+p')
map('n', '<leader>P', '"+P')
map('v', '<leader>p', '"+p')
map('v', '<leader>P', '"+P')

-- Set wrap symbol (or no wrap)
api.nvim_exec([[ let &showbreak='⤷ ' ]], true)
-- wo.nowrap = true -- Display long lines as just one line

-- No swapfiles
