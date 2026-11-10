vim.api.nvim_create_autocmd('LspAttach', {
  group = vim.api.nvim_create_augroup('UserLspAttach', { clear = true }),
  callback = function(event)
    local map = function(keys, func, desc)
      vim.keymap.set('n', keys, func, { buffer = event.buf, desc = 'LSP: ' .. desc })
    end

    -- Navigation
    map('gd', vim.lsp.buf.definition,     'Go to definition')
    map('gD', vim.lsp.buf.declaration,    'Go to declaration')
    map('gi', vim.lsp.buf.implementation, 'Go to implementation')
    map('gr', vim.lsp.buf.references,     'Find references')
    map('K',  vim.lsp.buf.hover,          'Hover docs')

    -- Actions
    map('grn', vim.lsp.buf.rename,      'Rename symbol')
    map('gca', vim.lsp.buf.code_action, 'Code action')

    -- Diagnostics
    map('gl', vim.diagnostic.open_float, 'Show line diagnostic')
    map('[d', function() vim.diagnostic.jump({ count = -1 }) end, 'Previous diagnostic')
    map(']d', function() vim.diagnostic.jump({ count =  1 }) end, 'Next diagnostic')
    map('<leader>dl', vim.diagnostic.setloclist, 'Diagnostics into loclist')

    -- Highlight references on cursor hold
    if vim.lsp.buf.document_highlight then
      vim.api.nvim_create_autocmd({ 'CursorHold', 'CursorHoldI' }, {
        buffer   = event.buf,
        callback = vim.lsp.buf.document_highlight,
      })
      vim.api.nvim_create_autocmd('CursorMoved', {
        buffer   = event.buf,
        callback = vim.lsp.buf.clear_references,
      })
    end

    -- Biome: auto-fix on save (buffer-local so each buffer gets its own)
    local client = vim.lsp.get_client_by_id(event.data.client_id)
    if client and client.name == 'biome' then
      vim.api.nvim_create_autocmd('BufWritePre', {
        buffer = event.buf,   -- <-- the critical fix
        callback = function()
          vim.lsp.buf.code_action({
            context = {
              only = { 'source.fixAll.biome' },
              diagnostics = {},
            },
            apply = true,
          })
        end,
        desc = 'Biome: apply source.fixAll.biome on save',
      })
    end
  end,
})
