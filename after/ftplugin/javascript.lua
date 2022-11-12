-- local opt = vim.opt -- set-option
local bo = vim.bo   -- buffer-scoped

bo.expandtab = true
bo.shiftwidth = 2
bo.softtabstop = 2
bo.tabstop = 2

vim.cmd[[
iab clg console.log("")<Left><Left>
iab clge console.error()<Left>
]]

