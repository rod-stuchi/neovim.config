local M = {}
local Z = {}

function M.init(use)
  use {
    'nvim-neo-tree/neo-tree.nvim',
    branch = "v2.x",
    requires = {
      "nvim-lua/plenary.nvim",
      "kyazdani42/nvim-web-devicons", -- not strictly required, but recommended
      "MunifTanjim/nui.nvim",
    }
  }
  return Z;
end

function Z.setup()
  local ok, lib = pcall(require, 'neo-tree')
  if not ok then
    return;
  end

  lib.setup({
      filesystem = {
        window = {
          mappings = {
            ["o"] = "open",
          }
        },
        hijack_netrw_behavior = "disabled"
      }
  })

  -- vim.cmd([[nnoremap \ :Neotree reveal<cr>]])
  -- vim.cmd([[nnoremap \ :Neotree buffers toggle<cr>]])
end

return M
