vim.cmd([[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugin.lua source <afile> | PackerCompile
    autocmd BufWritePost */lua/plugins/* source <afile> | PackerCompile
  augroup end
]])

-- Bootstrap
require 'plugins.packer-cfg'.setup()

local packer = require "packer"
local use = packer.use

-- Initialize
packer.reset()
packer.init(require 'plugins.packer-cfg'.init())


-- Load packages
use 'wbthomason/packer.nvim'

require "plugins.nvim-treesiter".init(use)
require "plugins.nvim-ts-context-commentstring".init(use)
require "plugins.comment".init(use)
require "plugins.bufferline".init(use)
require "plugins.vim-mark".init(use)
require "plugins.fzf".init(use)
require "plugins.hop".init(use)
