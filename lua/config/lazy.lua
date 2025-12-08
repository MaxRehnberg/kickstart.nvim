-- Bootstrap lazy.nvim
local lazypath = vim.fn.stdpath 'data' .. '/lazy/lazy.nvim'
if not (vim.uv or vim.loop).fs_stat(lazypath) then
  local lazyrepo = 'https://github.com/folke/lazy.nvim.git'
  local out = vim.fn.system { 'git', 'clone', '--filter=blob:none', '--branch=stable', lazyrepo, lazypath }
  if vim.v.shell_error ~= 0 then
    vim.api.nvim_echo({
      { 'Failed to clone lazy.nvim:\n', 'ErrorMsg' },
      { out,                            'WarningMsg' },
      { '\nPress any key to exit...' },
    }, true, {})
    vim.fn.getchar()
    os.exit(1)
  end
end
vim.opt.rtp:prepend(lazypath)

-- Setup lazy.nvim
require('lazy').setup {
  spec = {
    -- Import all plugin files from lua/plugins/
    { import = 'plugins' },

    -- Optional kickstart plugins (uncomment to enable)
    -- { import = 'kickstart.plugins.debug' },
    -- { import = 'kickstart.plugins.indent_line' },
    -- { import = 'kickstart.plugins.lint' },
    -- { import = 'kickstart.plugins.autopairs' },
    { import = 'kickstart.plugins.neo-tree' },
    -- { import = 'kickstart.plugins.gitsigns' }, -- adds gitsigns recommend keymaps
  },

  -- Colorscheme that will be used when installing plugins.
  install = { colorscheme = { 'miasma', 'habamax' } },

  -- Automatically check for plugin updates
  checker = { enabled = true },

  -- UI configuration
  ui = {
    -- If you are using a Nerd Font: set icons to an empty table which will use the
    -- default lazy.nvim defined Nerd Font icons, otherwise define a unicode icons table
    icons = vim.g.have_nerd_font and {} or {
      cmd = '⌘',
      config = '🛠',
      event = '📅',
      ft = '📂',
      init = '⚙',
      keys = '🗝',
      plugin = '🔌',
      runtime = '💻',
      require = '🌙',
      source = '📄',
      start = '🚀',
      task = '📌',
      lazy = '💤 ',
    },
  },
}
