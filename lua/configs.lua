local o = vim.opt
o.cursorline=true
o.mouse="a"
o.clipboard="unnamedplus"
o.termguicolors=true
o.number=true

-- Colorscheme
vim.cmd [[colorscheme gruvbox-material]]


-- LSP
require'lspconfig'.pyright.setup{}
