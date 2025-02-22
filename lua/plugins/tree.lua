return {
  {
    'nvim-neo-tree/neo-tree.nvim',
    enabled = false,
  },
  {
    'nvim-tree/nvim-tree.lua',
    version = '*',
    lazy = false,
    dependencies = {
      'nvim-tree/nvim-web-devicons',
    },

    keys = {
      { '<leader>1', ':NvimTreeToggle<CR>', desc = 'See [F]iles' },
      { '<leader>2', ':NvimTreeFocus<CR>', desc = '[T]oggle [F]ile Explorer ' },
    },

    config = function()
      require('nvim-tree').setup {}
    end,
  },
}
