local M = {}
local Z = {}

function M.init(use)
  use {
    'windwp/nvim-ts-autotag',
  }
  return Z;
end

function Z.setup()
  local ok, lib = pcall(require, "nvim-ts-autotag")
  if not ok then
    return;
  end

  lib.setup()
end

return M
