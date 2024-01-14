vim.api.nvim_create_user_command('Rc', ":tabe $HOME/.config/nvim/init.lua | tcd %:h", {})

vim.api.nvim_create_user_command("W", "execute ':silent w !sudo tee % > /dev/null' | :edit!", {})
