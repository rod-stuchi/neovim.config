vim.cmd([[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost package-manager.lua source <afile> | PackerCompile
    autocmd BufWritePost */lua/packages/* source <afile> | PackerCompile
  augroup end
]])

-- Bootstrap
require 'packages.packer-cfg'.setup()

local packer = require "packer"
local use = packer.use

-- Initialize
packer.reset()
packer.init(require 'packages.packer-cfg'.init())


-- Load packages
use 'wbthomason/packer.nvim'

require "packages.nvim-treesiter".init(use)
require "packages.nvim-ts-context-commentstring".init(use)
require "packages.comment".init(use)
require "packages.bufferline".init(use)
require "packages.vim-mark".init(use)
require "packages.fzf".init(use)
require "packages.fzf-lua".init(use)
require "packages.hop".init(use)
require "packages.nvim-tree".init(use)
require "packages.lualine".init(use)
-- require "packages.tagalong".init(use)
require "packages.nvim-ts-autotag".init(use)
require "packages.gitsigns".init(use)

-- Themes
-- require "themes.catppuccin".init(use)
require "themes.onedark".init(use)
