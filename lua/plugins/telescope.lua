-- Fuzzy Finder (files, lsp, etc)
return {
  { 'nvim-telescope/telescope.nvim', branch = '0.1.x', dependencies = { 'nvim-lua/plenary.nvim' } },

  -- Fuzzy Finder Algorithm which requires local dependencies to be built.
  -- Only load if `make` is available. Make sure you have the system
  -- requirements installed.
  {
    'nvim-telescope/telescope-fzf-native.nvim',
    -- NOTE: If you are having trouble with this installation,
    --       refer to the README for telescope-fzf-native for more instructions.
    build = 'make',
    cond = function()
      return vim.fn.executable 'make' == 1
    end,
  },
  config = function()
    -- Enable telescope fzf native, if installed
    pcall(require('telescope').load_extension, 'fzf')

    -- See `:help telescope.builtin`
    require('telescope').setup {
      defaults = {
        mappings = {
          i = {
            ['<C-u>'] = false,
            ['<C-d>'] = false,
            ['<C-Down>'] = require('telescope.actions').cycle_history_next,
            ['<C-Up>'] = require('telescope.actions').cycle_history_prev,
          },
        },
      },
    }
  end,
}
