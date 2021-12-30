local M = {}
local Z = {}

function M.init(use)
  use {
    'navarasu/onedark.nvim',
  }
  return Z;
end

function Z.setup()
  vim.cmd [[colorscheme onedark]]
  require("rods/funcs").toggle_transparency()

end

return M
