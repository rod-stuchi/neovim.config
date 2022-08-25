local M = {}
local Z = {}

local function local_setup()
  local g = vim.g
  g.rnvimr_enable_ex = 1
  -- g.rnvimr_shadow_winblend = 90
  -- g.rnvimr_ranger_cmd = {'ranger', '--cmd=set draw_borders both'}
end

function M.init(use)
  use {
    'kevinhwang91/rnvimr',
    config = local_setup()
  }
  return Z;
end

function Z.setup()
  local ok, lib = pcall(require, 'kevinhwang91/rnvimr')
  if not ok then
    return;
  end

  lib.setup()
end

return M
