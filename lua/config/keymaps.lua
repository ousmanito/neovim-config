-- Keymaps for better default experience
-- See `:help vim.keymap.set()`
vim.keymap.set({ 'n', 'v' }, '<Space>', '<Nop>', { silent = true })
vim.keymap.set('i', 'jk', '<Esc>', { noremap = true })

-- Remap for dealing with word wrap
vim.keymap.set('n', 'k', "v:count == 0 ? 'gk' : 'k'", { expr = true, silent = true })
vim.keymap.set('n', 'j', "v:count == 0 ? 'gj' : 'j'", { expr = true, silent = true })

-- Cycle through quickfix list items
vim.keymap.set('n', ']e', '<Cmd>try | cnext | catch | cfirst | catch | endtry<CR>')
vim.keymap.set('n', '[e', '<Cmd>try | cprevious | catch | clast | catch | endtry<CR>')

-- Simple keymaps
vim.keymap.set('n', '<leader>t', ':tabnew<CR>')
vim.keymap.set('n', '<M-[>', ':tabprev<CR>')
vim.keymap.set('n', '<M-]>', ':tabnext<CR>')
vim.keymap.set('n', '<leader><down>', ':sp<CR>')
vim.keymap.set('n', '<leader><right>', ':vsp<CR>')
vim.keymap.set('n', '<M-t>', ':term<CR>')
vim.keymap.set('t', '<esc>', '<C-\\><C-N>')
vim.keymap.set('n', '<leader>4', ':bufdo bd<CR>')
vim.keymap.set('n', '<leader>3', ':bd<CR>')
vim.keymap.set('n', ']p', ':bnext<CR>')
vim.keymap.set('n', '[p', ':bprev<CR>')

vim.keymap.set('n', ']w', ':vertical resize +3<CR>')
vim.keymap.set('n', '[w', ':vertical resize -3<CR>')

vim.keymap.set('n', ']W', ':vertical resize +7<CR>')
vim.keymap.set('n', '[W', ':vertical resize -7<CR>')

vim.keymap.set('n', ']h', ':resize +3<CR>')
vim.keymap.set('n', '[h', ':resize -3<CR>')

vim.keymap.set('n', ']H', ':resize +7<CR>')
vim.keymap.set('n', '[H', ':resize -7<CR>')

-- telescope.nvim
vim.keymap.set('n', '<leader>sb', require('telescope.builtin').buffers, { desc = '[S]earch [B]uffers' })
vim.keymap.set('n', '<leader>sm', require('telescope.builtin').marks, { desc = '[S]earch [M]arks' })
vim.keymap.set('n', '<leader>sr', require('telescope.builtin').registers, { desc = '[S]earch [R]egisters' })

vim.keymap.set('n', '<leader>sk', require('telescope.builtin').keymaps, { desc = '[S]earch [K]eymaps' })

vim.keymap.set('n', '<leader>sd', require('telescope.builtin').help_tags, { desc = '[S]earch [D]ocs' })
vim.keymap.set('n', '<leader>sM', require('telescope.builtin').man_pages, { desc = '[M]an [P]ages' })

vim.keymap.set('n', '<leader>qf', require('telescope.builtin').quickfix, { desc = '[Q]uick [F]ix List' })
vim.keymap.set('n', '<leader>se', require('telescope.builtin').diagnostics, { desc = '[S]earch [E]rrors' })

vim.keymap.set('n', '<leader>of', require('telescope.builtin').oldfiles, { desc = '[?] Find recently opened files' })
vim.keymap.set('n', '<leader>.', function()
  require('telescope.builtin').find_files { cwd = require('telescope.utils').buffer_dir() }
end, { desc = 'Find Files (buffer dir)' })
vim.keymap.set('n', '<leader>>', require('telescope.builtin').find_files, { desc = 'Search Files (cwd)' })
vim.keymap.set('n', '<leader>/', require('telescope.builtin').live_grep, { desc = 'Fuzzy Search' })

vim.keymap.set('n', '<leader>gs', require('telescope.builtin').git_status, { desc = '[G]it [S]tatus' })

vim.keymap.set('n', '<leader>cs', require('telescope.builtin').colorscheme, { desc = '[C]olor [S]cheme' })

-- luasnip

local ls = require 'luasnip'

vim.keymap.set({ 'i', 's' }, '<C-L>', function()
  ls.jump(1)
end, { silent = true })
vim.keymap.set({ 'i', 's' }, '<C-J>', function()
  ls.jump(-1)
end, { silent = true })

vim.keymap.set({ 'i', 's' }, '<C-E>', function()
  if ls.choice_active() then
    ls.change_choice(1)
  end
end, { silent = true })

-- codecompanion
vim.keymap.set('n', '<leader>ca', '<cmd>CodeCompanionActions<cr>')
vim.keymap.set('n', '<LocalLeader>ct', '<cmd>CodeCompanionChat Toggle<cr>')
vim.keymap.set('v', 'ga', '<cmd>CodeCompanionChat Add<cr>')
vim.cmd [[cab cc CodeCompanion]]

-- nvim-surround
vim.keymap.set('v', 'S', '<Plug>(nvim-surround-visual)')

-- ts-tools
vim.keymap.set('n', '<leader>mi', '<cmd>TSToolsAddMissingImports<cr>', { desc = 'Add Missing Imports' })
vim.keymap.set('n', '<leader>oi', ':TSToolsOrganizeImports<cr>', { desc = 'Organize Imports' })
vim.keymap.set('n', '<leader>si', ':TSToolsSortImports<cr>', { desc = 'Sort Imports' })
