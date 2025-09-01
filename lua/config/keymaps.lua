-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

-- Shift + Arrow to resize splits
vim.keymap.set("n", "<S-Up>", ":resize +3<CR>", { desc = "Resize window up" })
vim.keymap.set("n", "<S-Down>", ":resize -3<CR>", { desc = "Resize window down" })
vim.keymap.set("n", "<S-Left>", ":vertical resize -3<CR>", { desc = "Resize window left" })
vim.keymap.set("n", "<S-Right>", ":vertical resize +3<CR>", { desc = "Resize window right" })
