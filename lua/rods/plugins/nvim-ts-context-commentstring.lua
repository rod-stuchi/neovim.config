local M = {}
local Z = {}

function M.init(use)
  use {
    'JoosepAlviste/nvim-ts-context-commentstring',
  }
  return Z;
end

function Z.setup()
  local ok, lib = pcall(require, 'nvim-ts-context-commentstring')
  if not ok then
    return;
  end

  lib.setup()
end

return M
