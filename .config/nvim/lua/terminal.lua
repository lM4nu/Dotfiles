-- Terminal
vim.api.nvim_create_autocmd("BufEnter", {
  pattern = "*",
  command = "if &buftype == 'terminal' | :startinsert | endif",
})

local openTerminal = function()
  vim.cmd("split term://zsh")
  vim.cmd("resize 5")
end

local openTerminalTab = function()
  vim.cmd("tabe term://zsh")
end

vim.keymap.set('n', '<c-n>', openTerminal)
vim.keymap.set('n', '<c-n>n', openTerminalTab)
vim.keymap.set('t', '<Esc>', '<C-\\><C-n>')
