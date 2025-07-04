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

vim.opt.hlsearch = false
vim.opt.incsearch = true

vim.o.termguicolors = true
vim.cmd.colorscheme "everforest"

vim.opt.scrolloff = 8
vim.opt.updatetime = 50

vim.opt.colorcolumn = "80"

vim.opt.shortmess:append("I")

vim.api.nvim_set_option("mouse", "")

vim.g.netrw_banner = 0

-- For Avante.nvim
-- https://github.com/yetone/avante.nvim
vim.opt.laststatus = 3
