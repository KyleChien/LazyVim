-- bootstrap lazy.nvim, LazyVim and your plugins
require("config.lazy")

-- scope.nvim
require("scope").setup({})
require("telescope").load_extension("scope")
