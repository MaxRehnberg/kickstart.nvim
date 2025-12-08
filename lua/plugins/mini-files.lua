-- mini.files is a file explorer plugin
-- https://github.com/nvim-mini/mini.files
-- https://nvim-mini.org/mini.nvim/

return {
  'echasnovski/mini.nvim',
  version = '*',
  config = function()
    -- Only activate mini.files
    require('mini.files').setup {
      mappings = {
        go_in_plus = '<Right>',
        go_out_plus = '<Left>',
      },
    }
  end,
  keys = {
    {
      '<leader><Tab>',
      function()
        require('mini.files').open()
      end,
      desc = 'Open mini.files',
    },
  },
}
