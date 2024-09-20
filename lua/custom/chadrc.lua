---@type ChadrcConfig
local M = {}

M.ui = { theme = "catppuccin", theme_style = "macchiato", transparency = false }

-- if vim.g.neovide then
--   M.ui.transparency = false
-- end

M.plugins = "custom.plugins"
M.mappings = require "custom.mappings"

vim.cmd [[
augroup kitty_mp
    autocmd!
    au VimLeave * if !empty($KITTY_WINDOW_ID) | :silent !kitty @ set-spacing padding=20 margin=0
    au VimEnter * if !empty($KITTY_WINDOW_ID) | :silent !kitty @ set-spacing padding=0 margin=0
    au BufEnter * if !empty($KITTY_WINDOW_ID) | :silent !kitty @ set-spacing padding=0 margin=0
augroup END
]]
--
vim.api.nvim_create_autocmd({ "UIEnter", "ColorScheme" }, {
  callback = function()
    local normal = vim.api.nvim_get_hl(0, { name = "Normal" })
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
return M
