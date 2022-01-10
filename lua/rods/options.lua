local opt = vim.opt -- set-option
-- local bo = vim.bo   -- buffer-scoped

vim.g["python_host_prog"] = "/usr/bin/python2"
vim.g["python3_host_prog"] = "/usr/bin/python3"

vim.cmd("syntax on")

opt.hidden = true
opt.mouse = "a"
opt.history = 3000
opt.belloff = "all"
opt.showcmd = true
opt.showmode = true
opt.inccommand = "split"
opt.number = true
opt.relativenumber = true
opt.hlsearch = true

opt.expandtab = true
opt.shiftwidth = 4
opt.softtabstop = 4
opt.tabstop = 4
opt.smartcase = true
opt.smartindent = true
opt.splitbelow = true
opt.splitright = true
opt.ignorecase = true

opt.list = true
opt.encoding = 'utf-8'
opt.fileencoding = 'utf-8'
opt.wrap = false
opt.showbreak = "↪"
opt.listchars = { tab = "›∙", trail = "∙", eol = "↲", nbsp = "␣" }

opt.termguicolors = true
opt.guifont="Fira Code 10"
opt.scrolloff = 8
opt.sidescrolloff = 8

opt.title = true
opt.updatetime = 500

opt.foldmethod = "expr"
opt.foldexpr = "nvim_treesitter#foldexpr()"
opt.foldlevel = 4
opt.foldopen:remove({'search'})
opt.linespace = 4
opt.wildignore = '*/tmp/*,*.so,*.swp,*.zip,node_modules,.git'
opt.shortmess:append "c"

opt.backup = false
opt.swapfile = false
opt.undofile = true
opt.undodir = vim.fn.stdpath("cache") .. "/undo"

opt.cmdheight = 1

