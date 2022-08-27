local M = {}
local Z = {}

function M.init(use)
  use {
    'rmagatti/goto-preview'
  }
  return Z;
end

function Z.setup()
  local ok, lib = pcall(require, 'goto-preview')
  if not ok then
    return;
  end

  lib.setup({
    width = 120;
    height = 20;
  })
end

return M
