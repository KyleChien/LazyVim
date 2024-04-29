-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here
local opts = { noremap = true, silent = true }
local map = vim.keymap.set

-- Covered by Cinnamon
-- Keep cursor centered when scrolling
-- map("n", "<C-d>", "<C-d>zz", opts)
-- map("n", "<C-u>", "<C-u>zz", opts)

-- Move selected line / block of text in visual mode
map("v", "J", ":m '>+1<CR>gv=gv", opts)
map("v", "K", ":m '<-2<CR>gv=gv", opts)

-- Move to start/end of line
map({ "n", "x", "o" }, "H", "^", opts)
map({ "n", "x", "o" }, "L", "g_", opts)

-- Navigate buffers
map("n", "<Tab>", ":bnext<CR>", opts)
map("n", "<S-Tab>", ":bprevious<CR>", opts)

-- Panes resizing
map("n", "+", ":vertical resize +5<CR>")
map("n", "_", ":vertical resize -5<CR>")
map("n", "=", ":resize +5<CR>")
map("n", "-", ":resize -5<CR>")

-- Paste without overwriting register
map("v", "p", '"_dp')
map("v", "P", '"_dP')

map("n", "n", "nzzzv", opts)
map("n", "N", "Nzzzv", opts)
map("n", "*", "*zzzv", opts)
map("n", "#", "#zzzv", opts)

map("n", "<Esc>", ":nohlsearch<CR>", opts)

-- Select all
map("n", "<leader>a", "gg<S-v>G", opts)

-- Buffers
map("n", "<leader>w", "<cmd>bdelete<CR>", opts)
map("n", "<leader>T", "<cmd>Resurrect<CR>", opts)

-- NeoTree
-- map("n", "<C-b>", "<cmd>Neotree position=left filesystem toggle<CR>", opts)
map("n", "<leader>e", "<cmd>Neotree position=float filesystem toggle<CR>", opts)
map("n", "<leader>ds", "<cmd>Neotree position=float document_symbols toggle<CR>", opts)

-- Scope
-- map("n", "<leader>fs", "<cmd>Telescope scope buffers<CR>", opts)
