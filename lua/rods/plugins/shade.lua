local M = {}
local Z = {}

function M.init(use)
  use {
    'sunjon/shade.nvim'
  }
  return Z;
end

function Z.setup()
  local ok, lib = pcall(require, 'shade')
  if not ok then
    return;
  end

  lib.setup({
    overlay_opacity = 50,
    opacity_step = 1,
    keys = {
      brightness_up    = '<C-Up>',
      brightness_down  = '<C-Down>',
      toggle           = '<Leader>s',
    }
  })
end

return M
