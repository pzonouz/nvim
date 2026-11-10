-- ~/.config/nvim/lua/plugins/oil.lua
return {
  'stevearc/oil.nvim',
  opts = {},
  -- Optional: Show icons if you have a devicons plugin
  dependencies = { "nvim-tree/nvim-web-devicons" },
  config = function(_, opts)
    require("oil").setup(opts)
    -- Keymap to open the parent directory, mimicking vim-vinegar
    vim.keymap.set("n", "-", "<CMD>Oil<CR>", { desc = "Open parent directory" })
  end,
}
