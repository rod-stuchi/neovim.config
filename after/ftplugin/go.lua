-- local opt = vim.opt -- set-option
local bo = vim.bo   -- buffer-scoped

bo.expandtab = false
bo.shiftwidth = 4
bo.softtabstop = 4
bo.tabstop = 4

vim.cmd[[
iab fpn fmt.Println("", )<Left>
iab fpf fmt.Printf("\n", )<Left>
]]

