return {
  -- Autocompletion
  'hrsh7th/nvim-cmp',
  config = function()
    local cmp = require 'cmp'
    cmp.setup { autocomplete = false }
  end,
}
