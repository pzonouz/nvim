local o = vim.opt
o.cursorline=true
o.mouse="a"
o.clipboard="unnamedplus"
o.termguicolors=true
o.number=true

-- Colorscheme
vim.cmd [[colorscheme gruvbox-material]]


-- LSP
require("mason").setup({
    ui = {
        icons = {
            package_installed = "✓",
            package_pending = "➜",
            package_uninstalled = "✗"
        }
    }
})
require("mason-lspconfig").setup({
    ensure_installed = { "sumneko_lua", "rust_analyzer" }
})
