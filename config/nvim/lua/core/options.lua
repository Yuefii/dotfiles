vim.cmd("autocmd!")

vim.o.clipboard = "unnamedplus"

vim.wo.number = true

vim.opt.autoindent = true
vim.opt.laststatus = 2
vim.opt.ignorecase = true
vim.opt.ai = true
vim.opt.si = true
vim.opt.breakindent = true
vim.opt.backspace = "indent,eol,start"
vim.opt.path:append({ "**" })

vim.opt.nu = true
vim.opt.relativenumber = true

vim.opt.tabstop = 2
vim.opt.softtabstop = 2
vim.opt.shiftwidth = 2
vim.opt.expandtab = true

vim.opt.smartindent = true

vim.opt.wrap = false

vim.opt.swapfile = false
vim.opt.backup = false
vim.opt.undodir = os.getenv("HOME") .. "/.vim/undodir"
vim.opt.undofile = true

vim.opt.hlsearch = true
vim.opt.incsearch = true

vim.opt.termguicolors = true

vim.opt.scrolloff = 8
vim.opt.signcolumn = "yes"
vim.opt.isfname:append("@-@")

vim.opt.updatetime = 50

vim.opt.formatoptions:append({ "r" })
