-- Keymaps for better default experience
-- See `:help vim.keymap.set()`
vim.keymap.set({ 'n', 'v' }, '<Space>', '<Nop>', { silent = true })

-- Remap for dealing with word wrap
vim.keymap.set('n', 'k', "v:count == 0 ? 'gk' : 'k'", { expr = true, silent = true })
vim.keymap.set('n', 'j', "v:count == 0 ? 'gj' : 'j'", { expr = true, silent = true })

-- Diagnostic keymaps
vim.keymap.set('n', '[d', vim.diagnostic.goto_prev, { desc = 'Go to previous diagnostic message' })
vim.keymap.set('n', ']d', vim.diagnostic.goto_next, { desc = 'Go to next diagnostic message' })
vim.keymap.set('n', '<leader>e', vim.diagnostic.open_float, { desc = 'Open floating diagnostic message' })
vim.keymap.set('n', '<leader>q', vim.diagnostic.setloclist, { desc = 'Open diagnostics list' })

--Create keymap for format
vim.cmd 'map <Leader>1 :lua vim.lsp.buf.format({timeout_ms = 9000})<CR>'

vim.keymap.set('n', '<leader>of', require('telescope.builtin').oldfiles, { desc = '[?] Find recently opened files' })
vim.keymap.set('n', '<leader>ff', require('telescope.builtin').find_files, { desc = '[S]earch [F]iles' })
vim.keymap.set('n', '<leader>ht', require('telescope.builtin').help_tags, { desc = '[S]earch [H]elp' })
vim.keymap.set('n', '<leader>lg', require('telescope.builtin').live_grep, { desc = '[S]earch by [G]rep' })
vim.keymap.set('n', '<leader>dq', require('telescope.builtin').diagnostics, { desc = '[S]earch [D]iagnostics' })
vim.keymap.set('n', '<leader>cs', require('telescope.builtin').colorscheme, { desc = '[C]hange [T]heme' })
vim.keymap.set('n', '<leader>sb', require('telescope.builtin').buffers, { desc = '[S]earch [B]uffers' })

-- Luasnip
local luasnip = require 'luasnip'
vim.keymap.set({ 'i' }, '<C-K>', function()
  luasnip.expand()
end, { silent = true })
vim.keymap.set({ 'i', 's' }, '<C-L>', function()
  luasnip.jump(1)
end, { silent = true })
vim.keymap.set({ 'i', 's' }, '<C-J>', function()
  luasnip.jump(-1)
end, { silent = true })

vim.keymap.set({ 'i', 's' }, '<C-E>', function()
  if luasnip.choice_active() then
    luasnip.change_choice(1)
  end
end, { silent = true })
vim.keymap.set('n', '<leader><leader>s', '<cmd>source ~/.config/nvim/snippets/all.lua<CR>')

-- Simple keymaps
vim.keymap.set('n', '<leader>t', ':tabnew<CR>')
vim.keymap.set('n', '<M-left>', ':tabprev<CR>')
vim.keymap.set('n', '<M-right>', ':tabnext<CR>')
vim.keymap.set('n', '<leader><down>', ':sp<CR>')
vim.keymap.set('n', '<leader><right>', ':vsp<CR>')
vim.keymap.set('n', '<M-t>', ':term<CR>')
