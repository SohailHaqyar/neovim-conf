local null_ls = require "null-ls"
local formatting = null_ls.builtins.formatting
local lint = null_ls.builtins.diagnostics
local code_actions = null_ls.builtins.code_actions

local sources = {
  formatting.prettierd,
  formatting.stylua,
  lint.tsc,
  code_actions.refactoring,
}

-- Save on format
-- local augroup = vim.api.nvim_create_augroup("LspFormatting", {})

null_ls.setup {
  debug = false,
  sources = sources,
  -- on_attach = function(client, bufnr)
  --   if client.supports_method "textDocument/formatting" then
  --     vim.api.nvim_clear_autocmds {
  --       group = augroup,
  --       buffer = bufnr,
  --     }
  --     vim.api.nvim_create_autocmd("BufWritePre", {
  --       group = augroup,
  --       buffer = bufnr,
  --       callback = function()
  --         vim.lsp.buf.format { async = false }
  --       end,
  --     })
  --   end
  -- end,
}
