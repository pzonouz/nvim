-- ~/.config/nvim/lsp/gopls.lua
---@type vim.lsp.Config
return {
  cmd = { 'gopls' },
  filetypes = { 'go', 'gomod', 'gowork', 'gotmpl' },
  root_markers = { 'go.work', 'go.mod', '.git' },
  settings = {
    gopls = {
      -- Diagnostics: staticcheck catches real bugs beyond `go vet`
      staticcheck = true,
      analyses = {
        unusedparams = true,
        shadow = true,
        nilness = true,
        unusedwrite = true,
      },

      -- Formatting: gofumpt is stricter than gofmt (industry standard)
      gofumpt = true,

      -- Completion quality
      usePlaceholders = true,        -- fill function args with tab stops
      completeUnimported = true,     -- complete symbols from un-imported pkgs

      -- Inline hints (the gray type hints inside functions)
      hints = {
        assignVariableTypes     = true,
        compositeLiteralFields  = true,
        compositeLiteralTypes   = true,
        constantValues          = true,
        functionTypeParameters  = true,
        parameterNames          = true,
        rangeVariableTypes      = true,
      },
    },
  },
}
