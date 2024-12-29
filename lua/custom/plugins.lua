local cmp = require "cmp"
local plugins = {
  {
    "neovim/nvim-lspconfig",
    config = function()
      require "plugins.configs.lspconfig"
      require "custom.configs.lspconfig"
    end,
  },
  {
    "nvim-telescope/telescope.nvim",
    opts = function(_, conf)
      local ts_select_dir_for_grep = function(prompt_bufnr)
        local action_state = require "telescope.actions.state"
        local fb = require("telescope").extensions.file_browser
        local live_grep = require("telescope.builtin").live_grep
        local current_line = action_state.get_current_line()

        fb.file_browser {
          files = false,
          depth = false,
          attach_mappings = function(prompt_bufnr)
            require("telescope.actions").select_default:replace(function()
              local entry_path = action_state.get_selected_entry().Path
              local dir = entry_path:is_dir() and entry_path or entry_path:parent()
              local relative = dir:make_relative(vim.fn.getcwd())
              local absolute = dir:absolute()

              live_grep {
                results_title = relative .. "/",
                cwd = absolute,
                default_text = current_line,
              }
            end)

            return true
          end,
        }
      end
      local newOpts = {
        pickers = {
          live_grep = {
            mappings = {
              i = {
                ["<C-f>"] = ts_select_dir_for_grep,
              },
              n = {
                ["<C-f>"] = ts_select_dir_for_grep,
              },
            },
          },
        },
      }
      require("telescope").setup(vim.tbl_deep_extend("force", conf, newOpts))
    end,
  },

  {
    "jose-elias-alvarez/null-ls.nvim",
    event = "VeryLazy",
    opts = function()
      return require "custom.configs.null-ls-config"
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
  -- {
  --   "ggandor/lightspeed.nvim",
  --   event = "BufEnter",
  -- },
  {
    "sindrets/diffview.nvim",
    event = "BufEnter",
    config = function()
      require "custom.configs.diffview"
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
          width = vim.api.nvim_win_get_width(0) - 2,
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
      vim.keymap.set("n", "<leader>at", function()
        ng.goto_template_for_component()
      end, opts)
      vim.keymap.set("n", "<leader>ac", function()
        ng.goto_component_with_template_file()
      end, opts)
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
  {
    "kevinhwang91/nvim-ufo",
    dependencies = { "kevinhwang91/promise-async" },
    lazy = false,
    config = function()
      vim.o.foldcolumn = "0" -- '0' is not bad
      vim.o.foldlevel = 99 -- Using ufo provider need a large value, feel free to decrease the value
      vim.o.foldlevelstart = 99
      vim.o.foldenable = true

      vim.opt.foldnestmax = 4

      -- Using ufo provider need remap `zR` and `zM`. If Neovim is 0.6.1, remap yourself
      vim.keymap.set("n", "zR", require("ufo").openAllFolds)
      vim.keymap.set("n", "zM", require("ufo").closeAllFolds)
      vim.keymap.set("n", "zr", require("ufo").openFoldsExceptKinds)
      vim.keymap.set("n", "zm", require("ufo").closeFoldsWith) -- closeAllFolds == closeFoldsWith(0)
      vim.keymap.set("n", "K", function()
        local winid = require("ufo").peekFoldedLinesUnderCursor()
        if not winid then
          vim.lsp.buf.hover()
        end
      end)

      local handler = function(virtText, lnum, endLnum, width, truncate)
        local newVirtText = {}
        local suffix = (" 󰁂 %d "):format(endLnum - lnum)
        local sufWidth = vim.fn.strdisplaywidth(suffix)
        local targetWidth = width - sufWidth
        local curWidth = 0
        for _, chunk in ipairs(virtText) do
          local chunkText = chunk[1]
          local chunkWidth = vim.fn.strdisplaywidth(chunkText)
          if targetWidth > curWidth + chunkWidth then
            table.insert(newVirtText, chunk)
          else
            chunkText = truncate(chunkText, targetWidth - curWidth)
            local hlGroup = chunk[2]
            table.insert(newVirtText, { chunkText, hlGroup })
            chunkWidth = vim.fn.strdisplaywidth(chunkText)
            -- str width returned from truncate() may less than 2nd argument, need padding
            if curWidth + chunkWidth < targetWidth then
              suffix = suffix .. (" "):rep(targetWidth - curWidth - chunkWidth)
            end
            break
          end
          curWidth = curWidth + chunkWidth
        end
        table.insert(newVirtText, { suffix, "MoreMsg" })
        return newVirtText
      end

      -- global handler
      -- `handler` is the 2nd parameter of `setFoldVirtTextHandler`,
      -- check out `./lua/ufo.lua` and search `setFoldVirtTextHandler` for detail.
      require("ufo").setup {
        fold_virt_text_handler = handler,
      }
    end,
  },
  {
    "hedyhli/outline.nvim",
    config = function()
      -- Example mapping to toggle outline
      vim.keymap.set("n", "<leader>o", "<cmd>Outline<CR>", { desc = "Toggle Outline" })

      require("outline").setup {}
    end,
    lazy = false,
  },
  {
    "anuvyklack/windows.nvim",
    dependencies = {
      "anuvyklack/middleclass",
    },

    config = function()
      require("windows").setup()
    end,
    lazy = false,
  },
  {
    "kdheepak/lazygit.nvim",
    lazy = true,
    cmd = {
      "LazyGit",
      "LazyGitConfig",
      "LazyGitCurrentFile",
      "LazyGitFilter",
      "LazyGitFilterCurrentFile",
    },
    -- optional for floating window border decoration
    dependencies = {
      "nvim-lua/plenary.nvim",
    },
    -- setting the keybinding for LazyGit with 'keys' is recommended in
    -- order to load the plugin when the command is run for the first time
    keys = {
      { "<leader>lg", "<cmd>LazyGit<cr>", desc = "LazyGit" },
    },
  },
  -- {
  --   "mrcjkb/rustaceanvim",
  --   version = "^4",
  --   ft = { "rust" },
  --   dependencies = "neovim/nvim-lspconfig",
  --   config = function()
  --     require "custom.configs.rustaceanvim"
  --   end,
  -- },
  -- {
  --   "saecki/crates.nvim",
  --   ft = { "toml" },
  --   config = function(_, opts)
  --     local crates = require "crates"
  --     crates.setup(opts)
  --     require("cmp").setup.buffer {
  --       sources = { { name = "crates" } },
  --     }
  --     crates.show()
  --     require("core.utils").load_mappings "crates"
  --   end,
  -- },
  {
    "rust-lang/rust.vim",
    ft = "rust",
    init = function()
      vim.g.rustfmt_autosave = 1
    end,
  },
  -- {
  --   "hrsh7th/nvim-cmp",
  --   opts = function()
  --     local M = require "plugins.configs.cmp"
  --     M.completion.completeopt = "menu,menuone,noselect"
  --     M.mapping["<CR>"] = cmp.mapping.confirm {
  --       behavior = cmp.ConfirmBehavior.Insert,
  --       select = false,
  --     }
  --     table.insert(M.sources, { name = "crates" })
  --     return M
  --   end,
  -- },
  -- { "github/copilot.vim", lazy = false },
  {
    "kevinhwang91/rnvimr",
    lazy = false,
  },
  {
    "prichrd/netrw.nvim",
    opts = {},
    lazy = false,
    config = function()
      require("netrw").setup {
        use_devicons = true,
      }
    end,
  },
  -- {
  --   "nvim-neo-tree/neo-tree.nvim",
  --   branch = "v3.x",
  --   dependencies = {
  --     "nvim-lua/plenary.nvim",
  --     "nvim-tree/nvim-web-devicons", -- not strictly required, but recommended
  --     "MunifTanjim/nui.nvim",
  --     "saifulapm/neotree-file-nesting-config", -- add plugin as dependency. no need any other config or setup call
  --   },
  --   opts = {},
  --   config = function()
  --     require "custom.configs.neo-tree"
  --   end,
  --   lazy = false,
  -- },
  {
    "s1n7ax/nvim-window-picker",
    name = "window-picker",
    event = "VeryLazy",
    version = "2.*",
    config = function()
      require("window-picker").setup()
    end,
  },
  {
    "lervag/vimtex",
    lazy = false, -- we don't want to lazy load VimTeX
    -- tag = "v2.15", -- uncomment to pin to a specific release
    init = function()
      -- VimTeX configuration goes here, e.g.
      vim.g.vimtex_view_method = "zathura"
      vim.cmd "filetype plugin indent on"
    end,
    enabled = false,
  },
  {
    "theRealCarneiro/hyprland-vim-syntax",
    lazy = false,
  },
  {
    "romgrk/barbar.nvim",
    enabled = true,
    dependencies = {
      "lewis6991/gitsigns.nvim", -- OPTIONAL: for git status
      "nvim-tree/nvim-web-devicons", -- OPTIONAL: for file icons
    },
    init = function()
      require "custom.configs.barbar"
    end,
    opts = {
      animation = true,
      insert_at_start = true,
    },
    event = "BufEnter",
    version = "^1.0.0", -- optional: only update when a new 1.x version is released
  },

  {
    "NeogitOrg/neogit",
    dependencies = {
      "nvim-lua/plenary.nvim", -- required
      "sindrets/diffview.nvim", -- optional - Diff integration

      "nvim-telescope/telescope.nvim", -- optional
    },
    config = function()
      require "custom.configs.neogit-config"
    end,
    cmd = "Neogit", -- Loads when command is used
  },
  {
    "echasnovski/mini.animate",
    version = false,
    init = function()
      require("mini.animate").setup()
    end,
    -- enabled = function()
    --   return not vim.g.neovide
    -- end,
    enabled = false,
  },
  {
    "echasnovski/mini.indentscope",
    version = false,
    init = function()
      require("mini.indentscope").setup()
    end,
  },
  {
    "ggandor/leap.nvim",
    config = function()
      vim.keymap.set({ "n", "x", "o" }, "s", "<Plug>(leap-forward)")
      vim.keymap.set({ "n", "x", "o" }, "S", "<Plug>(leap-backward)")
      vim.keymap.set({ "n", "x", "o" }, "gs", "<Plug>(leap-from-window)")
    end,
    dependencies = {
      "tpope/vim-repeat",
    },
    event = "BufEnter",
  },
  {
    "nvimtools/none-ls.nvim",
    opts = function(_, opts)
      local nls = require "null-ls"
      vim.g.lazyvim_prettier_needs_config = true
      opts.sources = opts.sources or {}
      table.insert(opts.sources, nls.builtins.formatting.biome)
    end,
  },
  {
    "nvim-telescope/telescope-file-browser.nvim",
    dependencies = { "nvim-telescope/telescope.nvim", "nvim-lua/plenary.nvim" },
    config = function()
      require("telescope").load_extension "file_browser"
      vim.keymap.set("n", "<leader>fe", ":Telescope file_browser path=%:p:h select_buffer=true<CR>")
    end,
    event = "VeryLazy",
  },
 {
  "lukas-reineke/lsp-format.nvim",
  event = "BufEnter"
}
}

return plugins
