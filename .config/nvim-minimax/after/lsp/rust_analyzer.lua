-- ┌────────────────────┐
-- │ LSP config example │
-- └────────────────────┘
--
-- This file contains configuration of 'rust_analyzer' language server.
-- Source: https://github.com/rust-lang/rust-analyzer
--
-- It is used by `:h vim.lsp.enable()` and `:h vim.lsp.config()`.
-- See `:h vim.lsp.Config` and `:h vim.lsp.ClientConfig` for all available fields.
return {
	on_attach = function(client, buf_id)
		-- Use this function to define buffer-local mappings and behavior that depend
		-- on attached client or only makes sense if there is language server attached.
	end,
	settings = {
		["rust-analyzer"] = {
			cargo = {
				allFeatures = true,
				loadOutDirsFromCheck = true,
			},
			check = {
				command = "clippy",
				allFeatures = true,
			},
			completion = {
				allWidgets = true,
				autoImport = {
					enable = true,
				},
			},
			diagnostics = {
				disable = {},
				preloadFunctionsThreshold = 1024,
			},
			inlayHints = {
				autoParameterHints = true,
				closureReturnType = "with_syntax",
				discriminantHints = "fieldValue",
				lifetimeElision = "avoid",
				bindingModeHints = { prefix = "always" },
			},
			procMacro = {
				enable = true,
			},
		},
	},
}
