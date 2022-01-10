local M = {}
local Z = {}

function M.init(use)
  use {
    'navarasu/onedark.nvim',
    commit = 'ce49cf36dc839564e95290e2cdace396c148bca',
  }
  return Z;
end

function Z.setup()
  -- local ok, lib = pcall(require, "onedark")
  -- if not ok then
  --   return;
  -- end

  -- lib.setup({
  --   style = 'dark',
  --   transparent = true,
  --   term_colors = true,
  -- })

  vim.cmd [[colorscheme onedark]]
  require("rods/funcs").toggle_transparency()

end

return M
