vim.lsp.config('lua_ls', {
  settings = {
    Lua = { diagnostics = {
        globals = { "vim"}
    }},
  },
})

vim.lsp.config('rust_analyzer', {
    settings = {
        ["rust-analyzer"] = {
            check = {
                command = "clippy"
            },
            procMacro = {
                enable = true
            },
            cargo = {
                buildScripts = {
                    enable = true
                },
                allFeatures = true
            }
        }
    }
})

vim.lsp.enable({ 'biome', 'lua_ls', 'rust_analyzer' })
