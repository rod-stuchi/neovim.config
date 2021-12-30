-- vim.cmd([[
-- highlight Normal guibg=none ctermbg=none
-- highlight NonText guibg=none ctermbg=none
-- ]])

vim.cmd([[
autocmd! BufWinLeave * let b:winview = winsaveview()
autocmd! BufWinEnter * if exists('b:winview') | call winrestview(b:winview) | unlet b:winview
autocmd FileType css,javascript,json,scss setl iskeyword+=-
]])

vim.cmd([[
augroup highlight_yank
  autocmd!
  " autocmd TextYankPost * silent! lua vim.highlight.on_yank { higroup='IncSearch', timeout=200 }
  autocmd TextYankPost * silent! lua vim.highlight.on_yank { higroup='IncSearch', timeout=400 }
augroup END
]])


vim.cmd([[au VimEnter * highlight Folded guifg=#465a7d]])
vim.cmd([[au ColorScheme * highlight Folded guifg=#465a7d]])

vim.cmd([[au VimEnter * highlight IncSearch guifg=#ab7f54 guibg=#00000000 ]])
vim.cmd([[au ColorScheme * highlight IncSearch guifg=#ab7f54 guibg=#00000000 ]])

-- Line Column Colors
vim.cmd [[ highlight LineNrAbove guibg=#1e2127 guifg=#414855 ]]
vim.cmd [[ highlight LineNr guifg=#93a2bf ]]
vim.cmd [[ highlight LineNrBelow guibg=#1e2127 guifg=#414855 ]]
-- git
vim.cmd [[ highlight SignColumn  guibg=#1e2127 ]]
vim.cmd [[ highlight GitSignsAdd  guibg=#1e2127 ]]
vim.cmd [[ highlight GitSignsChange  guibg=#1e2127 ]]
vim.cmd [[ highlight GitSignsDelete  guibg=#1e2127 ]]
-- lsp
vim.cmd [[ highlight DiagnosticInfo guibg=#1e2127 ]]
vim.cmd [[ highlight DiagnosticError guibg=#1e2127 ]]
vim.cmd [[ highlight DiagnosticWarn guibg=#1e2127 ]]
vim.cmd [[ highlight DiagnosticHint guibg=#1e2127 ]]

-- require("rods/funcs").toggle_transparency()
