local M = {}
local Z = {}

function M.init(use)
  use {
    'norcalli/nvim-colorizer.lua',
  }
  return Z;
end

function Z.setup()
  local ok, lib = pcall(require, "colorizer")
  if not ok then
    return;
  end

  vim.opt.termguicolors = true
  lib.setup()
end

return M
