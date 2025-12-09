return {
    -- GitHub Copilot - inline suggestions
    'zbirenbaum/copilot.lua',
    cmd = 'Copilot',
    event = 'VeryLazy', -- Load earlier so :Copilot auth works
    opts = {
        suggestion = {
            enabled = true,
            auto_trigger = true,
            keymap = {
                accept = '<M-Tab>', -- Option+Tab to accept
                accept_word = '<M-w>',
                accept_line = '<M-j>',
                next = '<M-]>',
                prev = '<M-[>',
                dismiss = '<M-Esc>', -- Option+Escape to dismiss
            },
        },
        panel = {
            enabled = true,
            auto_refresh = false,
            keymap = {
                open = '<M-CR>',
            },
        },
        filetypes = {
            yaml = true,
            markdown = true,
            ['.'] = false, -- disable for dotfiles
        },
    },
}
