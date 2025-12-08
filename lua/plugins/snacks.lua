return {
    {
        'folke/snacks.nvim',
        priority = 1000,
        lazy = false,
        ---@type snacks.Config
        opts = {
            -- Enable the features you want
            bigfile = { enabled = true },
            input = { enabled = true },
            notifier = { enabled = true },
            picker = { enabled = true },
            quickfile = { enabled = true },
            statuscolumn = { enabled = false }, -- Disable to preserve your own number settings
            words = { enabled = true },
        },
        keys = {
            -- Top Pickers
            { '<leader><leader>', function() Snacks.picker.buffers() end,                                 desc = '[ ] Find existing buffers' },
            { '<leader>/',        function() Snacks.picker.lines() end,                                   desc = '[/] Fuzzily search in current buffer' },
            { '<leader>:',        function() Snacks.picker.command_history() end,                         desc = 'Command History' },

            -- Find
            { '<leader>sf',       function() Snacks.picker.files() end,                                   desc = '[S]earch [F]iles' },
            { '<leader>sg',       function() Snacks.picker.grep() end,                                    desc = '[S]earch by [G]rep' },
            { '<leader>sw',       function() Snacks.picker.grep_word() end,                               desc = '[S]earch current [W]ord',               mode = { 'n', 'x' } },
            { '<leader>sh',       function() Snacks.picker.help() end,                                    desc = '[S]earch [H]elp' },
            { '<leader>sk',       function() Snacks.picker.keymaps() end,                                 desc = '[S]earch [K]eymaps' },
            { '<leader>ss',       function() Snacks.picker.pickers() end,                                 desc = '[S]earch [S]elect Snacks Picker' },
            { '<leader>sd',       function() Snacks.picker.diagnostics() end,                             desc = '[S]earch [D]iagnostics' },
            { '<leader>sr',       function() Snacks.picker.resume() end,                                  desc = '[S]earch [R]esume' },
            { '<leader>s.',       function() Snacks.picker.recent() end,                                  desc = '[S]earch Recent Files ("." for repeat)' },
            { '<leader>sn',       function() Snacks.picker.files({ cwd = vim.fn.stdpath('config') }) end, desc = '[S]earch [N]eovim files' },
            { '<leader>s/',       function() Snacks.picker.grep_buffers() end,                            desc = '[S]earch [/] in Open Files' },

            -- Git
            { '<leader>gb',       function() Snacks.picker.git_branches() end,                            desc = 'Git Branches' },
            { '<leader>gl',       function() Snacks.picker.git_log() end,                                 desc = 'Git Log' },
            { '<leader>gs',       function() Snacks.picker.git_status() end,                              desc = 'Git Status' },

            -- Other useful pickers
            { '<leader>sc',       function() Snacks.picker.commands() end,                                desc = '[S]earch [C]ommands' },
            { '<leader>sm',       function() Snacks.picker.marks() end,                                   desc = '[S]earch [M]arks' },
            { '<leader>sq',       function() Snacks.picker.qflist() end,                                  desc = '[S]earch [Q]uickfix List' },

            -- LSP (also mapped in lsp.lua for when LSP attaches)
            { 'gd',               function() Snacks.picker.lsp_definitions() end,                         desc = 'Goto Definition' },
            { 'gr',               function() Snacks.picker.lsp_references() end,                          nowait = true,                                  desc = 'References' },
            { 'gI',               function() Snacks.picker.lsp_implementations() end,                     desc = 'Goto Implementation' },
            { 'gy',               function() Snacks.picker.lsp_type_definitions() end,                    desc = 'Goto T[y]pe Definition' },

            -- Notifications
            { '<leader>un',       function() Snacks.notifier.hide() end,                                  desc = 'Dismiss All Notifications' },
            { '<leader>sN',       function() Snacks.picker.notifications() end,                           desc = '[S]earch [N]otifications' },

            -- Words navigation
            { ']]',               function() Snacks.words.jump(vim.v.count1) end,                         desc = 'Next Reference',                        mode = { 'n', 't' } },
            { '[[',               function() Snacks.words.jump(-vim.v.count1) end,                        desc = 'Prev Reference',                        mode = { 'n', 't' } },
        },
        init = function()
            vim.api.nvim_create_autocmd('User', {
                pattern = 'VeryLazy',
                callback = function()
                    -- Setup some globals for debugging (lazy-loaded)
                    _G.dd = function(...)
                        Snacks.debug.inspect(...)
                    end
                    _G.bt = function()
                        Snacks.debug.backtrace()
                    end
                    vim.print = _G.dd -- Override print to use snacks for `:=` command
                end,
            })
        end,
    },
}
