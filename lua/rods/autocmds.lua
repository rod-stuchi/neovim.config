
vim.cmd([[
  autocmd! BufWinLeave * let b:winview = winsaveview()
  autocmd! BufWinEnter * if exists('b:winview') | call winrestview(b:winview) | unlet b:winview
  autocmd FileType css,javascript,json,scss setl iskeyword+=-
  autocmd FileType git set nofoldenable
]])

vim.cmd([[
augroup highlight_yank
  autocmd!
  " autocmd TextYankPost * silent! lua vim.highlight.on_yank { higroup='IncSearch', timeout=200 }
  autocmd TextYankPost * silent! lua vim.highlight.on_yank { higroup='IncSearch', timeout=400 }
augroup END

augroup rods_highlights
  autocmd!
  highlight breakSpace ctermfg=46 guifg=#00ff00
  " match does not work if has more than one
  " match breakSpace /\%xa0/
  call matchadd('breakSpace', '\%xa0')

  " highlight ColorColumn88 ctermbg=magenta guibg=#b41158
  " call matchadd('ColorColumn88', '\%88v')
augroup END
]])
