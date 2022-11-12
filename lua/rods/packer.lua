vim.cmd([[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost */lua/rods/plugins/* source <afile> | PackerCompile
    autocmd BufWritePost packer.lua source <afile> | PackerCompile
  augroup end
]])

-- Bootstrap
require 'rods/plugins/packer-cfg'.setup()

local packer = require "packer"
local use = packer.use

-- Initialize
packer.reset()
packer.init(require 'rods/plugins/packer-cfg'.init())

-- Load plugins
use 'wbthomason/packer.nvim'

require "rods/plugins/nvim-treesiter".init(use).setup()
require "rods/plugins/nvim-ts-context-commentstring".init(use).setup()
require "rods/plugins/comment".init(use).setup()
require "rods/plugins/bufferline".init(use).setup()
require "rods/plugins/vim-mark".init(use).setup()
require "rods/plugins/fzf".init(use).setup()
require "rods/plugins/fzf-lua".init(use).setup()
require "rods/plugins/neo-tree".init(use).setup()
require "rods/plugins/rnvimr".init(use).setup()
require "rods/plugins/lualine".init(use).setup()
require "rods/plugins/nvim-ts-autotag".init(use).setup()
require "rods/plugins/gitsigns".init(use).setup()
require "rods/plugins/nvim-colorizer".init(use).setup()
require "rods/plugins/vim-easy-align".init(use).setup()
require "rods/plugins/nvim-lsp-installer".init(use).setup()
require "rods/plugins/nvim-navic".init(use).setup()
require "rods/plugins/notify".init(use).setup()
require "rods/plugins/lightspeed".init(use).setup()
require "rods/plugins/nvim-biscuits".init(use).setup()
require "rods/plugins/goto-preview".init(use).setup()
require "rods/plugins/fidget".init(use).setup()
require "rods/plugins/diffview".init(use).setup()
require "rods/plugins/pretty-fold".init(use).setup()
require "rods/plugins/tint".init(use) --.setup()
require "rods/plugins/firenvim".init(use).setup()

-- autocomplete
require "rods/plugins/luasnip".init(use).setup()
require "rods/plugins/nvim-cmp".init(use).setup()

-- Themes
require "rods/themes/kanagawa".init(use).setup()

-- Languages
require "rods/plugins/rust-tools".init(use)


-- disableds
-- require "rods/themes/onedark".init(use).setup()
-- require "rods/plugins/nvim-tree".init(use).setup()
-- require "rods/plugins/hop".init(use).setup()
-- require "rods/plugins/shade".init(use).setup()
