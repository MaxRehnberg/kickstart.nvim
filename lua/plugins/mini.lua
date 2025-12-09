-- mini.nvim modules
-- https://github.com/echasnovski/mini.nvim
-- https://nvim-mini.org/mini.nvim/

return {
  'echasnovski/mini.nvim',
  version = '*',
  config = function()
    -- Activate mini.files and mini.pairs
    require('mini.files').setup {
      mappings = {
        go_in_plus = '<Right>',
        go_out_plus = '<Left>',
      },
    }
    require('mini.pairs').setup()
  end,
  keys = {
    {
      '<leader><Tab>',
      function()
        local MiniFiles = require('mini.files')
        if not MiniFiles.close() then
          local buf_name = vim.api.nvim_buf_get_name(0)
          local path = vim.fn.filereadable(buf_name) == 1 and buf_name or vim.fn.getcwd()
          MiniFiles.open(path, false)
        end
      end,
      desc = 'Toggle mini.files',
    },
  },
}
