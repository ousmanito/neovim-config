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
      inline = {
        adapter = 'openai',
      },
    },
    display = {
      action_palette = {
        provider = 'telescope', -- default|telescope|mini_pick
      },
      chat = {
        intro_message = '✨',
        show_header_separator = false, -- Show header separators in the chat buffer? Set this to false if you're using an external markdown formatting plugin
        separator = '─', -- The separator between the different messages in the chat buffer
        show_references = true, -- Show references (from slash commands and variables) in the chat buffer?
        show_settings = true, -- Show LLM settings at the top of the chat buffer?
        show_token_count = true, -- Show the token count for each response?
        start_in_insert_mode = false, -- Open the chat buffer in insert mode?
      },
    },
    opts = {
      log_level = 'DEBUG',
    },
  },
}
