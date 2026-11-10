require('lsp.keymaps')

-- Reads lsp/tsc.lua from runtimepath and attaches the client.
vim.lsp.enable('tsc')
vim.lsp.enable('biome')
vim.lsp.enable('gopls')          -- <-- add this



-- Step 1: Biome fix-all FIRST (registered first → runs first)
vim.api.nvim_create_autocmd('BufWritePre', {
  group = vim.api.nvim_create_augroup('BiomeFixAll', { clear = true }),
  pattern = { '*.ts', '*.tsx', '*.js', '*.jsx', '*.json', '*.jsonc', '*.css' },
  callback = function(args)
    local clients = vim.lsp.get_clients({ bufnr = args.buf, name = 'biome' })
    if #clients == 0 then return end
    vim.lsp.buf.code_action({
      context = { only = { 'source.fixAll.biome' }, diagnostics = {} },
      apply = true,
    })
  end,
})

-- Step 2: Format AFTER fixes (registered second → runs second)
vim.api.nvim_create_autocmd('BufWritePre', {
  group = vim.api.nvim_create_augroup('LspFormatOnSave', { clear = true }),
  pattern = { '*.ts', '*.tsx', '*.js', '*.jsx' },
  callback = function(args)
    local clients = vim.lsp.get_clients({ bufnr = args.buf })
    for _, c in ipairs(clients) do
      if c:supports_method('textDocument/formatting') then
        vim.lsp.buf.format({ bufnr = args.buf, async = false })
        break
      end
    end
  end,
})
