return {
  'catppuccin/nvim',
  name = 'catppuccin',
  priority = 1000,
  config = function()
    require('catppuccin').setup({
      flavour = 'mocha', -- Choose your favorite
    })
    vim.cmd.colorscheme 'catppuccin'
  end,
}
