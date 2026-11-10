return {
	"saghen/blink.cmp",
	dependencies = { "rafamadriz/friendly-snippets" },
	version = "1.*",
	opts = {
		keymap = {
			preset = "enter", -- <CR> accepts
			["<Tab>"] = { "select_next", "fallback" }, -- Tab → next item
			["<S-Tab>"] = { "select_prev", "fallback" },
		},
		appearance = { nerd_font_variant = "mono" },
		sources = {
			default = { "lsp", "path", "snippets", "buffer" },
			providers = {
				lsp = {
					min_keyword_length = 0, -- Query LSP immediately, even on trigger chars
				},
			},
		},
	},
	completion = {
		trigger = {
			show_in_snippet = false, -- This MUST be inside completion.trigger
		},
	},
	opts_extend = { "sources.default" },
	config = function(_, opts)
		require("blink.cmp").setup(opts)

		-- Broadcast blink's capabilities to every LSP server.
		-- Runs only after blink.cmp has been installed and loaded.
		vim.lsp.config("*", {
			capabilities = require("blink.cmp").get_lsp_capabilities(),
		})
	end,
}
