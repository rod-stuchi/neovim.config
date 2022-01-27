local M = {}
local Z = {}

function M.init(use)
  use {
    'L3MON4D3/LuaSnip',
    'saadparwaiz1/cmp_luasnip'
  }
  return Z;
end

function Z.setup()
  -- local ok, lib = pcall(require, 'luasnip')
  -- if not ok then
  --   return;
  -- end

  -- lib.setup({})
end

return M
