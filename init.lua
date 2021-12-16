vim.g["python_host_prog"] = "/usr/bin/python2"
vim.g["python3_host_prog"] = "/usr/bin/python3"

vim.cmd("syntax on")

vim.g.mapleader = ","
vim.b.mapleader = ","

require("globals")
require("manager-pkg")
require("options")
require("mappings")
require("autocmds")

vim.cmd [[colorscheme onedark]]
require("funcs").toggle_transparency()

