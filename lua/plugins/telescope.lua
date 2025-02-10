return {
  'nvim-telescope/telescope.nvim',
  branch = '0.1.x',
  dependencies = { 'nvim-lua/plenary.nvim' },

  config = function()
    pcall(require('telescope').load_extension, 'fzf')
    require('telescope').setup {
      defaults = {
        mappings = {
          i = {
            ['<C-Down>'] = require('telescope.actions').cycle_history_next,
            ['<C-Up>'] = require('telescope.actions').cycle_history_prev,
          },
        },
        path_display = { 'truncate' },
      },
    }
  end,
}
