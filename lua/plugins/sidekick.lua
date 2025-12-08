return {
    -- AI Sidekick - NES (Next Edit Suggestions) + CLI integration
    -- Using fork with WezTerm mux support (PR #197)
    'onelesd/sidekick.nvim',
    branch = 'dseleno/feat/mux-wezterm-support',
    event = 'VeryLazy', -- Load on VeryLazy so healthcheck works
    dependencies = {
        'folke/snacks.nvim',
    },
    opts = {
        cli = {
            mux = {
                enabled = true,
                backend = 'wezterm',
                create = 'split',
            },
            -- Only show tools you have installed
            tools = {
                -- Keep these (you have them)
                claude = { cmd = { 'claude' } },
                codex = { cmd = { 'codex', '--enable', 'web_search_request' } },
                copilot = { cmd = { 'copilot', '--banner' } },
                -- Disable the rest
                aider = false,
                amazon_q = false,
                crush = false,
                cursor = false,
                gemini = false,
                grok = false,
                opencode = false,
                qwen = false,
            },
        },
    },
    keys = {
        -- NES (Next Edit Suggestions)
        {
            '<C-Tab>',
            function()
                if not require('sidekick').nes_jump_or_apply() then
                    return '<C-Tab>' -- fallback
                end
            end,
            expr = true,
            desc = 'Goto/Apply Next Edit Suggestion',
        },
        -- CLI toggles
        {
            '<leader>aa',
            function() require('sidekick.cli').toggle() end,
            desc = '[A]I Toggle CLI',
        },
        {
            '<leader>as',
            function() require('sidekick.cli').select { filter = { installed = true } } end,
            desc = '[A]I [S]elect CLI',
        },
        {
            '<leader>ad',
            function() require('sidekick.cli').close() end,
            desc = '[A]I [D]etach CLI Session',
        },
        {
            '<leader>at',
            function() require('sidekick.cli').send { msg = '{this}' } end,
            mode = { 'x', 'n' },
            desc = '[A]I Send [T]his',
        },
        {
            '<leader>af',
            function() require('sidekick.cli').send { msg = '{file}' } end,
            desc = '[A]I Send [F]ile',
        },
        {
            '<leader>av',
            function() require('sidekick.cli').send { msg = '{selection}' } end,
            mode = { 'x' },
            desc = '[A]I Send [V]isual Selection',
        },
        {
            '<leader>ap',
            function() require('sidekick.cli').prompt() end,
            mode = { 'n', 'x' },
            desc = '[A]I Select [P]rompt',
        },
        -- Tool-specific toggles
        {
            '<leader>ac',
            function() require('sidekick.cli').toggle { name = 'claude', focus = true } end,
            desc = '[A]I Toggle [C]laude',
        },
        {
            '<leader>ax',
            function() require('sidekick.cli').toggle { name = 'codex', focus = true } end,
            desc = '[A]I Toggle Code[x]',
        },
    },
}
