-- ~/.config/nvim/lua/plugins/toggleterm.lua
return {
  'akinsho/toggleterm.nvim',
  version = '*',
  opts = {
    open_mapping = [[<C-\>]], -- Key to toggle the terminal
    direction = 'float',      -- Default to a floating window
    float_opts = {
      border = 'curved',      -- Style of the border
      width = 100,            -- Width of the float
      height = 30,            -- Height of the float
    },
  },
}
