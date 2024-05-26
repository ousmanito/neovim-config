local M = {
  'nvimtools/none-ls.nvim',
  commit = '18910d0',
  event = { 'BufReadPre', 'BufNewFile' },
  dependencies = { 'mason.nvim' },
  opts = function()
    local null_ls = require 'null-ls'
    local formatting = null_ls.builtins.formatting
    local diagnostics = null_ls.builtins.diagnostics
    local code_actions = null_ls.builtins.code_actions
    return {
      sources = {
        formatting.stylua,
        -- diagnostics.pylint,
        -- formatting.black,
        -- formatting.rustfmt,
        -- diagnostics.flake8,
        -- diagnostics.pylint,
        code_actions.gitsigns,
      },
    }
  end,
}

return M
