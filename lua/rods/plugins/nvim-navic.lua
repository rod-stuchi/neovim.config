local M = {}
local Z = {}

function M.init(use)
  use {
    'SmiteshP/nvim-navic',
    requires = "neovim/nvim-lspconfig",
  }
  return Z;
end

function Z.setup()
  local ok, lib = pcall(require, 'nvim-navic')
  if not ok then
    return;
  end

  lib.setup({
    icons = {
        File          = " ",
        Module        = " ",
        Namespace     = " ",
        Package       = " ",
        Class         = " ",
        Method        = " ",
        Property      = " ",
        Field         = " ",
        Constructor   = " ",
        Enum          = "練",
        Interface     = "練",
        Function      = " ",
        Variable      = " ",
        Constant      = " ",
        String        = " ",
        Number        = " ",
        Boolean       = "◩ ",
        Array         = " ",
        Object        = " ",
        Key           = " ",
        Null          = "ﳠ ",
        EnumMember    = " ",
        Struct        = " ",
        Event         = " ",
        Operator      = " ",
        TypeParameter = " ",
    },
    highlight = true,
    separator = " > ",
    depth_limit = 0,
    depth_limit_indicator = "..",
  })

  vim.o.winbar = " %{%v:lua.require'nvim-navic'.get_location()%}"
end

return M
