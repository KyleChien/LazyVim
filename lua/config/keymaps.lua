-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

-- Select all
vim.keymap.set("n", "<leader>a", "gg<S-v>G", { desc = "Select all" })

-- Buffers
vim.keymap.set("n", "<leader>w", "<cmd>bdelete<CR>", { desc = "Delete current buffer" })
vim.keymap.set("n", "<leader>T", "<cmd>Resurrect<CR>", { desc = "Reopen last deleted buffer" })

-- NeoTree
vim.keymap.set("n", "<leader>b", "<cmd>Neotree focus buffers<CR>", { desc = "Focus on NeoTree buffers" })
vim.keymap.set(
  "n",
  "<leader>d",
  "<cmd>Neotree focus document_symbols<CR>",
  { desc = "Focus on NeoTree document symbols" }
)
