local execute = vim.api.nvim_command
local fn = vim.fn

local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'

if fn.empty(fn.glob(install_path)) > 0 then
  fn.system({'git', 'clone', 'https://github.com/wbthomason/packer.nvim', install_path})
  execute 'packadd packer.nvim'
end

-- This file can be loaded by calling `lua require('plugins')` from your init.vim

return require('packer').startup(function()
  -- Packer can manage itself
  use 'wbthomason/packer.nvim'

  -- Treesitter
  use {
    'nvim-treesitter/nvim-treesitter',
    run = ':TSUpdate'
  }
  use 'nvim-treesitter/nvim-treesitter-textobjects'

  -- Indentation
  use {"lukas-reineke/indent-blankline.nvim", branch = 'master'}

  -- Colour scheme
  use 'folke/tokyonight.nvim'

  -- Rainbow parens
  use 'p00f/nvim-ts-rainbow'

  -- Fuzzy finding
  use {
    'nvim-telescope/telescope.nvim',
    requires = {{'nvim-lua/popup.nvim'}, {'nvim-lua/plenary.nvim'}},
    module_patterns = "telescope.*" -- Lazy-load
  }

  use { 'nvim-telescope/telescope-fzf-native.nvim', run = 'make' }

  -- Status line
  use {
    'hoob3rt/lualine.nvim',
    requires = {'kyazdani42/nvim-web-devicons', opt = true}
  }

  -- LSP
  use 'neovim/nvim-lspconfig'
  use 'kabouzeid/nvim-lspinstall'

  -- Nice diagnostics
  use {
    "folke/trouble.nvim",
    requires = "kyazdani42/nvim-web-devicons",
  }

  -- Comments
  use 'b3nj5m1n/kommentary'

  -- Git signs
  use {
    'lewis6991/gitsigns.nvim',
    requires = {
      'nvim-lua/plenary.nvim'
    },
  }

  use "tpope/vim-fugitive"

  -- Todo comments
  use {
    "folke/todo-comments.nvim",
    requires = "nvim-lua/plenary.nvim",
  }

end)
