---@type ChadrcConfig
local M = {}

M.ui = { theme = "catppuccin", theme_style = "macchiato" }

M.plugins = "custom.plugins"
M.mappings = require "custom.mappings"
return M
