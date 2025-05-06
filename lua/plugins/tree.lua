return {
  'nvim-neo-tree/neo-tree.nvim',
  branch = 'v3.x',
  dependencies = {
    'nvim-lua/plenary.nvim',
    'nvim-tree/nvim-web-devicons',
    'MunifTanjim/nui.nvim',
  },
  lazy = false,
  ---@module "neo-tree"
  ---@type neotree.Config?
  opts = {},
  keys = {
    { '<leader>1', ':Neotree show<CR>', desc = 'See [F]iles' },
    { '<leader>2', ':Neotree toggle<CR>', desc = '[T]oggle [F]ile Explorer ' },
  },
}
