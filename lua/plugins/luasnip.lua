return {
  'L3MON4D3/LuaSnip',
  config = function()
    require('luasnip.loaders.from_vscode').lazy_load()
    local luasnip = require 'luasnip'
    luasnip.filetype_extend('javascriptreact', { 'html' })
    luasnip.filetype_extend('typescriptreact', { 'html' })
  end,
}
