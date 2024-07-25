-- ==================================================
-- Plugin list
-- 2. nvim-surround
-- 3. neoscroll
-- 4. neo-tree
-- 5. harpoon
-- ==================================================
return {
  {
    "nvim-neo-tree/neo-tree.nvim",
    cmd = "Neotree",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "nvim-tree/nvim-web-devicons",
      "MunifTanjim/nui.nvim",
      "3rd/image.nvim",
      "jackielii/neo-tree-harpoon.nvim",
    },
    keys = {
      {
        "<leader>fe",
        function()
          require("neo-tree.command").execute({
            dir = LazyVim.root(),
            reveal = true,
          })
        end,
        desc = "Explorer NeoTree (Root Dir)",
      },
      {
        "<leader>fE",
        function()
          require("neo-tree.command").execute({
            dir = LazyVim.root(),
            reveal = true,
            position = "current",
          })
        end,
        desc = "Explorer NeoTree current (Root Dir)",
      },
      {
        "<leader>ge",
        function()
          require("neo-tree.command").execute({
            source = "git_status",
            reveal = true,
          })
        end,
        desc = "Git Explorer",
      },
      {
        "<leader>be",
        function()
          require("neo-tree.command").execute({
            source = "buffers",
            reveal = true,
          })
        end,
        desc = "Buffer Explorer",
      },
      {
        "<leader>bs",
        function()
          require("neo-tree.command").execute({
            source = "document_symbols",
            reveal = true,
          })
        end,
        desc = "Document symbols",
      },
      {
        "<leader>bh",
        function()
          require("neo-tree.command").execute({
            source = "harpoon-buffers",
            reveal = true,
          })
        end,
        desc = "Harpoon buffers",
      },
      -- remap buffer shortcuts, perform twice to force focus
      { "<leader>e", "<leader>fe<leader>fe", desc = "Explorer NeoTree (Root Dir)", remap = true },
      { "<leader>E", "<leader>fE<leader>fE", desc = "Explorer NeoTree current (Root Dir)", remap = true },
      { "<leader>r", "<leader>be<leader>be", desc = "Buffer Explorer", remap = true },
      { "<leader>t", "<leader>ge<leader>ge", desc = "Git Explorer", remap = true },
      { "<leader>d", "<leader>bs<leader>bs", desc = "Document symbols", remap = true },
      { "<leader>d", "<leader>bs<leader>bs", desc = "Document symbols", remap = true },
      { "<leader>h", "<leader>bh<leader>bh", desc = "Harpoon buffers", remap = true },
    },
    deactivate = function()
      vim.cmd([[Neotree close]])
    end,
    init = function()
      -- FIX: use `autocmd` for lazy-loading neo-tree instead of directly requiring it,
      -- because `cwd` is not set up properly.
      vim.api.nvim_create_autocmd("BufEnter", {
        group = vim.api.nvim_create_augroup("Neotree_start_directory", { clear = true }),
        desc = "Start Neo-tree with directory",
        once = true,
        callback = function()
          if package.loaded["neo-tree"] then
            return
          else
            local stats = vim.uv.fs_stat(vim.fn.argv(1))
            if stats and stats.type == "directory" then
              require("neo-tree")
            end
          end
        end,
      })
    end,
    opts = {
      sources = { "filesystem", "buffers", "git_status", "document_symbols", "harpoon-buffers" },
      open_files_do_not_replace_types = { "terminal", "Trouble", "trouble", "qf", "Outline" },
      filesystem = {
        bind_to_cwd = false,
        follow_current_file = { enabled = true },
        use_libuv_file_watcher = true,
      },
      window = {
        position = "right",
        width = 31,
        mappings = {
          ["l"] = "open",
          ["h"] = "close_node",
          ["<space>"] = "none",
          ["Y"] = {
            function(state)
              local node = state.tree:get_node()
              local path = node:get_id()
              vim.fn.setreg("+", path, "c")
            end,
            desc = "Copy Path to Clipboard",
          },
          ["O"] = {
            function(state)
              require("lazy.util").open(state.tree:get_node().path, { system = true })
            end,
            desc = "Open with System Application",
          },
          ["P"] = { "toggle_preview", config = { use_float = false } },
        },
      },
      default_component_configs = {
        indent = {
          with_expanders = true, -- if nil and file nesting is enabled, will enable expanders
          expander_collapsed = "",
          expander_expanded = "",
          expander_highlight = "NeoTreeExpander",
        },
        git_status = {
          symbols = {
            unstaged = "󰄱",
            staged = "󰱒",
          },
        },
      },
    },
    config = function(_, opts)
      local function on_move(data)
        LazyVim.lsp.on_rename(data.source, data.destination)
      end

      local events = require("neo-tree.events")
      opts.event_handlers = opts.event_handlers or {}
      vim.list_extend(opts.event_handlers, {
        { event = events.FILE_MOVED, handler = on_move },
        { event = events.FILE_RENAMED, handler = on_move },
      })
      require("neo-tree").setup(opts)
      vim.api.nvim_create_autocmd("TermClose", {
        pattern = "*lazygit",
        callback = function()
          if package.loaded["neo-tree.sources.git_status"] then
            require("neo-tree.sources.git_status").refresh()
          end
        end,
      })
    end,
  },
  {
    "ThePrimeagen/harpoon",
    branch = "harpoon2",
    dependencies = { "nvim-lua/plenary.nvim" },
    config = function()
      local harpoon = require("harpoon")
      harpoon:setup()

      -- stylua: ignore start
      local function add() harpoon:list():add() end
      local function toggle() harpoon.ui:toggle_quick_menu(harpoon:list()) end
      local function select(i) return function() harpoon:list():select(i) end end

      vim.keymap.set("n", "<Tab><CR>", add, {desc = "Add to harpoon"})
      vim.keymap.set("n", "<Tab><Tab>", toggle, {desc = "Add to harpoon"})
      vim.keymap.set("n", "<Tab>1", select(1), {desc = "Add to harpoon"})
      vim.keymap.set("n", "<Tab>2", select(2), {desc = "Add to harpoon"})
      vim.keymap.set("n", "<Tab>3", select(3), {desc = "Add to harpoon"})
      vim.keymap.set("n", "<Tab>4", select(4), {desc = "Add to harpoon"})
      vim.keymap.set("n", "<Tab>5", select(5), {desc = "Add to harpoon"})
      -- stylua: ignore end
    end,
  },
  -- {
  --   "folke/edgy.nvim",
  --   event = "VeryLazy",
  --   opts = {
  --     keys = {},
  --     right = {
  --       {
  --         title = "Neo-Tree",
  --         ft = "neo-tree",
  --         filter = function(buf)
  --           return vim.b[buf].neo_tree_source == "filesystem"
  --         end,
  --         size = { height = 0.5 },
  --         collapsed = false,
  --         pinned = true,
  --       },
  --       {
  --         title = "Harpoon Buffers",
  --         ft = "neo-tree",
  --         filter = function(buf)
  --           return vim.b[buf].neo_tree_source == "harpoon-buffers"
  --         end,
  --         pinned = true,
  --         collapsed = false,
  --         open = "Neotree position=top harpoon-buffers",
  --         size = { height = 0.2 },
  --       },
  --     },
  --   },
  -- },
}
