return {
    'johnseth97/gh-dash.nvim',
    lazy = true,
    keys = {
        {
            '<leader>ghd',
            function() require('gh_dash').toggle() end,
            desc = 'Toggle [G][H]-[D]ash popup',
        },
    },
    opts = {
        border = 'rounded',
        width = 0.8,
        height = 0.8,
        autoinstall = true,
    },
}
