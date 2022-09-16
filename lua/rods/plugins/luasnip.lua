local M = {}
local Z = {}

function M.init(use)
  use {
    'L3MON4D3/LuaSnip',
    tag='v1.*',
    requires = {
      'saadparwaiz1/cmp_luasnip'
    }
  }
  return Z;
end

function Z.setup()
end

-- function M.load()
--   print("limpou")
--   -- require'luasnip'.cleanup()
--   -- vim.cmd("source ~/.config/nvim/lua/rods/plugins/luasnip.lua")
--   print("carregou")
--   return Z.setup()
-- end


local ok, ls = pcall(require, 'luasnip')
if not ok then
  return;
end

ls.cleanup()

local s = ls.snippet
local sn = ls.snippet_node
local isn = ls.indent_snippet_node
local t = ls.text_node
local i = ls.insert_node
local f = ls.function_node
local c = ls.choice_node
local d = ls.dynamic_node
local r = ls.restore_node
local events = require("luasnip.util.events")
local types = require("luasnip.util.types")
local ai = require("luasnip.nodes.absolute_indexer")
local fmt = require("luasnip.extras.fmt").fmt
local extras = require("luasnip.extras")
local m = extras.m
local l = extras.l
local rep = extras.rep
local postfix = require("luasnip.extras.postfix").postfix

ls.add_snippets("go", {
  s("fpp", {
    t("fmt.Println(\"🍽🍽🍽🍽 : 12341234 "), i(1), i(2), t("\")")
  })
})

return M
