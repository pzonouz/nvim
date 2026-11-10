-- ~/.config/nvim/lua/plugins/nvim-lint.lua
return {
  'mfussenegger/nvim-lint',
  event = { 'BufReadPre', 'BufNewFile' },
  config = function()
    local lint = require('lint')
    lint.linters_by_ft = {
      typescript      = { 'biomejs' },
      typescriptreact = { 'biomejs' },
      javascript      = { 'biomejs' },
      javascriptreact = { 'biomejs' },
      json            = { 'biomejs' },
      jsonc           = { 'biomejs' },
      css             = { 'biomejs' },
      go              = { 'golangcilint' }, 
    }

    -- Run linter on save
    vim.api.nvim_create_autocmd({ 'BufWritePost' }, {
      callback = function()
        require('lint').try_lint()
      end,
    })
  end,
}
