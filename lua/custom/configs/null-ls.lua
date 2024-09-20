local null_ls = require "null-ls"
local formatting = null_ls.builtins.formatting
-- local lint = null_ls.builtins.diagnostics
local code_actions = null_ls.builtins.code_actions
local completion = null_ls.builtins.completion.spell

local sources = {
  formatting.prettierd,
  formatting.stylua,
  code_actions.refactoring,
  formatting.gofumpt,
  completion.spell,
  completion.tags,
}

null_ls.setup {
  debug = true,
  sources = sources,
}
