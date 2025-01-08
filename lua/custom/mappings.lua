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
  },
}
-- Your custom mappings
M.custom = {
  n = {
    ["<leader>;"] = {
      "<cmd>cn<CR>zz",
      "Forward Next",
    },
    ["<leader>h"] = {
      "<cmd>cp<CR>zz",
      "Quickfix Prev",
    },
    [";"] = {
      "<C-w>",
      "Manage windows",
    },
    -- ['<leader>e'] = {
    -- 	'<C-w>vgd',
    -- 	'open definition in vertical split',
    -- },
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

    ["<leader>pv"] = {
      "<cmd>silent !tmux neww darkseid<CR>",
      "Open tmux sessionizer",
    },
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
    --
    [";;"] = {
      ":qa!<CR>",
      "Write and Quit All",
      opts = { nowait = true },
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
    ["<leader>tt"] = {
      "<cmd>TroubleToggle<CR>",
      "Toggle Trouble",
    },
  },
}

M.nvterm = {
  plugin = true,

  t = {
    -- toggle in terminal mode
    ["<leader>tf"] = {
      function()
        require("nvterm.terminal").toggle "float"
      end,
      "Toggle floating term",
    },

    ["<A-h>"] = {
      function()
        require("nvterm.terminal").toggle "horizontal"
      end,
      "Toggle horizontal term",
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
    ["<leader>tf"] = {
      function()
        require("nvterm.terminal").toggle "float"
      end,
      "Toggle floating term",
    },

    ["<A-h>"] = {
      function()
        require("nvterm.terminal").toggle "horizontal"
      end,
      "Toggle horizontal term",
    },

    ["<A-v>"] = {
      function()
        require("nvterm.terminal").toggle "vertical"
      end,
      "Toggle vertical term",
    },

    -- new
    ["<leader>h"] = {
      function()
        require("nvterm.terminal").new "horizontal"
      end,
      "New horizontal term",
    },

    ["<leader>v"] = {
      function()
        require("nvterm.terminal").new "vertical"
      end,
      "New vertical term",
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

M.apm = {
  n = {
    ["<leader>apm"] = {
      function()
        require("vim-apm"):toggle_monitor()
      end,
      "Toggle APM",
    },
  },
}
return M
