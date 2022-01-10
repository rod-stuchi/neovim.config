local M = {}
local Z = {}

function M.init(use)
  use {
    'navarasu/onedark.nvim',
  }
  return Z;
end

function Z.setup()
  local ok, lib = pcall(require, "onedark")
  if not ok then
    return;
  end

  lib.setup({
    style = 'dark',
    transparent = true,
    term_colors = true,
  })

  vim.cmd [[colorscheme onedark]]

end

return M
