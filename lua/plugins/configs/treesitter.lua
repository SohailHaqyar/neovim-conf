local options = {
  ensure_installed = { "lua", "typescript", "html", "bash" },

  highlight = {
    enable = true,
    use_languagetree = true,
  },

  indent = { enable = true },
}
-- Function to setup italic highlights
local function Setup_italic_highlights()
  -- Common Treesitter groups that often look good in italic
  vim.api.nvim_set_hl(0, "@comment", { italic = true })
  vim.api.nvim_set_hl(0, "@comment.documentation", { italic = true })

  -- @comment               ; line and block comments
  -- @comment.documentation ; comments documenting code
  -- vim.api.nvim_set_hl(0, "@keyword", { italic = true })
  -- vim.api.nvim_set_hl(0, "@keyword.function", { italic = true })
  -- vim.api.nvim_set_hl(0, "@keyword.return", { italic = true })
  -- vim.api.nvim_set_hl(0, "@keyword.operator", { italic = true })
  -- vim.api.nvim_set_hl(0, "@parameter", { italic = true })
  -- vim.api.nvim_set_hl(0, "@property", { italic = true })
  -- vim.api.nvim_set_hl(0, "@type.builtin", { italic = true })
  -- vim.api.nvim_set_hl(0, "@variable.builtin", { italic = true })
  -- vim.api.nvim_set_hl(0, "@constant.builtin", { italic = true })
  -- vim.api.nvim_set_hl(0, "@text.emphasis", { italic = true })
  -- vim.api.nvim_set_hl(0, "@function.macro", { italic = true })
  -- vim.api.nvim_set_hl(0, "@tag.attribute", { italic = true })
  vim.api.nvim_set_hl(0, "@tag.attribute", { italic = true })
  -- @string                 ; string literals
  -- @string.documentation   ; string documenting code (e.g. Python docstrings)
  -- @string.regexp          ; regular expressions
  -- @string.escape          ; escape sequences
  -- @string.special         ; other special strings (e.g. dates)
  -- @string.special.symbol  ; symbols or atoms
  -- @string.special.url     ; URIs (e.g. hyperlinks)
  -- @string.special.path    ; filenames
  --
  -- @character              ; character literals
  -- @character.special      ; special characters (e.g. wildcards)
  --
  -- @boolean                ; boolean literals
  -- @number                 ; numeric literals
  -- @number.float           ; floating-point number literals

  -- Language-specific highlights for your installed parsers
  -- TypeScript/JavaScript
  vim.api.nvim_set_hl(0, "@constructor.typescript", { italic = true })
  vim.api.nvim_set_hl(0, "@type.typescript", { italic = true })
  --
  -- -- HTML
  -- vim.api.nvim_set_hl(0, "@tag.attribute.html", { italic = true })
  --
  -- -- Lua
  -- vim.api.nvim_set_hl(0, "@field.lua", { italic = true })
  --
  -- vim.api.nvim_set_hl(0, "@property.typescript", { italic = true }) -- Object keys
  -- vim.api.nvim_set_hl(0, "@field.typescript", { italic = true }) -- Object fields
  -- vim.api.nvim_set_hl(0, "@variable.typescript", { italic = true }) -- Object values
  vim.api.nvim_set_hl(0, "@type.definition.typescript", { italic = true }) -- Interface names
  -- vim.api.nvim_set_hl(0, "@property.definition.typescript", { italic = true }) -- Interface properties
  --
  -- vim.api.nvim_set_hl(0, "@property.javascript", { italic = true })
  -- vim.api.nvim_set_hl(0, "@field.javascript", { italic = true })
  -- vim.api.nvim_set_hl(0, "@variable.javascript", { italic = true })
  --
  vim.api.nvim_set_hl(0, "@type.qualifier", { italic = true }) -- 'interface' and 'type' keywords
  vim.api.nvim_set_hl(0, "@type.typeParameter", { italic = true }) -- Generic type parameters
end

-- Set up an autocmd to apply highlights after colorscheme changes
vim.api.nvim_create_autocmd("ColorScheme", {
  callback = function()
    Setup_italic_highlights()
  end,
})

-- Initial setup of highlights
Setup_italic_highlights()

return options
