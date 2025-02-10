return {
  'olimorris/codecompanion.nvim',
  dependencies = {
    'nvim-lua/plenary.nvim',
    'nvim-treesitter/nvim-treesitter',
  },
  opts = {
    adapters = {
      openai = function()
        return require('codecompanion.adapters').extend('openai', {
          schema = {
            model = {
              default = 'o3-mini-2025-01-31',
            },
          },
        })
      end,
    },
    strategies = {
      chat = {
        adapter = 'openai',
        slash_commands = {
          buffer = {
            opts = {
              provider = 'telescope', -- default|telescope|mini_pick|fzf_lua
            },
          },
        },
      },
    },
    display = {
      action_palette = {
        provider = 'telescope', -- default|telescope|mini_pick
      },
    },
    opts = {
      log_level = 'DEBUG',
    },
  },
}
