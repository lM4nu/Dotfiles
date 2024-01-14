-- Remaps
vim.keymap.set("i", "jj", "<Esc>")

vim.keymap.set({ 'n', 'v', 'i' }, '<C-h>', '<C-w>h')
vim.keymap.set({ 'n', 'v', 'i' }, '<C-j>', '<C-w>j')
vim.keymap.set({ 'n', 'v', 'i' }, '<C-k>', '<C-w>k')
vim.keymap.set({ 'n', 'v', 'i' }, '<C-l>', '<C-w>l')

vim.keymap.set('n', '<leader>s', ':setlocal spell! spelllang=es<CR>')
vim.keymap.set('n', '<leader>S', ':setlocal spell! spelllang=en_us<CR>')

vim.keymap.set('n', "r'a", 'rá')
vim.keymap.set('n', "r'A", 'rÁ')
vim.keymap.set('n', "r'e", 'ré')
vim.keymap.set('n', "r'E", 'rÉ')
vim.keymap.set('n', "r'i", 'rí')
vim.keymap.set('n', "r'I", 'rÍ')
vim.keymap.set('n', "r'o", 'ró')
vim.keymap.set('n', "r'O", 'rÓ')
vim.keymap.set('n', "r'u", 'rú')
vim.keymap.set('n', "r'U", 'rÚ')
vim.keymap.set('n', "r'n", 'rñ')
vim.keymap.set('n', "r'N", 'rÑ')

-- Kickstart

-- [[ Basic Keymaps ]]

-- Keymaps for better default experience
-- See `:help vim.keymap.set()`
vim.keymap.set({ 'n', 'v' }, '<Space>', '<Nop>', { silent = true })

-- Remap for dealing with word wrap
-- vim.keymap.set('n', 'k', "v:count == 0 ? 'gk' : 'k'", { expr = true, silent = true })
-- vim.keymap.set('n', 'j', "v:count == 0 ? 'gj' : 'j'", { expr = true, silent = true })

-- Diagnostic keymaps
vim.keymap.set('n', '[d', vim.diagnostic.goto_prev, { desc = 'Go to previous diagnostic message' })
vim.keymap.set('n', ']d', vim.diagnostic.goto_next, { desc = 'Go to next diagnostic message' })
vim.keymap.set('n', '<leader>e', vim.diagnostic.open_float, { desc = 'Open floating diagnostic message' })
vim.keymap.set('n', '<leader>q', vim.diagnostic.setloclist, { desc = 'Open diagnostics list' })
