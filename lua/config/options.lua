local opt = vim.opt

-- UI
opt.number         = true
opt.relativenumber = true
opt.signcolumn     = 'yes'
opt.termguicolors  = true
opt.wrap           = false
opt.updatetime     = 250

-- Indentation (TypeScript / JS friendly)
opt.tabstop     = 2
opt.shiftwidth  = 2
opt.expandtab   = true
opt.smartindent = true
opt.swapfile = false
opt.clipboard = "unnamedplus"


-- Completion behaviour
opt.completeopt = { 'menu', 'menuone', 'noselect' }
