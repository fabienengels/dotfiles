-- load defaults i.e lua_lsp
require("nvchad.configs.lspconfig").defaults()

local lspconfig = require "lspconfig"

local servers = {
  "ansiblels",
  "arduino_language_server",
  "astro",
  "bashls",
  "cssls",
  "dockerls",
  "efm",
  -- "elixirls",
  "gopls",
  "html",
  "htmx",
  "hyprls",
  "jinja_lsp",
  "jsonls",
  -- "lexical",
  "lua_ls",
  "marksman",
  "nil_ls",
  "nushell",
  "openscad_ls",
  -- "postgres_lsp",
  "pylyzer",
  "ruff",
  "rust_analyzer",
  "svelte",
  "tailwindcss",
  "terraformls",
  "ts_ls",
  "typst_lsp",
}

local nvlsp = require "nvchad.configs.lspconfig"

-- lsps with default config
for _, lsp in ipairs(servers) do
  lspconfig[lsp].setup {
    on_attach = nvlsp.on_attach,
    on_init = nvlsp.on_init,
    capabilities = nvlsp.capabilities,
  }
end

-- configuring single server, example: typescript
-- lspconfig.tsserver.setup {
--   on_attach = nvlsp.on_attach,
--   on_init = nvlsp.on_init,
--   capabilities = nvlsp.capabilities,
-- }
