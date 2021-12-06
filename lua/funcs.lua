local M = {}

function M.toggle_transparency()
    vim.g.onedark_transparent_background = not vim.g.onedark_transparent_background
    vim.cmd[[colorscheme onedark]]
 end

 return M
