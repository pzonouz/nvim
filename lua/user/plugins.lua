--# selene: allow(undefined_variable)
--# selene: allow(unscoped_variables)
-- This file can be loaded by calling `lua require('plugins')` from your init.vim

-- Auotnatically install packeges when packer saved:
vim.cmd([[
augroup packer_user_config
autocmd!
autocmd BufWritePost plugins.lua source <afile> | PackerSync
augroup end
]])

-- Only required if you have packer configured as `opt`
vim.cmd([[packadd packer.nvim]])

return require("packer").startup(function(use)
	-- Packer can manage itself
	use("wbthomason/packer.nvim")

	use({
		"VonHeikemen/lsp-zero.nvim",
		branch = "v1.x",
		requires = {
			-- LSP Support
			{ "neovim/nvim-lspconfig" }, -- Required
			{ "williamboman/mason.nvim" }, -- Optional

			{ "williamboman/mason-lspconfig.nvim" }, -- Optional

			-- Autocompletion
			{ "hrsh7th/nvim-cmp" }, -- Required
			{ "hrsh7th/cmp-nvim-lsp" }, -- Required
			{ "hrsh7th/cmp-buffer" }, -- Optional
			{ "hrsh7th/cmp-path" }, -- Optional
			{ "saadparwaiz1/cmp_luasnip" }, -- Optional
			{ "hrsh7th/cmp-nvim-lua" }, -- Optional

			-- Snippets
			{ "L3MON4D3/LuaSnip" }, -- Required
			{ "rafamadriz/friendly-snippets" }, -- Optional
		},
	})
	-- My pluggins
	use({
		"nvim-telescope/telescope.nvim",
		tag = "0.1.1", --fuzzy finder
		-- or                            , branch = '0.1.x',
		requires = { { "nvim-lua/plenary.nvim" } },
	})
	use({
		"numToStr/Comment.nvim", --Commenting
		config = function()
			require("Comment").setup()
		end,
	})
	use({ "jose-elias-alvarez/null-ls.nvim" })
	use("JoosepAlviste/nvim-ts-context-commentstring") --Provide language base comment method
	use({
		"nvim-treesitter/nvim-treesitter", --Highlight and indent
		run = ":TSUpdate",
	})
	use("nvim-treesitter/nvim-treesitter-textobjects")
	use({
		"lewis6991/gitsigns.nvim", --Git plugin
		config = function()
			require("gitsigns").setup()
		end,
	})
	use({
		"nvim-tree/nvim-tree.lua", --File Manager
		requires = {
			"nvim-tree/nvim-web-devicons", -- optional, for file icons
		},
		tag = "nightly", -- optional, updated every week. (see issue #1193)
	})
	use({ "akinsho/bufferline.nvim", tag = "v3.*", requires = "nvim-tree/nvim-web-devicons" }) --Buffer Managment
	use({ -- Terminal
		"akinsho/toggleterm.nvim",
		-- tag = "*",
		-- config = function()
		-- require("toggleterm").setup()
		-- end,
	})
	use({ --nvim-surrond
		"kylechui/nvim-surround",
		tag = "*", -- Use for stability; omit to use `main` branch for the latest features
		config = function()
			require("nvim-surround").setup({
				-- Configuration here, or leave empty to use defaults
			})
		end,
	})
	use({ --nvim-autopairs
		"windwp/nvim-autopairs",
		config = function()
			require("nvim-autopairs").setup({})
		end,
	})
	use("mattn/emmet-vim")
	use("p00f/nvim-ts-rainbow")
	-- use({ --Lualine
	-- 	"nvim-lualine/lualine.nvim",
	-- 	requires = { "kyazdani42/nvim-web-devicons", opt = true },
	-- 	config = function()
	-- 		require("lualine").setup()
	-- 	end,
	-- })
	use("preservim/tagbar")
	use("farmergreg/vim-lastplace")
	use("vimwiki/vimwiki")
	use({ --Zen-mode
		"folke/zen-mode.nvim",
		config = function()
			require("zen-mode").setup({
				-- your configuration comes here
				-- or leave it empty to use the default settings
				-- refer to the configuration section below
			})
		end,
	})
	use("lukas-reineke/indent-blankline.nvim")
	-- Lua
	use({ --Trouble
		"folke/trouble.nvim",
		requires = "nvim-tree/nvim-web-devicons",
		config = function()
			require("trouble").setup({
				-- your configuration comes here
				-- or leave it empty to use the default settings
				-- refer to the configuration section below
			})
		end,
	})
	use({ --TODO-Comments
		"folke/todo-comments.nvim",
		requires = "nvim-lua/plenary.nvim",
		config = function()
			require("todo-comments").setup({})
		end,
	})
	use({
		"NvChad/nvim-colorizer.lua",
		config = function()
			require("colorizer").setup()
		end,
	})
	use({
		"sudormrfbin/cheatsheet.nvim",

		requires = {
			{ "nvim-telescope/telescope.nvim" },
			{ "nvim-lua/popup.nvim" },
			{ "nvim-lua/plenary.nvim" },
		},
	})
	use({
		"feline-nvim/feline.nvim",
		config = {
			function()
				require("feline").setup()
			end,
		},
	})
	use({ "CRAG666/code_runner.nvim", requires = "nvim-lua/plenary.nvim" })
	--OrgMode
	use({
		"nvim-orgmode/orgmode",
		config = function()
			require("orgmode").setup({})
		end,
	})
	use({
		"akinsho/org-bullets.nvim",
		config = function()
			require("org-bullets").setup()
		end,
	})
	use({
		"lukas-reineke/headlines.nvim",
		config = function()
			require("headlines").setup()
		end,
	})
	use({ "michaelb/sniprun", run = "bash install.sh" })
	use("dhruvasagar/vim-table-mode")
	-- Colorschemes
	use({ "luisiacc/gruvbox-baby", branch = "main" })
	use("marko-cerovac/material.nvim")
	use("folke/tokyonight.nvim") --Best one and using
	use({
		"glepnir/zephyr-nvim",
		requires = { "nvim-treesitter/nvim-treesitter", opt = true },
	})
	use("Shatur/neovim-ayu")
end)
