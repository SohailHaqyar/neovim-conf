local plugins = {
  {
    "neovim/nvim-lspconfig",
    config = function()
      require "plugins.configs.lspconfig"
      require "custom.configs.lspconfig"
    end,
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
      require("harpoon").setup {
        menu = {
          width = vim.api.nvim_win_get_width(0) - 8,
        },
      }
    end,
  },
  -- {
  --   "echasnovski/mini.ai",
  --   version = "*",
  --   event = "BufEnter",
  --   config = function()
  --     require("mini.ai").setup()
  --   end,
  -- },

  {
    "andymass/vim-matchup",
    config = function()
      -- may set any options here
      -- require("vim-matchup").setup()
      vim.g.matchup_matchparen_offscreen = { method = "popup" }
    end,
    event = "BufEnter",
  },
  -- {
  --   "ray-x/go.nvim",
  --   dependencies = { -- optional packages
  --     "ray-x/guihua.lua",
  --     "neovim/nvim-lspconfig",
  --     "nvim-treesitter/nvim-treesitter",
  --   },
  --   config = function()
  --     require("go").setup()
  --   end,
  --   event = { "CmdlineEnter" },
  --   ft = { "go", "gomod" },
  --   build = ':lua require("go.install").update_all_sync()', -- if you need to install/update all binaries
  -- },
  {
    "joeveiga/ng.nvim",
    event = "BufEnter",
    config = function()
      local opts = { noremap = true, silent = true }
      local ng = require "ng"
      vim.keymap.set("n", "<leader>at", ng.goto_template_for_component, opts)
      vim.keymap.set("n", "<leader>ac", ng.goto_component_with_template_file, opts)
      vim.keymap.set("n", "<leader>aT", ng.get_template_tcb, opts)
    end,
  },
  {
    "artemave/workspace-diagnostics.nvim",
    event = "BufEnter",
  },
  {
    "windwp/nvim-ts-autotag",
    event = "BufEnter",
    config = function()
      require("nvim-ts-autotag").setup {
        opts = {
          -- Defaults
          enable_close = true, -- Auto close tags
          enable_rename = true, -- Auto rename pairs of tags
          enable_close_on_slash = true, -- Auto close on trailing </
        },
      }
    end,
  },
  {
    "prichrd/netrw.nvim",
    event = "BufEnter",
    opts = {},
    config = function()
      require("netrw").setup {
        use_devicons = true,
      }
    end,
  },
  -- {
  --   "harrisoncramer/gitlab.nvim",
  --   dependencies = {
  --     "MunifTanjim/nui.nvim",
  --     "nvim-lua/plenary.nvim",
  --     "sindrets/diffview.nvim",
  --     "stevearc/dressing.nvim", -- Recommended but not required. Better UI for pickers.
  --     "nvim-tree/nvim-web-devicons", -- Recommended but not required. Icons in discussion tree.
  --   },
  --   enabled = true,
  --   build = function()
  --     require("gitlab.server").build(true)
  --   end, -- Builds the Go binary
  --   config = function()
  --     require("gitlab").setup()
  --   end,
  -- },
  -- lazy.nvim
  { "tpope/vim-fugitive", event = "BufEnter" },
  { "airblade/vim-gitgutter", event = "BufEnter" },

}
return plugins
