-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here
local opts = { noremap = true, silent = true }
local map = vim.keymap.set

-- Select all
map("n", "<C-a>", "gg<S-v>G", opts)

-- Move to start/end of line
map({ "n", "x", "o" }, "H", "^", opts)
map({ "n", "x", "o" }, "L", "g_", opts)

-- Panes resizing
map("n", "+", ":vertical resize +7<CR>")
map("n", "_", ":vertical resize -3<CR>")
map("n", "=", ":resize +7<CR>")
map("n", "-", ":resize -3<CR>")

-- Paste without overwriting register
map("v", "p", '"_dp')
map("v", "P", '"_dP')
