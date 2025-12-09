return {
  'MeanderingProgrammer/render-markdown.nvim',
  dependencies = { 'nvim-treesitter/nvim-treesitter', 'echasnovski/mini.nvim' },
  ft = { 'markdown' },
  opts = {},
  keys = {
    {
      '<leader>mrp',
      '<cmd>RenderMarkdown preview<CR>',
      desc = '[M]arkdown [R]ender [P]review',
    },
    {
      '<leader>mrt',
      '<cmd>RenderMarkdown toggle<CR>',
      desc = '[M]arkdown [R]ender [T]oggle',
    },
    {
      '<leader>mre',
      '<cmd>RenderMarkdown enable<CR>',
      desc = '[M]arkdown [R]ender [E]nable',
    },
    {
      '<leader>mrd',
      '<cmd>RenderMarkdown disable<CR>',
      desc = '[M]arkdown [R]ender [D]isable',
    },
  },
}
