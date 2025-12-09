-- [[ Custom Keymaps ]]
-- See `:help vim.keymap.set()`

-- Clear highlights on search when pressing <Esc> in normal mode
--  See `:help hlsearch`
vim.keymap.set('n', '<Esc>', '<cmd>nohlsearch<CR>')

-- Diagnostic keymaps
vim.keymap.set('n', '<leader>q', vim.diagnostic.setloclist, { desc = 'Open diagnostic [Q]uickfix list' })

-- Exit terminal mode in the builtin terminal with a shortcut that is a bit easier
-- for people to discover. Otherwise, you normally need to press <C-\><C-n>, which
-- is not what someone will guess without a bit more experience.
--
-- NOTE: This won't work in all terminal emulators/tmux/etc. Try your own mapping
-- or just use <C-\><C-n> to exit terminal mode
vim.keymap.set('t', '<Esc><Esc>', '<C-\\><C-n>', { desc = 'Exit terminal mode' })

-- TIP: Disable arrow keys in normal mode
-- vim.keymap.set('n', '<left>', '<cmd>echo "Use h to move!!"<CR>')
-- vim.keymap.set('n', '<right>', '<cmd>echo "Use l to move!!"<CR>')
-- vim.keymap.set('n', '<up>', '<cmd>echo "Use k to move!!"<CR>')
-- vim.keymap.set('n', '<down>', '<cmd>echo "Use j to move!!"<CR>')

-- Keybinds to make split navigation easier.
--  Use CTRL+<hjkl> to switch between windows
--
--  See `:help wincmd` for a list of all window commands
vim.keymap.set('n', '<C-h>', '<C-w><C-h>', { desc = 'Move focus to the left window' })
vim.keymap.set('n', '<C-l>', '<C-w><C-l>', { desc = 'Move focus to the right window' })
vim.keymap.set('n', '<C-j>', '<C-w><C-j>', { desc = 'Move focus to the lower window' })
vim.keymap.set('n', '<C-k>', '<C-w><C-k>', { desc = 'Move focus to the upper window' })

-- NOTE: Some terminals have colliding keymaps or are not able to send distinct keycodes
-- vim.keymap.set("n", "<C-S-h>", "<C-w>H", { desc = "Move window to the left" })
-- vim.keymap.set("n", "<C-S-l>", "<C-w>L", { desc = "Move window to the right" })
-- vim.keymap.set("n", "<C-S-j>", "<C-w>J", { desc = "Move window to the lower" })
-- vim.keymap.set("n", "<C-S-k>", "<C-w>K", { desc = "Move window to the upper" })

-- Window split keymaps
vim.keymap.set('n', '<leader>bsv', ':vsplit<CR>', { desc = '[B]uffer [S]plit [V]ertical' })
vim.keymap.set('n', '<leader>bsh', ':split<CR>', { desc = '[B]uffer [S]plit [H]orizontal' })

-- Half-page scrolling with Option+Up/Down
vim.keymap.set('n', '<M-Up>', '<C-u>', { desc = 'Scroll half-page up' })
vim.keymap.set('n', '<M-Down>', '<C-d>', { desc = 'Scroll half-page down' })

-- Persistence.nvim keymaps
-- load the session for the current directory
vim.keymap.set("n", "<leader>qs", function() require("persistence").load() end, { desc = 'Load session for cwd' })
-- select a session to load
vim.keymap.set("n", "<leader>qS", function() require("persistence").select() end, { desc = 'Select session to load' })
-- load the last session
vim.keymap.set("n", "<leader>ql", function() require("persistence").load({ last = true }) end,
    { desc = 'Load last session' })
-- stop Persistence => session won't be saved on exit
vim.keymap.set("n", "<leader>qd", function() require("persistence").stop() end, { desc = 'Stop Persistence' })
