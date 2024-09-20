local config = require "plugins.configs.lspconfig"
local on_attach = config.on_attach
local capabilities = config.capabilities

local lspconfig = require "lspconfig"
local util = require "lspconfig/util"

-- HTML, CSS, JS, Angular

-- Typescript
lspconfig.ts_ls.setup {
  on_attach = on_attach,
  capabilities = capabilities,
  init_options = {
    preferences = {
      disableSuggestions = true,
      importModuleSpecifierPreference = "relative",
    },
  },
}

lspconfig.angularls.setup {
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
lspconfig.rust_analyzer.setup {
  on_attach = on_attach,
  capabilities = capabilities,
}
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

lspconfig.hyprls.setup {
  on_attach = on_attach,
  capabilities = capabilities,
}

lspconfig.gopls.setup {
  on_attach = on_attach,
  capabilities = capabilities,
}

lspconfig.tailwindcss.setup {
  on_attach = on_attach,
  capabilities = capabilities,
}

-- lspconfig.csharp_ls.setup {
--   on_attach = on_attach,
--   capabilities = capabilities,
-- }
