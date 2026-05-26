vim.lsp.config("lua_ls", {
  settings = {
    Lua = { diagnostics = {
      globals = { "vim" },
    } },
  },
})

local severity = vim.diagnostic.severity
vim.diagnostic.config {
  -- float = {
  --   border = "rounded", -- Options: "none", "single", "double", "rounded", "solid", "shadow"
  --   source = "always", -- Shows the source of the diagnostic (e.g., tsserver, lua_ls)
  --   header = "", -- Removes the default "Diagnostics:" header
  --   prefix = "", -- Removes the prefix before each diagnostic text
  -- },
  -- virtual_text = true,
  signs = {
    text = {
      [severity.ERROR] = "",
      [severity.WARN] = "",
      [severity.INFO] = "",
      [severity.HINT] = "",
    },
  },
}

vim.lsp.config("rust_analyzer", {
  settings = {
    ["rust-analyzer"] = {
      -- https://rust-analyzer.github.io/book/configuration.html
      check = {
        command = "clippy",
      },
      procMacro = {
        enable = true,
      },
      cargo = {
        buildScripts = {
          enable = true,
        },
        allFeatures = true,
      },
    },
  },
})

require("mini.icons").tweak_lsp_kind()

local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities = vim.tbl_deep_extend("force", capabilities, require("mini.completion").get_lsp_capabilities())

vim.lsp.enable { "biome", "lua_ls", "rust_analyzer" }

vim.lsp.config("*", { capabilities = capabilities })

vim.api.nvim_create_autocmd("CursorHold", {
  callback = function()
    vim.diagnostic.open_float(nil, { focusable = false, source = "if_many" })
  end,
})
