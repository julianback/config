-- https://github.com/tjdevries/config_manager/blob/master/xdg_config/nvim/lua/tj/telescope/init.lua

local M = {}
local themes = require "telescope.themes"
local utils = require('telescope.utils')
local builtin = require('telescope.builtin')

function M.buffers()
  require("telescope.builtin").buffers {
    shorten_path = false,
    previewer = false,
  }
end

function M.curr_buff()
  local opts = {
    sorting_strategy = "ascending",
    layout_config = {
      prompt_position = "top",
    },
  }
  require('telescope.builtin').current_buffer_fuzzy_find(opts)
end

-- function M.git_files()
--   local path = vim.fn.expand "%:h"
--   local width = 0.25

--   local opts = themes.get_dropdown {
--     winblend = 5,
--     previewer = false,
--     shorten_path = false,

--     cwd = path,

--     layout_config = {
--       width = width,
--     },
--   }
--   require("telescope.builtin").git_files()
-- end

function M.git_commits()
  require("telescope.builtin").git_commits {
    winblend = 5,
  }
end

function M.git_status()
  local opts = themes.get_dropdown {
    winblend = 10,
    border = true,
    previewer = false,
    shorten_path = false,
  }

  -- Can change the git icons using this.
  opts.git_icons = {
    changed = "M"
  }

  require("telescope.builtin").git_status(opts)
end

-- Falling back to find_files if git_files can't find a .git directory
-- https://github.com/nvim-telescope/telescope.nvim/wiki/Configuration-Recipes#falling-back-to-find_files-if-git_files-cant-find-a-git-directory
function M.project_files()
  local opts = {} -- define here if you want to define something
  local ok = pcall(require'telescope.builtin'.git_files, opts)
  if not ok then require'telescope.builtin'.find_files(opts) end
end

function M.live_grep()
  require("telescope.builtin").live_grep {
    -- shorten_path = true,
    -- previewer = false,
    fzf_separator = "|>",
  }
end

function M.grep_prompt()
  require("telescope.builtin").grep_string {
    path_display = { "shorten" },
    search = vim.fn.input "Grep String > ",
  }
end

function M.help_tags()
  require("telescope.builtin").help_tags {
    show_version = true,
  }
end

return M
