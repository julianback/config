local function map_tele(lhs, f, opts)
  local options = { noremap = true, silent = true }
  if opts then options = vim.tbl_extend('force', options, opts) end
  local mode = "n"
  local rhs = string.format("<cmd> lua require('config.telescope.mappings').%s() <CR>", f)
  vim.api.nvim_set_keymap(mode, lhs, rhs, options)
end

require('telescope').setup {
  defaults = {
    prompt_prefix = "$ "
  },
  extensions = {
    fzf = {
      fuzzy = true,                    -- false will only do exact matching
      override_generic_sorter = false, -- override the generic sorter
      override_file_sorter = true,     -- override the file sorter
    }
  }
}

-- To get fzf loaded and working with telescope, you need to call
-- load_extension, somewhere after setup function:
require('telescope').load_extension('fzf')

--map('n', '<space>ff', [[ <cmd> lua require('config.telescope.mappings').curr_buff() <CR> ]],{ noremap = true, silent = true })
-- Files
map_tele("<space>ft", "git_files")

-- Nvim
map_tele('<space>ff', "curr_buff")
map_tele("<space>fb", "buffers")
