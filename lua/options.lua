local opt = vim.opt -- set-option
local bo = vim.bo   -- buffer-scoped

opt.hidden = true
opt.mouse = "a"
opt.history = 3000
opt.belloff = "all"
opt.showcmd = true
opt.showmode = true
opt.inccommand = "split"
opt.number = true
opt.relativenumber = true

opt.expandtab = true
opt.shiftwidth = 2
opt.softtabstop = 2
opt.list = true
opt.encoding = 'utf-8'
opt.wrap = false
opt.showbreak = "↪"
opt.listchars = { tab = "›~", trail = "∙", eol = "↲", nbsp = "␣" }

opt.termguicolors = true
opt.guifont="Fira Code 10"

opt.title = true
opt.updatetime = 500

opt.foldlevel = 4
opt.foldopen:remove({'search'})
opt.linespace = 4
opt.wildignore = '*/tmp/*,*.so,*.swp,*.zip,node_modules,.git'
