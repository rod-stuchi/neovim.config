local M = {}
local Z = {}

function M.init(use)
  use {
    'j-hui/fidget.nvim'
  }
  return Z;
end

function Z.setup()
  local ok, lib = pcall(require, 'fidget')
  if not ok then
    return;
  end

  lib.setup()
end

return M
