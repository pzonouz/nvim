return require('packer').startup(function(use)
	use 'wbthomason/packer.nvim'
	use 'sainnhe/gruvbox-material'
	use 'williamboman/mason.nvim'
        use 'williamboman/mason-lspconfig.nvim'
        use 'neovim/nvim-lspconfig'
	end)
