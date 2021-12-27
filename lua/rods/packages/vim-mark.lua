local M = {}

function M.init(use)
  return use {
    'inkarkat/vim-mark',
    requires = 'inkarkat/vim-ingo-library',
    config = function()
      vim.g["mwDefaultHighlightingPalette"] = "extended"
      vim.g["mwDefaultHighlightingPalette"] = "maximum"
      vim.g["mwDefaultHighlightingNum"] = 30
    end
  }
end

return M

