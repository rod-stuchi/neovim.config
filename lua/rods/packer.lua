vim.cmd([[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost package-manager.lua source <afile> | PackerCompile
    autocmd BufWritePost */lua/packages/* source <afile> | PackerCompile
  augroup end
]])

-- Bootstrap
require 'rods/packages/packer-cfg'.setup()

local packer = require "packer"
local use = packer.use

-- Initialize
packer.reset()
packer.init(require 'rods/packages/packer-cfg'.init())


-- Load packages
use 'wbthomason/packer.nvim'

require "rods/packages/nvim-treesiter".init(use)
require "rods/packages/nvim-ts-context-commentstring".init(use)
require "rods/packages/comment".init(use)
require "rods/packages/bufferline".init(use)
require "rods/packages/vim-mark".init(use)
require "rods/packages/fzf".init(use)
require "rods/packages/fzf-lua".init(use)
require "rods/packages/hop".init(use)
require "rods/packages/nvim-tree".init(use) -- also: nerdtree
require "rods/packages/lualine".init(use)
require "rods/packages/nvim-ts-autotag".init(use) -- also: tagalong
require "rods/packages/gitsigns".init(use) -- also: vim-gitgutter
require "rods/packages/nvim-colorizer".init(use)
require "rods/packages/vim-easy-align".init(use)

-- Themes
-- require "themes.catppuccin".init(use)
require "rods/themes/onedark".init(use)
