vim.g.mapleader = ","
vim.b.mapleader = ","

require("rods/globals")
require("rods/funcs")
require("rods/packer")
require("rods/options")
require("rods/mappings")
require("rods/autocmds")

require("rods/abbreviation/abbrev").setup()
require("rods/funcs").setCustomHighLights()

-- vim.lsp.set_log_level("debug")
-- :lua vim.cmd('e'..vim.lsp.get_log_path())
