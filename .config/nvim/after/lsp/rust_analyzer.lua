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
			-- Note: keys below match the schema of rust-analyzer 2026-08-24
			-- (verified in crates/rust-analyzer/src/config.rs). Old names like
			-- `cargo.allFeatures`, `inlayHints.autoParameterHints`, etc. are no
			-- longer recognized and would be silently ignored.
			cargo = {
				features = "all",
			},
			check = {
				command = "clippy",
				features = "all",
			},
			inlayHints = {
				discriminantHints = { enable = "always" },
				lifetimeElisionHints = { enable = "skip_trivial" },
			},
		},
	},
}
