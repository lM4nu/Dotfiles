--mine
vim.o.clipboard = 'unnamedplus'
vim.o.title = true
vim.o.ignorecase = true
vim.o.number = true
vim.o.rnu = true
vim.o.splitright = true
vim.o.splitbelow = true
vim.o.background = 'dark'
-- vim.o.termguicolors = false

vim.o.tabstop = 2
vim.o.softtabstop = 2
vim.o.shiftwidth = 2

--kickstart
-- Set highlight on search
vim.o.hlsearch = false
-- Make line numbers default
vim.wo.number = true
-- Enable mouse mode
vim.o.mouse = 'a'
-- Sync clipboard between OS and Neovim.
vim.o.clipboard = 'unnamedplus'
-- Enable break indent
vim.o.breakindent = true
-- Save undo history
vim.o.undofile = true
-- Case-insensitive searching UNLESS \C or capital in search
vim.o.ignorecase = true
vim.o.smartcase = true
-- Keep signcolumn on by default
vim.wo.signcolumn = 'yes'
-- Decrease update time
vim.o.updatetime = 250
vim.o.timeoutlen = 300
-- Set completeopt to have a better completion experience
vim.o.completeopt = 'menuone,noselect'
