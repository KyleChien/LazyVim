return {
  "nvim-neo-tree/neo-tree.nvim",
  opts = {
    source_selector = {
      winbar = true,
      statusline = true,

      sources = {
        { source = "filesystem" },
        { source = "buffers" },
        { source = "document_symbols" },
      },
    },
  },
}
