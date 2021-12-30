local M = {}
local Z = {}

function M.init(use)
  use {
    'inkarkat/vim-mark',
    requires = 'inkarkat/vim-ingo-library',
  }
  return Z;
end

function Z.setup()
  vim.g["mwDefaultHighlightingPalette"] = "extended"
  vim.g["mwDefaultHighlightingPalette"] = "maximum"
  vim.g["mwDefaultHighlightingNum"] = 30
end

return M
