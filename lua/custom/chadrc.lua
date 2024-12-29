---@type ChadrcConfig
local M = {}

M.ui = { theme = "catppuccin", theme_style = "macchiato", transparency = true }

M.plugins = "custom.plugins"
M.mappings = require "custom.mappings"

vim.api.nvim_create_autocmd({ "UIEnter", "ColorScheme" }, {
  callback = function()
    local normal = vim.api.nvim_get_hl(0, { name = "Normal" })
    print(normal.bg)
    if not normal.bg then
      return
    end
    io.write(string.format("\027]11;#%06x\027\\", normal.bg))
  end,
})

vim.api.nvim_create_autocmd("UILeave", {
  callback = function()
    io.write "\027]111\027\\"
  end,
})
--
--
if vim.g.neovide then
  M.ui.transparency = false
end

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
return M
