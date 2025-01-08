local config = require "plugins.configs.lspconfig"
local on_attach = config.on_attach
local capabilities = config.capabilities

local lspconfig = require "lspconfig"
-- local util = require "lspconfig/util"
-- json
lspconfig.jsonls.setup {
  on_attach = on_attach,
  capabilities = capabilities,
}
-- Typescript
lspconfig.tsserver.setup {
  on_attach = on_attach,
  capabilities = capabilities,
  init_options = {
    preferences = {
      disableSuggestions = true,
      importModuleSpecifierPreference = "relative",
    },
  },
}

-- FUCK this lsp
lspconfig.angularls.setup {
  on_attach = on_attach,
  capabilities = capabilities,
}

lspconfig.eslint.setup {
  on_attach = on_attach,
  capabilities = capabilities,
}

lspconfig.prismals.setup {
  on_attach = on_attach,
  capabilities = capabilities,
}

lspconfig.bashls.setup {
  on_attach = on_attach,
  capabilities = capabilities,
}

lspconfig.astro.setup {
  on_attach = on_attach,
  capabilities = capabilities,
}
--
-- -- Rust
-- lspconfig.rust_analyzer.setup {
--   on_attach = on_attach,
--   capabilities = capabilities,
--   filetypes = { "rust" },
--   root_dir = util.root_pattern "Cargo.toml",
-- }
--
-- -- Ruby
-- lspconfig.ruby_ls.setup {
--   on_attach = on_attach,
--   capabilities = capabilities,
-- }

lspconfig.clangd.setup {
  on_attach = on_attach,
  capabilities = capabilities,
}

lspconfig.tailwindcss.setup {

  on_attach = on_attach,
  capabilities = capabilities,
}
