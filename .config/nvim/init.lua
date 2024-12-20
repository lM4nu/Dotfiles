vim.g.mapleader = ','
vim.g.maplocalleader = ','

-- [[ Install `lazy.nvim` plugin manager ]]
require('lazy-bootstrap')

-- [[ Configure plugins ]]
require('lazy-plugins')

-- GRUVBOX
require('gruvbox-material-config')

-- UserCmds
require('userCmds')

--Options
require('options')

-- Remaps
require('remaps')

-- Snippets/Autocmds
require('snippets-autocmds')

-- Terminal
require('terminal')

-- [[ Highlight on yank ]]
require('highlight-yank')

-- [[ Configure Telescope ]]
require('telescope-config')

-- [[ Configure Treesitter ]]
require('treesitter-config')

-- [[ Configure nvim-cmp ]]
require('nvim-cmp-config')

-- [[ Configure LSP ]]
require('lsp-config')

-- ibl
require("ibl").setup({ enabled = true, indent = { char = '╏' } })

-- NeoTree
require('neotree-config')

-- tabline
require('tabline-config')

-- The line beneath this is called `modeline`. See `:help modeline`
-- vim: ts=2 sts=2 sw=2 et
