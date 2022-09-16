local M = {}
local Z = {}

function M.init(use)
  use {
    'sindrets/diffview.nvim',
    requires = 'nvim-lua/plenary.nvim'
  }
  return Z;
end

function Z.setup()
  local ok, lib = pcall(require, 'diffview')
  if not ok then
    return;
  end

  lib.setup()
end

return M
