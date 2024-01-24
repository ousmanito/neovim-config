require 'setup.debug'
require 'setup.autoformat'

require 'config.lazy'

require('lazy').setup {
  spec = {

    { 'LazyVim/LazyVim', import = 'lazyvim.plugins', opts = { colorscheme = 'catppuccin' } },
    { import = 'lazyvim.plugins.extras.lsp.none-ls' },
    'tpope/vim-fugitive',
    'tpope/vim-rhubarb',
    'tpope/vim-sleuth',

    { import = 'plugins' },
  },
  defaults = {
    lazy = false,
    version = false,
  },
  checker = { enabled = true },
  install = { colorscheme = { 'tokyonight', 'catppuccin', 'solarized' } },
  performance = {
    rtp = {
      disabled_plugins = {
        -- 'gzip',
        -- 'matchit',
        -- 'matchparen',
        -- 'netrwPlugin',
        'tarPlugin',
        'tohtml',
        'tutor',
        'zipPlugin',
      },
    },
  },
}

-- The line beneath this is called `modeline`. See `:help modeline`
-- vim: ts=2 sts=2 sw=2 et
