local M = {}

vim.cmd [[ command! Format execute 'lua vim.lsp.buf.formatting()' ]]

function M.toggle_transparency()
  vim.g.onedark_transparent_background = not vim.g.onedark_transparent_background
  vim.cmd[[colorscheme onedark]]

  if not vim.g.onedark_transparent_background then
    vim.cmd [[ highlight LineNrAbove guibg=#1e2127 guifg=#414855 ]]
    vim.cmd [[ highlight LineNr guifg=#93a2bf ]]
    vim.cmd [[ highlight LineNrBelow guibg=#1e2127 guifg=#414855 ]]
  else
    vim.cmd [[ highlight LineNrAbove guifg=#6c6c6c ]]
    vim.cmd [[ highlight LineNr guifg=#c3c3c3 ]]
    vim.cmd [[ highlight LineNrBelow guifg=#6c6c6c ]]
  end
end

return M
