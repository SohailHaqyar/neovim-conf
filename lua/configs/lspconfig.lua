local nvlsp = require "nvchad.configs.lspconfig"
-- load defaults i.e lua_lsp
nvlsp.defaults()

local servers = {
  html = {},
  cssls = {},
  bashls = {},
  angularls = {},
  ts_ls = {
    init_options = {
      preferences = {
        disableSuggestions = false,
        importModuleSpecifierPreference = "absolute",
      },
    },
  },
  gopls = {},
  jsonls = {},
  yamlls = {},
  rust_analyzer = {},
}

for name, opts in pairs(servers) do
  opts.on_init = nvlsp.on_init
  opts.on_attach = nvlsp.on_attach
  -- opts.capabilities = nvlsp.capabilities

  require("lspconfig")[name].setup(opts)
end
--
