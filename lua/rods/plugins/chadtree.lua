local M = {}
local Z = {}

function M.init(use)
  use {
    'ms-jpq/chadtree',
    branch = 'chad',
  }
  return Z;
end

function Z.setup()
  -- local ok, lib = pcall(require, 'plugin.namespace')
  -- if not ok then
  --   return;
  -- end

  -- lib.setup()
  local chadtree_settings = {
    ['keymap.open_sys'] = {'False'},
    ['keymap.primary'] = {'<enter>', 'o'},
    ['keymap.toggle_version_control'] = {'g'},
  }

  vim.api.nvim_set_var("chadtree_settings", chadtree_settings)
end

return M
