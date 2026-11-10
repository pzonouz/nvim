-- ~/.config/nvim/lua/plugins/conform.lua
return {
	"stevearc/conform.nvim",
	event = { "BufWritePre" },
	cmd = { "ConformInfo" },
	keys = {
		{
			"<leader>fm",
			function()
				require("conform").format({ async = true, lsp_format = "fallback" })
			end,
			mode = "",
			desc = "Format buffer",
		},
	},
	opts = {
		formatters_by_ft = {
			-- Use biome for formatting and then organize imports
			typescript = { "biome", "biome-organize-imports", stop_after_first = true },
			typescriptreact = { "biome", "biome-organize-imports", stop_after_first = true },
			javascript = { "biome", "biome-organize-imports", stop_after_first = true },
			javascriptreact = { "biome", "biome-organize-imports", stop_after_first = true },
			json = { "biome", "biome-organize-imports", stop_after_first = true },
			jsonc = { "biome", "biome-organize-imports", stop_after_first = true },
			css = { "biome", "biome-organize-imports", stop_after_first = true },
			go = { "goimports", "golines", "gofumpt", "gofmt", stop_after_first = false },
			gomod = { "goimports" },
			golines = {
				prepend_args = { "--max-len=100", "--tab-len=1" },
			},

			lua = { "stylua" },
		},
		format_on_save = {
			timeout_ms = 500,
			lsp_format = "fallback",
		},
	},
}
