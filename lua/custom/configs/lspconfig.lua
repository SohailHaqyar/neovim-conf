local config = require "plugins.configs.lspconfig"
local capabilities = config.capabilities
local lspconfig = require "lspconfig"
local util = require "lspconfig/util"

-- HTML, CSS, JS, Angular

local formatter = require("lsp-format")
formatter.setup{}

local on_attach = function(client, bufnr)
    formatter.on_attach(client, bufnr)
    config.on_attach(client,bufnr)
end

-- Typescript
lspconfig.ts_ls.setup {
  on_attach = on_attach,
  capabilities = capabilities,
  init_options = {
    documentFormatting = true,
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

lspconfig.cssls.setup {
  on_attach = on_attach,
  capabilities = capabilities,
}

lspconfig.html.setup {
  on_attach = on_attach,
  capabilities = capabilities,
}

lspconfig.yamlls.setup {
  on_attach = on_attach,
  capabilities = capabilities,
}
--
-- lspconfig.bacon_ls.setup {
--   on_attach = on_attach,
--   capabilities = capabilities,
-- }
--
lspconfig.rust_analyzer.setup {
  on_attach = on_attach,
  capabilities = capabilities,
}
-- lspconfig.eslint.setup {
--   on_attach = on_attach,
--   capabilities = capabilities,
-- }

-- lspconfig.csharp_ls.setup {
--   on_attach = on_attach,
--   capabilities = capabilities,
-- }
--
--
-- lspconfig.somesass_ls.setup {
--
--   on_attach = on_attach,
--   capabilities = capabilities,
-- }

local jsonCapabilites = capabilities
jsonCapabilites.textDocument.completion.completionItem.snippetSupport = true
lspconfig.jsonls.setup {
  on_attach = on_attach,
  capabilities = jsonCapabilites,
}

lspconfig.pyright.setup {
  on_attach = on_attach,
  capabilities = jsonCapabilites,
}

-- lspconfig.lemminx.setup {
--   on_attach = on_attach,
--   capabilities = jsonCapabilites,
--   filetypes = { "xml", "xsl", "xhtml", "xaml", "xlf" },
-- }
