vim.g.mapleader = ","
vim.b.mapleader = ","

require("rods/globals")
require("rods/funcs")
require("rods/packer")
require("rods/options")
require("rods/mappings")
require("rods/autocmds")

-- vim.lsp.set_log_level("debug")
-- :lua vim.cmd('e'..vim.lsp.get_log_path())
