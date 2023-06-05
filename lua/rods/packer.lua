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

require "rods/plugins/nvim-treesiter".init(use).setup()                -- 🟩 done
require "rods/plugins/nvim-ts-context-commentstring".init(use).setup() -- 🟩 done
require "rods/plugins/comment".init(use).setup()                       -- 🟩 done
require "rods/plugins/bufferline".init(use).setup()                    -- 🟩 done
require "rods/plugins/vim-mark".init(use).setup()                      -- 🟩 done
require "rods/plugins/fzf".init(use).setup()                           -- 🟩 done
require "rods/plugins/fzf-lua".init(use).setup()                       -- 🟩 done
require "rods/plugins/neo-tree".init(use).setup()                      -- 🟨 maybe
require "rods/plugins/rnvimr".init(use).setup()                        -- 🟩 done
require "rods/plugins/lualine".init(use).setup()                       -- 🟩 done
require "rods/plugins/nvim-ts-autotag".init(use).setup()               -- 🟩 done
require "rods/plugins/gitsigns".init(use).setup()                      -- 🟩 done
require "rods/plugins/nvim-colorizer".init(use).setup()                -- 🟩 done
require "rods/plugins/vim-easy-align".init(use).setup()                -- 🟩 done
require "rods/plugins/nvim-lsp-installer".init(use).setup()            -- 🟫 no needed
require "rods/plugins/nvim-navic".init(use).setup()                    -- 🟩 done
require "rods/plugins/notify".init(use).setup()                        -- 🟩 done
require "rods/plugins/lightspeed".init(use).setup()                    -- 🟩 done
require "rods/plugins/nvim-biscuits".init(use).setup()                 -- 🟩 done
require "rods/plugins/goto-preview".init(use).setup()                  -- 🟩 done
require "rods/plugins/fidget".init(use).setup()                        -- 🟩 done
require "rods/plugins/diffview".init(use).setup()                      -- 🟩 done
require "rods/plugins/pretty-fold".init(use).setup()                   -- 🟩 done
require "rods/plugins/tint".init(use) --.setup()                       -- 🟩 done
require "rods/plugins/firenvim".init(use).setup()                      -- 🟩 done

-- autocomplete
require "rods/plugins/luasnip".init(use).setup()                       -- 🟩 done
require "rods/plugins/nvim-cmp".init(use).setup()                      -- 🟩 done

-- Themes
require "rods/themes/kanagawa".init(use).setup()                       -- 🟩 done

-- Languages
require "rods/plugins/rust-tools".init(use)


-- disableds
-- require "rods/themes/onedark".init(use).setup()
-- require "rods/plugins/nvim-tree".init(use).setup()
