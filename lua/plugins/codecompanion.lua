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

    prompt_library = {
      ['Recettes'] = {
        strategy = 'chat',
        description = 'Documente les tests unitaires afin de compléter le cahier de recettes.',
        opts = {
          is_default = true,
          is_slash_cmd = false,
          modes = { 'v' },
          user_prompt = false,
          short_name = 'doctest',
          auto_submit = true,
          stop_context_insertion = true,
        },
        prompts = {
          {
            role = 'system',
            content = function(context)
              return 'I want you to act as a senior '
                .. context.filetype
                .. ' developer. Generate a structured test case document (Markdown format) for software application testing (if the file contains any). The result text should include the following sections:\n\n'
                .. '1. Test Case: The high-level category or context of the test (e.g. "User Authentication", "API Configuration").\n'
                .. '2. Test Name: A descriptive and unique name for the individual test (e.g. `test_user_login_success`).\n'
                .. '3. Scenario Description: A brief explanation of what is being tested and why.\n'
                .. '4. Prerequisites: The conditions or setup required before executing the test (e.g. installed dependencies, running services).\n'
                .. '5. Expected Result: The expected outcome that would confirm the test has passed.\n'
                .. '6. Comment: Optional additional notes, such as links to documentation or tips for debugging.\n\n'
            end,
            opts = {
              visible = true,
            },
          },
          {
            role = 'user',
            content = function(context)
              local text = require('codecompanion.helpers.actions').get_code(context.start_line, context.end_line)
              return 'Here is the file with my unit tests that I would like to document according to the system prompt :\n\n```'
                .. context.filetype
                .. '\n'
                .. text
                .. '\n```\n\n'
            end,
            opts = {
              contains_code = true,
            },
          },
        },
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
