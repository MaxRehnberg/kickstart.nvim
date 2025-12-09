return {
    -- Primary colorscheme: miasma.nvim
    {
        'xero/miasma.nvim',
        lazy = false,
        priority = 1000, -- Make sure to load this before all the other start plugins.
        config = function()
            vim.cmd.colorscheme 'miasma'

            -- Enable transparency (only clear backgrounds, preserve foreground colors)
            local transparent_groups = {
                'Normal',
                'NormalFloat',
                'NormalNC',
                'SignColumn',
                'EndOfBuffer',
                'Folded',
                'StatusLine',
                'StatusLineNC',
                'CursorLine',
                'CursorColumn',
                'Pmenu',
                'TabLine',
                'TabLineFill',
            }

            for _, group in ipairs(transparent_groups) do
                local hl = vim.api.nvim_get_hl(0, { name = group })
                hl.bg = nil
                hl.ctermbg = nil
                vim.api.nvim_set_hl(0, group, hl)
            end

            -- Line numbers with transparency
            vim.api.nvim_set_hl(0, 'LineNr', { fg = '#666666', bg = 'NONE' })
            vim.api.nvim_set_hl(0, 'CursorLineNr', { fg = '#78824b', bg = 'NONE', bold = true })

            -- Swap colors: strings get green, functions get orange
            vim.api.nvim_set_hl(0, 'String', { fg = '#78834b' })
            vim.api.nvim_set_hl(0, '@string', { fg = '#78834b' })
            vim.api.nvim_set_hl(0, 'Function', { fg = '#b2643a' })
            vim.api.nvim_set_hl(0, '@function', { fg = '#b2643a' })
            vim.api.nvim_set_hl(0, '@function.call', { fg = '#b2643a' })
            vim.api.nvim_set_hl(0, '@function.method', { fg = '#b2643a' })
            vim.api.nvim_set_hl(0, '@function.method.call', { fg = '#b2643a' })

            -- Rainbow delimiters colors (autumn theme)
            vim.api.nvim_set_hl(0, 'RainbowDelimiterRed', { fg = '#b36d43' })
            vim.api.nvim_set_hl(0, 'RainbowDelimiterYellow', { fg = '#c9a554' })
            vim.api.nvim_set_hl(0, 'RainbowDelimiterBlue', { fg = '#78824b' })
            vim.api.nvim_set_hl(0, 'RainbowDelimiterOrange', { fg = '#bb7744' })
            vim.api.nvim_set_hl(0, 'RainbowDelimiterGreen', { fg = '#5f875f' })
            vim.api.nvim_set_hl(0, 'RainbowDelimiterViolet', { fg = '#685742' })
            vim.api.nvim_set_hl(0, 'RainbowDelimiterCyan', { fg = '#d7c483' })

            -- Diagnostic colors (autumn teal for errors)
            vim.api.nvim_set_hl(0, 'DiagnosticError', { fg = '#5f9ea0' }) -- autumn teal
            vim.api.nvim_set_hl(0, 'DiagnosticVirtualTextError', { fg = '#5f9ea0' })
            vim.api.nvim_set_hl(0, 'DiagnosticUnderlineError', { undercurl = true, sp = '#5f9ea0' })
            vim.api.nvim_set_hl(0, 'DiagnosticFloatingError', { fg = '#5f9ea0' })
            vim.api.nvim_set_hl(0, 'DiagnosticSignError', { fg = '#5f9ea0' })

            -- Numbers (int, float) in deep purple
            vim.api.nvim_set_hl(0, 'Number', { fg = '#7C7387' })
            vim.api.nvim_set_hl(0, '@number', { fg = '#7C7387' })
            vim.api.nvim_set_hl(0, '@number.float', { fg = '#7C7387' })
            vim.api.nvim_set_hl(0, 'Float', { fg = '#7C7387' })

            -- Boolean and None (same as numbers)
            vim.api.nvim_set_hl(0, 'Boolean', { fg = '#7C7387' })
            vim.api.nvim_set_hl(0, '@boolean', { fg = '#7C7387' })
            vim.api.nvim_set_hl(0, 'Constant', { fg = '#7C7387' })
            vim.api.nvim_set_hl(0, '@constant.builtin', { fg = '#7C7387' }) -- None, True, False

            -- Search highlights
            vim.api.nvim_set_hl(0, 'Search', { fg = '#222222', bg = '#5f9ea0' })    -- all matches (teal)
            vim.api.nvim_set_hl(0, 'IncSearch', { fg = '#222222', bg = '#b36d43' }) -- current/focused match (orange)
            vim.api.nvim_set_hl(0, 'CurSearch', { fg = '#222222', bg = '#b36d43' }) -- current match (orange)
        end,
    },

    -- Rainbow delimiters for matching brackets
    {
        'HiPhish/rainbow-delimiters.nvim',
        dependencies = { 'nvim-treesitter/nvim-treesitter' },
        config = function()
            require('rainbow-delimiters.setup').setup {
                strategy = {
                    [''] = 'rainbow-delimiters.strategy.global',
                    vim = 'rainbow-delimiters.strategy.local',
                },
                query = {
                    [''] = 'rainbow-delimiters',
                    lua = 'rainbow-blocks',
                },
                highlight = {
                    'RainbowDelimiterRed',
                    'RainbowDelimiterYellow',
                    'RainbowDelimiterBlue',
                    'RainbowDelimiterOrange',
                    'RainbowDelimiterGreen',
                    'RainbowDelimiterViolet',
                    'RainbowDelimiterCyan',
                },
            }
        end,
    },

    -- Keep tokyonight as an alternative (lazy loaded)
    {
        'folke/tokyonight.nvim',
        lazy = true,
        opts = {
            styles = {
                comments = { italic = false }, -- Disable italics in comments
            },
        },
    },
}
