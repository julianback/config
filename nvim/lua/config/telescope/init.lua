local sorters = require "telescope.sorters"

--map('n', '<space>ff', [[ <cmd> lua require('config.telescope.mappings').curr_buff() <CR> ]],{ noremap = true, silent = true })
local function map_tele(lhs, f, opts)
  local options = { noremap = true, silent = true }
  if opts then options = vim.tbl_extend('force', options, opts) end
  local mode = "n"
  local rhs = string.format("<cmd> lua require('config.telescope.mappings').%s() <CR>", f)
  vim.api.nvim_set_keymap(mode, lhs, rhs, options)
end

local actions = require('telescope.actions')

require('telescope').setup {
  defaults = {
    prompt_prefix = "$ ",
    mappings = {
      i = {
        ["<esc>"] = actions.close -- Mapping <Esc> to quit in insert mode
      },
    },
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

-- Mappings

-- Files
map_tele("<leader>ft", "project_files")

-- Nvim
map_tele('<leader>ff', "curr_buff")
map_tele("<leader>fb", "buffers")
map_tele("<leader>fh", "help_tags")

-- Git
map_tele("<leader>gs", "git_status")
map_tele("<leader>gc", "git_commits")

-- Search
map_tele("<leader>fg", "live_grep")
map_tele("<leader>gp", "grep_prompt")
--[[ map_tele("<space>gw", "grep_string", {
  short_path = true,
  word_match = "-w",
  only_sort_text = true,
  layout_strategy = "vertical",
  sorter = sorters.get_fzy_sorter(),
}) ]]

