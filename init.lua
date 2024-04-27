-- bootstrap lazy.nvim, LazyVim and your plugins
require("config.lazy")

-- neoscroll
-- require("neoscroll").setup({})

-- scope.nvim
require("scope").setup({})
require("telescope").load_extension("scope")
