local M = {}
local Z = {}

-- 'norcalli/nvim-colorizer.lua',
function M.init(use)
  use {
    'NvChad/nvim-colorizer.lua',
  }
  return Z;
end

function Z.setup()
  local ok, lib = pcall(require, "colorizer")
  if not ok then
    return;
  end

  vim.opt.termguicolors = true
  lib.setup({
    user_default_options = {
      -- mode = "virtualtext"
    }
  })
end

return M
