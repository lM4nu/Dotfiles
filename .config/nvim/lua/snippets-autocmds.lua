-- Snippets/Autocmds
vim.api.nvim_create_autocmd("BufEnter", { pattern = "*.md", command = "imap 'a á" })
vim.api.nvim_create_autocmd("BufEnter", { pattern = "*.md", command = "imap 'A Á" })
vim.api.nvim_create_autocmd("BufEnter", { pattern = "*.md", command = "imap 'e é" })
vim.api.nvim_create_autocmd("BufEnter", { pattern = "*.md", command = "imap 'E É" })
vim.api.nvim_create_autocmd("BufEnter", { pattern = "*.md", command = "imap 'i í" })
vim.api.nvim_create_autocmd("BufEnter", { pattern = "*.md", command = "imap 'I Í" })
vim.api.nvim_create_autocmd("BufEnter", { pattern = "*.md", command = "imap 'o ó" })
vim.api.nvim_create_autocmd("BufEnter", { pattern = "*.md", command = "imap 'O Ó" })
vim.api.nvim_create_autocmd("BufEnter", { pattern = "*.md", command = "imap 'u ú" })
vim.api.nvim_create_autocmd("BufEnter", { pattern = "*.md", command = "imap 'U Ú" })
vim.api.nvim_create_autocmd("BufEnter", { pattern = "*.md", command = "imap 'n ñ" })
vim.api.nvim_create_autocmd("BufEnter", { pattern = "*.md", command = "imap 'N Ñ" })

vim.api.nvim_create_autocmd("BufEnter", { pattern = "blocks.h", command = "silent! lcd %:p:h" })

vim.api.nvim_create_autocmd("BufWritePost",
  { pattern = "blocks.h", command = "!sudo make install && pkill dwmblocks && setsid -f dwmblocks" })

vim.api.nvim_create_autocmd("BufWritePost",
  { pattern = "~/.config/waybar/style.css", command = ":silent !killall -SIGUSR2 waybar" })

vim.api.nvim_create_autocmd("BufWritePost",
  { pattern = "~/.config/waybar/config", command = ":silent !pkill waybar && setsid -f waybar &" })

vim.api.nvim_create_autocmd("BufWritePost", {
  pattern = "~/.config/hypr/hyprland.conf",
  command =
  ":silent !hypctl reload"
})

vim.api.nvim_create_autocmd("BufEnter", { pattern = "user-overrides.js", command = "silent! lcd %:p:h" })

vim.api.nvim_create_autocmd("BufWritePost",
  { pattern = "user-overrides.js", command = "!./updater.sh -s && ./prefsCleaner.sh -s" })

vim.api.nvim_create_autocmd("BufEnter", { pattern = "icons", command = "set filetype=sh" })

vim.api.nvim_create_autocmd("BufWritePost", { pattern = "dunstrc", command = ":silent !pkill dunst && setsid -f dunst" })

vim.api.nvim_create_autocmd("BufWritePost", { pattern = "sxhkdrc", command = ":silent !pkill -10 sxhkd" })

vim.api.nvim_create_autocmd("BufWritePost",
  { pattern = vim.fn.expand("~") .. "/.config/x11/Xresources", command = "!xrdb %" })

-- Snippets

vim.api.nvim_create_autocmd("FileType",
  { pattern = "java", command = "inoremap psvm public static void main(String[] args) { <Enter><Enter> }<Esc>ki" })

vim.api.nvim_create_autocmd("FileType", { pattern = "java", command = "inoremap sout System.out.println();<Esc>hi" })

vim.api.nvim_create_autocmd("BufEnter", { pattern = "*.js", command = "inoremap CL console.log();<Esc>hi" })

vim.api.nvim_create_autocmd("BufEnter", { pattern = "*.js", command = ":set shiftwidth=2" })

vim.api.nvim_create_autocmd("BufEnter", { pattern = "*.ts", command = "inoremap CL console.log();<Esc>hi" })

-- vim.api.nvim_create_autocmd("BufEnter", { pattern = "*.ts", command = ":set shiftwidth=2" })

vim.api.nvim_create_autocmd("BufEnter", { pattern = "*.pug", command = ":set shiftwidth=2 expandtab" })
