-- vim: fdm=marker:foldlevel=1:
-- vim.api.nvim_commnad("command! TSRehighlight :write | edit | TSBufEnable hightlight")

local opts = {noremap = true, silent = true}

local keymap = vim.keymap.set
-- P(keymap)


--{{{ customs :: command
keymap('c', '%%', [[getcmdtype() == ':' ? expand('%:h').'/' : '%%' ]], { noremap = true, expr = true })
-- TODO
vim.cmd[[ command W :execute ':silent w !sudo tee % > /dev/null' | :edit! ]]
vim.cmd[[ command! Gqf GitGutterQuickFix | copen ]]
--}}}

--{{{ customs :: normal
keymap('n', 'Q', '<nop>', { noremap = true })

keymap('n', '<Up>', '<C-w><up>', { noremap = false })
keymap('o', '<Up>', '<C-w><up>', { noremap = false })
keymap('n', '<Down>', '<C-w><down>', { noremap = false })
keymap('o', '<Down>', '<C-w><down>', { noremap = false })
keymap('n', '<Left>', '<C-w><left>', { noremap = false })
keymap('o', '<Left>', '<C-w><left>', { noremap = false })
keymap('n', '<Right>', '<C-w><right>', { noremap = false })
keymap('o', '<Right>', '<C-w><right>', { noremap = false })

keymap('n', ';', ':', { noremap = true })
keymap('n', ':', ';', { noremap = true })
keymap('n', '<BS>', '<Cmd>noh<CR>', { noremap = true })
keymap('n', '<C-t>', '<Cmd>lua require("rods/funcs").toggle_transparency()<CR>', { noremap= true })
keymap('n', '<M-o>', '<Cmd>copen<CR>', opts)
keymap('n', '<M-O>', '<Cmd>cclose<CR>', opts)
keymap('n', '<M-[>', '<Cmd>cprevious<CR>', opts)
keymap('n', '<M-]>', '<Cmd>cnext<CR>', opts)
keymap('n', '<M-q>', '<Cmd>set cursorcolumn!<Bar>set cursorline!<CR>', { noremap = true})
keymap('n', '<M-w>', '<Cmd>set number!<Bar>set relativenumber!<CR>', { noremap = true})
keymap('n', '<M-e>', '<Cmd>set list!<CR>', { noremap = true})

-- Math operations in lines, resolves line expression, and SUM, AVG all lines with description on left:
-- abc = 12 ^12
-- cde = 3 * 4 + 2
-- keyboard <F3> key switch with problem (need to be replaced)
keymap('n', '<F4>', '<Cmd>w !/home/rods/.scripts/sum.sh<CR>', opts)

-- insert current date in yyyy-mm-dd format
keymap('n', '<F6>', 'i<C-R>=strftime("%Y-%m-%d")<CR><Esc>l', { noremap = true })

-- insert current date in pt_BR format
-- dd/mmm (ddd), like 15/mar (qui)
keymap('n', '<F7>', ':lang pt_BR.UTF-8<CR>:let @@=strftime("%d/%b (%a)")<CR>:normal! p<esc>o<esc>:lang en_US.UTF-8<CR>', opts)

-- maximize
keymap('n', '<C-w>o', ':mksession! /tmp/vim-session.vim<CR>:wincmd o<CR>', opts)
keymap('n', '<C-w>u', ':source /tmp/vim-session.vim<CR>', opts)

-- commands with preserve
keymap('n', 'yip', [[ :lua preserve('normal! yip')<CR>2h ]], opts)
keymap('n', 'yiw', [[ :lua preserve('normal! yiw')<CR>2h ]], opts)
keymap('n', '<space>==', [[ :lua preserve('normal! gg=G')<CR>2h ]], opts)

-- moving lines
keymap('n', '<A-j>', ':m .+1<CR>==', { noremap = true })
keymap('n', '<A-k>', ':m .-2<CR>==', { noremap = true })
keymap('i', '<A-j>', '<Esc>:m .+1<CR>==gi', { noremap = true })
keymap('i', '<A-k>', '<Esc>:m .-2<CR>==gi', { noremap = true })
keymap('v', '<A-j>', ":m '>+1<CR>gv=gv", { noremap = true })
keymap('v', '<A-k>', ":m '<-2<CR>gv=gv", { noremap = true })

-- format JS/JSX
keymap('n', '<leader>w', ':!npx prettier --write %; npx eslint --fix %<CR><CR>', opts)
--}}}

--{{{ customs :: visual
keymap('v', ';', ':', { noremap = true })
keymap('v', ':', ';', { noremap = true })
--}}}

--{{{ customs :: insert
-- inoremap <F5> <C-R>=strftime("%Y-%m-%d")<CR>
keymap('i', '<F6>', '<C-R>=strftime("%Y-%m-%d")<CR>', { noremap = true })
--}}}

--{{{ leader
-- cd directory current path
vim.cmd [[
" cd directory current path
nnoremap <leader>cd :cd %:p:h<CR> :echom "CD to [" . expand("%:p:h") . "]"<CR>

" yank in clipboard file name
" nnoremap <silent> <Leader>yn :let @*=expand("%")<CR> :echom "copied: [" . expand("%") . "] use middle click"<CR>
" yank in clipboard file path
" nnoremap <silent> <Leader>yp :let @*=expand("%:p")<CR> :echom "copied: [" . expand("%:p") . "] use middle click"<CR>

" copy filename clipboard
nnoremap <silent> <Leader>cn :let @+=expand("%")<CR> :echom "copied: [" . expand("%") . "] use ctrl+v"<CR>
" copy file path to clipboard
nnoremap <silent> <Leader>cp :let @+=expand("%:p")<CR> :echom "copied: [" . expand("%:p") . "] use ctrl+v"<CR>

]]
--}}}


--{{{ vim-mark
keymap('n', '<Leader>M', '<Plug>MarkToggle', { noremap = false })
keymap('n', '<Leader>N', '<Plug>MarkConfirmAllClear', { noremap = false })
keymap('n', '<Leader>+*', '<Plug>MarkSearchUsedGroupNext', { noremap = false })
keymap('n', '<Leader>-*', '<Plug>MarkSearchUsedGroupPrev', { noremap = false })
keymap('x', '<Leader>*', '<Plug>MarkIWhiteSet', { noremap = false })
--}}}

--{{{ neo-tree
keymap('n', '<C-n>', ':Neotree filesystem toggle<CR>', { noremap= true })
keymap('n', '<C-A-n>', ':NeoTreeRevealToggle<CR>', { noremap= true })
keymap('n', '<C-A-g>', ':Neotree git_status float<CR>', { noremap= true })
keymap('n', '\\', ':Neotree buffers toggle<CR>', { noremap= true })
--}}}

--{{{ bufferline
keymap('n', '<space><space>', ':BufferLinePick<CR>', opts)
keymap('n', 'gx', ':BufferLinePickClose<CR>', opts)
keymap('n', '<A-,>', '<Cmd>BufferLineMovePrev<CR>', opts)
keymap('n', '<A-.>', '<Cmd>BufferLineMoveNext<CR>', opts)

keymap('n', '<Leader>1', '<cmd>lua require("bufferline").go_to_buffer(1, true)<cr>', opts)
keymap('n', '<Leader>2', '<cmd>lua require("bufferline").go_to_buffer(2, true)<cr>', opts)
keymap('n', '<Leader>3', '<cmd>lua require("bufferline").go_to_buffer(3, true)<cr>', opts)
keymap('n', '<Leader>4', '<cmd>lua require("bufferline").go_to_buffer(4, true)<cr>', opts)
keymap('n', '<Leader>5', '<cmd>lua require("bufferline").go_to_buffer(5, true)<cr>', opts)
keymap('n', '<Leader>6', '<cmd>lua require("bufferline").go_to_buffer(6, true)<cr>', opts)
keymap('n', '<Leader>7', '<cmd>lua require("bufferline").go_to_buffer(7, true)<cr>', opts)
keymap('n', '<Leader>8', '<cmd>lua require("bufferline").go_to_buffer(8, true)<cr>', opts)
keymap('n', '<Leader>9', '<cmd>lua require("bufferline").go_to_buffer(9, true)<cr>', opts)
keymap('n', '<Leader>$', '<cmd>lua require("bufferline").go_to_buffer(-1, true)<cr>', opts)
--}}}

--{{{ harpoon
-- keymap('n', '<Leader>a', '<Cmd>lua require("harpoon.mark").add_file()<CR>', opts)
-- keymap('n', '<Leader>s', '<Cmd>lua require("harpoon.ui").toggle_quick_menu()<CR>', opts)

-- keymap('n', '<Leader>0', '<Cmd>lua require("harpoon.ui").nav_file(0)<CR>', opts)
-- keymap('n', '<Leader>1', '<Cmd>lua require("harpoon.ui").nav_file(1)<CR>', opts)
-- keymap('n', '<Leader>2', '<Cmd>lua require("harpoon.ui").nav_file(2)<CR>', opts)
-- keymap('n', '<Leader>3', '<Cmd>lua require("harpoon.ui").nav_file(3)<CR>', opts)
-- keymap('n', '<Leader>4', '<Cmd>lua require("harpoon.ui").nav_file(4)<CR>', opts)
-- keymap('n', '<Leader>5', '<Cmd>lua require("harpoon.ui").nav_file(5)<CR>', opts)
-- keymap('n', '<Leader>6', '<Cmd>lua require("harpoon.ui").nav_file(6)<CR>', opts)
-- keymap('n', '<Leader>7', '<Cmd>lua require("harpoon.ui").nav_file(7)<CR>', opts)
-- keymap('n', '<Leader>8', '<Cmd>lua require("harpoon.ui").nav_file(8)<CR>', opts)
-- keymap('n', '<Leader>9', '<Cmd>lua require("harpoon.ui").nav_file(9)<CR>', opts)
--}}}

--{{{ fzf
keymap('n', '<Leader>b', '<Cmd>Buffers<CR>', { noremap = true })
keymap('n', '<Leader>f', '<Cmd>Files<CR>', { noremap = true })
keymap('n', '<Leader>g', '<Cmd>GFiles<CR>', { noremap = true })
vim.cmd [[
  nnoremap <silent> <Leader>rg :Rg \b<C-R><C-W>\b<CR>
  autocmd VimEnter * nnoremap <silent> <Leader>d :Files <C-R>=expand('%:h')<CR><CR>
]]
--}}}

--{{{ EasyAlign
-- Start interactive EasyAlign in visual mode (e.g. vipga)
keymap('x', 'ga', '<Plug>(EasyAlign)', {})
-- Start interactive EasyAlign for a motion/text object (e.g. gaip)
keymap('n', 'ga', '<Plug>(EasyAlign)', {})
--}}}

--{{{ nvim-biscuits
keymap('n', 'tb', ':lua require("nvim-biscuits").toggle_biscuits()<CR>', opts)
--}}}
--
--{{{ rnvimr Ranger
keymap('n', '<Leader>o', ':RnvimrToggle<CR>', opts)
--}}}


--{{{ goto-preview
keymap('n', 'gpd', '<cmd> lua require("goto-preview").goto_preview_definition()<CR>', {noremap=true})
keymap('n', 'gpt', '<cmd> lua require("goto-preview").goto_preview_type_definition()<CR>', {noremap=true})
keymap('n', 'gpi', '<cmd> lua require("goto-preview").goto_preview_implementation()<CR>', {noremap=true})
keymap('n', 'gP',  '<cmd> lua require("goto-preview").close_all_win()<CR>', opts)
--}}}
