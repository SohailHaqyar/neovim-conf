local plugins = {
  {
    "neovim/nvim-lspconfig",
    config = function()
      require "plugins.configs.lspconfig"
      require "custom.configs.lspconfig"
    end,
  },
  {
    "github/copilot.vim",
    lazy = false,
    -- config = function()
    --   -- Mapping tab is already used by NvChad
    --   vim.g.copilot_no_tab_map = true
    --   vim.g.copilot_assume_mapped = true
    --   vim.g.copilot_tab_fallback = ""
    -- end,
  },
  {
    "jose-elias-alvarez/null-ls.nvim",
    event = "VeryLazy",
    opts = function()
      return require "custom.configs.null-ls"
    end,
  },
  {

    "kylechui/nvim-surround",
    event = "BufEnter",
    config = function()
      require("nvim-surround").setup {}
    end,
  },
  {
    "ahmedkhalf/project.nvim",
    event = "BufEnter",
    config = function()
      require("project_nvim").setup {}
    end,
  },
  {
    "christoomey/vim-tmux-navigator",
    event = "BufEnter",
  },
  {
    "Pocco81/true-zen.nvim",
    lazy = false,
    config = function()
      require("true-zen").setup {}
    end,
  },
  -- Lua
  {
    "williamboman/mason.nvim",
    opts = {
      ensure_installed = {
        "typescript-language-server",
        "angular-language-server",
        "rust-analyzer",
        "eslint_d",
        "eslint-lsp",
        "prettier",
        "prettierd",
        "stylua",
        "lua-language-server",
      },
    },
  },
  {
    "ggandor/lightspeed.nvim",
    event = "BufEnter",
  },
  {
    "sindrets/diffview.nvim",
    event = "BufEnter",
    config = function()
      require("diffview").setup()
    end,
  },
  {
    "folke/trouble.nvim",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    opts = {
      use_diagnostic_signs = true,
    },
    event = "VeryLazy",
  },
  { "kevinhwang91/nvim-bqf", event = "VeryLazy" },
  -- lazy.nvim
  -- {
  --   "folke/noice.nvim",
  --   event = "VeryLazy",
  --   opts = {},
  --   config = function()
  --     require("noice").setup {
  --       lsp = {
  --         signature = {
  --           enabled = false,
  --         },
  --         hover = {
  --           enabled = false,
  --         },
  --       },
  --       messages = {
  --         enabled = false,
  --       },
  --     }
  --   end,
  --   dependencies = {
  --     "MunifTanjim/nui.nvim",
  --     {
  --       "rcarriga/nvim-notify",
  --
  --       config = function()
  --         local notify = require "notify"
  --         vim.notify = function(msg, ...)
  --           if msg:match "warning: multiple different client offset_encodings" then
  --             return
  --           end
  --
  --           if
  --             msg:match "warning: multiple different client offset_encodings detected for buffer, this is not supported yet"
  --           then
  --             return
  --           end
  --           notify(msg, ...)
  --         end
  --       end,
  --     },
  --   },
  -- },

  {
    "max397574/better-escape.nvim",
    config = function()
      require("better_escape").setup()
    end,
  },
  {
    "ThePrimeagen/harpoon",
    event = "BufEnter",
    config = function()
      require("harpoon").setup()
    end,
  },
  {
    "NeogitOrg/neogit",
    dependencies = {
      "nvim-lua/plenary.nvim", -- required
      "sindrets/diffview.nvim", -- optional - Diff integration
      "nvim-telescope/telescope.nvim", -- optional
      "ibhagwan/fzf-lua", -- optional
    },
    event = "BufEnter",
    config = function()
      require("neogit").setup()
    end,
  },
  {
    "ThePrimeagen/vim-apm",
    event = "BufEnter",
    config = function()
      local apm = require "vim-apm"
      apm:setup {}
    end,
  },
  -- local apm = require("vim-apm")
  --
  -- apm:setup({})
  -- vim.keymap.set("n", "<leader>apm", function() apm:toggle_monitor() end)
}

return plugins
