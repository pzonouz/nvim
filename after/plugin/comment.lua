require 'nvim-treesitter.configs'.setup {
    context_commentstring = {
        enable = true,
        config = {
            javascript = {
                __default = '// %s',
                jsx_element = '{/* %s */}',
                jsx_fragment = '{/* %s */}',
                jsx_attribute = '// %s',
                comment = '// %s'
            },
            c = { __default = '// %s', __multiline = '{/* %s */}' },
            cpp = { __default = '// %s', __multiline = '{/* %s */}' },
            css = { __default = '// %s', __multiline = '{/* %s */}' },
        }
    }
}
require 'nvim-treesitter.configs'.setup {
    context_commentstring = {
        enable = true,
        enable_autocmd = false,
    }
}
require 'nvim-treesitter.configs'.setup {
    context_commentstring = {
        enable = true,
        enable_autocmd = false,
    }
}