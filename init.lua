vim.g["python_host_prog"] = "/usr/bin/python2"
vim.g["python3_host_prog"] = "/usr/bin/python3"

vim.cmd("syntax on")

vim.g.mapleader = ","
vim.b.mapleader = ","

require("rods/globals")
require("rods/packer")
require("rods/options")
require("rods/mappings")
require("rods/autocmds")

vim.cmd [[colorscheme onedark]]
require("rods/funcs").toggle_transparency()

