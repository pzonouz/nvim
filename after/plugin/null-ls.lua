local null_ls = require("null-ls")

null_ls.setup({
    sources = {
        null_ls.builtins.formatting.stylua, --Lua
        null_ls.builtins.diagnostics.selene,
        null_ls.builtins.formatting.prettier, --JS
        null_ls.builtins.diagnostics.eslint,
        null_ls.builtins.diagnostics.tidy, --HTML
        -- null_ls.builtins.diagnostics.stylelint, --CSS
        -- null_ls.builtins.completion.spell,
    },
})

