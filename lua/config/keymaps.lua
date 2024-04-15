-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

-- Select all
vim.keymap.set("n", "<leader>a", "gg<S-v>G", { desc = "Select all" })

-- Keep window centered when going up/down
vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")
vim.keymap.set("n", "n", "nzzzv")
vim.keymap.set("n", "N", "Nzzzv")

-- Paste without overwriting register
vim.keymap.set("v", "p", '"_dP')

-- Buffers
vim.keymap.set("n", "<leader>w", "<cmd>bdelete<CR>", { desc = "Delete current buffer" })
vim.keymap.set("n", "<leader>T", "<cmd>Resurrect<CR>", { desc = "Reopen last deleted buffer" })

-- NeoTree
vim.keymap.set("n", "<leader>-", "<cmd>Neotree position=current toggle<CR>", { desc = "Open Neotree in fullscreen" })
vim.keymap.set(
  "n",
  "<leader>ds",
  "<cmd>Neotree focus document_symbols toggle<CR>",
  { desc = "Focus on NeoTree document symbols" }
)

-- Scope
vim.keymap.set("n", "<leader>fs", "<cmd>Telescope scope buffers<CR>", { desc = "Scoped buffers in all tabs" })
