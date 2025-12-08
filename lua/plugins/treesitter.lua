return {
    -- Highlight, edit, and navigate code
    {
        'nvim-treesitter/nvim-treesitter',
        branch = 'main',
        lazy = false,
        build = ':TSUpdate',
        config = function()
            -- Register mdx as markdown
            vim.treesitter.language.register('markdown', 'mdx')

            -- Setup nvim-treesitter (optional, uses defaults if not called)
            require('nvim-treesitter').setup({
                install_dir = vim.fn.stdpath('data') .. '/site',
            })

            -- Install parsers (async, runs in background)
            require('nvim-treesitter').install({
                'bash',
                'c',
                'diff',
                'html',
                'lua',
                'luadoc',
                'markdown',
                'markdown_inline',
                'python',
                'query',
                'vim',
                'vimdoc',
            })

            -- Enable treesitter highlighting for all filetypes
            vim.api.nvim_create_autocmd('FileType', {
                callback = function()
                    pcall(vim.treesitter.start)
                end,
            })

            -- Enable treesitter-based indentation (experimental)
            vim.api.nvim_create_autocmd('FileType', {
                callback = function()
                    vim.bo.indentexpr = "v:lua.require'nvim-treesitter'.indentexpr()"
                end,
            })
        end,
    },
}
