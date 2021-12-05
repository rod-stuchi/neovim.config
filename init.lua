vim.g["python_host_prog"] = "/usr/bin/python2"
vim.g["python3_host_prog"] = "/usr/bin/python3"

vim.cmd("syntax on")

vim.g.mapleader = ","
vim.b.mapleader = ","

require("globals")
require("package-manager")
require("opts")
require("binds")

-- vim.cmd [[colorscheme onenord]]
-- vim.cmd [[colorscheme onedark]]
-- vim.cmd([[
-- highlight Normal guibg=none ctermbg=none
-- highlight NonText guibg=none ctermbg=none
-- ]])

-- save cursor/scroll position when switching between buffers
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

vim.cmd([[
let g:fzf_preview_window = ['right:60%', 'ctrl-/']

command! -bang -nargs=? -complete=dir Files
    \ call fzf#vim#files(<q-args>,
    \ fzf#vim#with_preview({'options': [
    \   '--bind=tab:toggle+up,shift-tab:toggle+down',
    \ ]})
  \, <bang>0)
]])


-- vim.cmd([[ hi Folded guifg=#0e1219 ]])

-- vim.cmd([[au VimEnter * highlight Folded guifg=#3e506f]])
-- vim.cmd([[au ColorScheme * highlight Folded guifg=#3e506f]])
vim.cmd([[au VimEnter * highlight Folded guifg=#465a7d]])
vim.cmd([[au ColorScheme * highlight Folded guifg=#465a7d]])
vim.cmd([[au VimEnter * highlight IncSearch guifg=#ab7f54 guibg=#00000000]])
vim.cmd([[au ColorScheme * highlight IncSearch guifg=#ab7f54 guibg=#00000000]])
