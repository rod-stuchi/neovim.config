local M = {}
local Z = {}

function M.init(use)
  use {
    'phaazon/hop.nvim',
    branch = 'v1.2', -- optional but strongly recommended
  }
  return Z;
end

function Z.setup()
  local ok, lib = pcall(require, 'hop')
  if not ok then
    return;
  end

  lib.setup({ keys = 'asdfghijkl;etovxqpybzcurn' })
end

return M
