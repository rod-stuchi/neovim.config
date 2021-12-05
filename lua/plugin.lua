vim.cmd([[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugin.lua source <afile> | PackerCompile
    autocmd BufWritePost */lua/plugins/* source <afile> | PackerCompile
  augroup end
]])

local fn = vim.fn

-- Bootstrap
local install_path = fn.stdpath("data") .. "/site/pack/packer/start/packer.nvim"
if fn.empty(fn.glob(install_path)) > 0 then
  packer_bootstrap = fn.system({"git", "clone", "--depth", "1", "https://github.com/wbthomason/packer.nvim", install_path})
end 

-- print(">>>", install_path)

local packer = require "packer"
local use = packer.use

-- Initialize
packer.reset()
packer.init({
  opt_default = false, -- Default to using opt (as opposed to start) plugins
  display = {
    non_interactive = false, -- If true, disable display windows for all operations
    open_fn  = nil, -- An optional function to open a window for packer's display
    working_sym = '🛠', -- The symbol for a plugin being installed/updated
    error_sym = '🧨', -- The symbol for a plugin with an error in installation/updating
    done_sym = '🎉', -- The symbol for a plugin which has completed installation/updating
    removed_sym = '🔥', -- The symbol for an unused plugin which was removed
    moved_sym = '🚀', -- The symbol for a plugin which was moved (e.g. from opt to start)
    header_sym = '━', -- The symbol for the header line in packer's display
    show_all_info = true, -- Should packer show all update details automatically?
    prompt_border = 'double', -- Border style of prompt popups.
    keybindings = { -- Keybindings for the display window
      quit = 'q',
      toggle_info = '<CR>',
      diff = 'd',
      prompt_revert = 'r',
    }
  }
})


-- Load packages
use 'wbthomason/packer.nvim'

require "plugins.nvim-treesiter".init(use)
require "plugins.nvim-ts-context-commentstring".init(use)
require "plugins.comment".init(use)
require "plugins.bufferline".init(use)
require "plugins.vim-mark".init(use)
