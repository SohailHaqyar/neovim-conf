local M = {}

function IncreaseWindowWidth()
  local current_width = vim.fn.winwidth(0)
  local new_width = current_width + math.floor(vim.fn.winwidth(0) / 2)

  -- Set the new window width
  vim.cmd("vertical resize " .. new_width)
end
function DecreaseWindowWidth()
  local current_width = vim.fn.winwidth(0)
  local new_width = current_width - math.floor(vim.fn.winwidth(0) / 2)

  -- Set the new window width
  vim.cmd("vertical resize " .. new_width)
end

-- In order to disable a default keymap, use
M.disabled = {
  n = {
    ["<leader>n"] = "",
    ["<C-s>"] = "",
    ["<C-t>"] = "",
    ["<leader>e"] = "",
    ["<leader>h"] = "",
    ["<A-h>"] = "",
  },
  t = {
    ["<A-h>"] = "",
  },
}
-- Your custom mappings
M.custom = {
  n = {
    ["<leader>ws"] = {
      "<cmd>w|source % <CR>",
      "Write & Source",

    },
    ["<leader>tn"] = {
      "<cmd>tabnew %<CR>",
      "Open current file in a new tab",
    },
    ["<leader>pr"] = {
      "<cmd>DiffviewOpen HEAD..origin/master<CR>",
      "Open Diffview with master",
    },
    ["<leader>l"] = {
      "<cmd>cn<CR>zz",
      "Quickfix Next",
    },
    ["<leader>h"] = {
      "<cmd>cp<CR>zz",
      "Quickfix Prev",
    },

    ["<leader>ts"] = {
      "<cmd>silent !tmux neww darkseid<CR>",
      "Darkseid",
    },

    -- ["<C-u>"] = {
    --   "<C-u>zz",
    --   "Up & Center",
    -- },

    -- ["<C-d>"] = {
    --   "<C-d>zz",
    --   "Down & Center",
    -- },
    [";"] = {
      "<C-w>",
      "Manage windows",
    },
    ['<leader>gd'] = {
      function ()
        vim.lsp.buf.definition()
        vim.cmd('tabnew %')
      end,
    	'open definition in new tab',
    },
    ["<leader>+"] = {
      ":lua IncreaseWindowWidth()<CR>",
      "Increase width",
    },
    ["<leader>-"] = {
      ":lua DecreaseWindowWidth()<CR>",
      "Decrease width",
    },

    ["<leader>|"] = {
      "<C-w>|",
      "Maximize width",
    },

    ["<leader>="] = {
      "<C-w>=",
      "Equalize width",
    },
    --
    -- ["<C-n>"] = {
    --   "<cmd>Neotree<CR>",
    --   "Neo Tree",
    --
    -- },

    ["<C-n>"] = {
      "<cmd>:Ex<CR>",
      "Netrw File Explorer",
    },

    -- ["<leader>pv"] = {
    --   "<cmd>Triptych<CR>",
    --   "File Explorer",
    -- },
    -- The Harpoon Man
    ["<leader>a"] = {
      function()
        require("harpoon.mark").add_file()
      end,
      "Harpoon add file",
    },
    ["<C-e>"] = {
      function()
        require("harpoon.ui").toggle_quick_menu()
      end,
      "Harpoon quick menu",
    },
    -- :lua require("harpoon.ui").nav_next()                   -- navigates to next mark
    -- :lua require("harpoon.ui").nav_prev()                   -- navigates to previous mark
    --
    --
    --
    [";h"] = {
      function()
        require("harpoon.ui").nav_prev()
      end,
      "Harpoon nav prev",
    },

    [";l"] = {
      function()
        require("harpoon.ui").nav_next()
      end,
      "Harpoon nav next",
    },

    ["<C-p>"] = {
      function()
        require("harpoon.ui").nav_file(1)
      end,
      "Harpoon nav file 1",
    },
    ["<C-s>"] = {
      function()
        require("harpoon.ui").nav_file(2)
      end,
      "Harpoon nav file 2",
    },
    ["<C-t>"] = {
      function()
        require("harpoon.ui").nav_file(3)
      end,
      "Harpoon nav file 3",
    },
    ["<C-q>"] = {
      function()
        require("harpoon.ui").nav_file(4)
      end,
      "Harpoon nav file 4",
    },
    ["<leader>gf"] = {
      "<C-w>vgf",
      "go to file",
    },
    ["<leader>e"] = {
      function()
        vim.cmd "silent! neovide ."
      end,
      "Neovide",
      opts = {
        nowait = true,
        silent = true,
      },
    },

    --
    [";;"] = {
      "<cmd>qa!<CR>",
      "Write and Quit All",
    },
    ["<leader>nde"] = {
      function()
        local null_ls = require "null-ls"
        null_ls.disable "eslint_d"
      end,
      "Disable Eslint Diagnostics",
    },
    ["<leader>nee"] = {
      function()
        local null_ls = require "null-ls"
        null_ls.enable "eslint_d"
      end,
      "Enable Eslint_d diganostics",
    },
    ["<leader>ndd"] = {
      function()
        local null_ls = require "null-ls"
        null_ls.disable "shellcheck"
      end,
      "Disable Shellcheck Diagnostics",
    },
    ["<leader>za"] = {
      function()
        local truzen = require "true-zen"
        truzen.ataraxis()
      end,
      "Toggle Atraaxis Mode",
    },
    ["<leader>zf"] = {
      function()
        require("true-zen").focus()
      end,
      "Toggle Focus Mode",
    },
    ["<leader>zm"] = {
      function()
        require("true-zen").minimalist()
      end,
      "Toggle Minimalist Mode",
    },
    ["<C-l>"] = {
      ":TmuxNavigateRight<CR>",
      "Move Right",
      opts = { nowait = true },
    },
    ["<C-h>"] = {
      ":TmuxNavigateLeft<CR>",
      "Move Left",
      opts = { nowait = true },
    },
    ["<C-k>"] = {
      ":TmuxNavigateUp<CR>",
      "Move Up",
      opts = { nowait = true },
    },
    ["<C-j>"] = {
      ":TmuxNavigateDown<CR>",
      "Move Down",
      opts = { nowait = true },
    },
  },
  v = {
    ["<leader>zn"] = {
      ":'<,'>TZNarrow<CR>",
      "Enable Narrow Mode",
    },
  },
  -- i = {
  --   ["<C-l>"] = {
  --     function()
  --       vim.fn.feedkeys(vim.fn["copilot#Accept"](), "")
  --     end,
  --     "Copilot Accept",
  --     { replace_keycodes = true, nowait = true, silent = true, expr = true, noremap = true },
  --   },
  -- },
}

M.telescope = {
  n = {
    ["<leader>fs"] = {
      "<cmd> Telescope lsp_document_symbols <CR>",
      "Search current document symbols",
    },

    ["<leader>fas"] = {
      "<cmd> Telescope lsp_dynamic_workspace_symbols <CR>",
      "Search workspace symbols ",
    },
  },
}

M.buffers = {
  n = {
    ["<leader>bda"] = {
      "<cmd>%bd|e#<CR>",
      "Delete all buffers except current",
    },
  },
}

M.trouble = {
  n = {
    ["<leader>td"] = {
      "<cmd>Trouble diagnostics<CR>",
      "Trouble diagnostics",
    },
    ["<leader>tc"] = {
      "<cmd>Trouble close<CR>",
      "Trouble close",
    },
  },
}

M.nvterm = {
  plugin = true,

  t = {
    -- toggle in terminal mode
    ["<A-i>"] = {
      function()
        require("nvterm.terminal").toggle "float"
      end,
      "Toggle floating term",
    },

    ["<A-v>"] = {
      function()
        require("nvterm.terminal").toggle "vertical"
      end,
      "Toggle vertical term",
    },
  },

  n = {
    -- toggle in normal mode
    ["<A-i>"] = {
      function()
        require("nvterm.terminal").toggle "float"
      end,
      "Toggle floating term",
    },

    ["<A-v>"] = {
      function()
        require("nvterm.terminal").toggle "vertical"
      end,
      "Toggle vertical term",
    },
  },
}

local function setqflist_with_text()
  local qflist = vim.fn.getqflist()
  for _, entry in ipairs(qflist) do
    local bufnr = entry.bufnr
    local lnum = entry.lnum
    local line = vim.fn.getbufline(bufnr, lnum)[1]
    entry.text = line
  end
  vim.fn.setqflist(qflist)
end

M.quickfix = {
  n = {
    ["<leader>cq"] = {
      "<cmd>cclose<CR>",
      "close Quickfix",
    },

    ["<leader>rq"] = {
      function()
        setqflist_with_text()
      end,
      "Quickfix Refresh",
    },
  },
}
return M
