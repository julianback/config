local M = {}
-- local themes = require "telescope.themes"
local utils = require('telescope.utils')
local builtin = require('telescope.builtin')

function M.curr_buff()
  local opts = {
    sorting_strategy = "ascending",
    layout_config = {
      prompt_position = "top",
    },
  }
  require('telescope.builtin').current_buffer_fuzzy_find(opts)
end

function M.git_files()
  --[[ local path = vim.fn.expand "%:h"
  local width = 0.25

  local opts = themes.get_dropdown {
    winblend = 5,
    previewer = false,
    shorten_path = false,

    cwd = path,

    layout_config = {
      width = width,
    },
  } ]]
  -- require("telescope.builtin").git_files()
  local _, ret, _ = utils.get_os_command_output({ 'git', 'rev-parse', '--is-inside-work-tree' })
  if ret == 0 then
      builtin.git_files()
  else
      builtin.find_files()
  end
end

function M.buffers()
  require("telescope.builtin").buffers {
    shorten_path = false,
    previewer = false,
  }
end

return M
