-- ------------------------------------------------ personal keymaps
-- Keymaps for better default experience
-- See `:help vim.keymap.set()`
vim.keymap.set({ 'n', 'v' }, '<Space>', '<Nop>', { silent = true })

-- Remap for dealing with word wrap
vim.keymap.set('n', 'k', "v:count == 0 ? 'gk' : 'k'", { expr = true, silent = true })
vim.keymap.set('n', 'j', "v:count == 0 ? 'gj' : 'j'", { expr = true, silent = true })

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

------------------------ telescope.nvim

---Telescope action helper to open single or multiple files
---@param bufnr integer Telescope prompt buffer number
local function telescope_open_single_or_multi(bufnr)
  local actions = require 'telescope.actions'
  local actions_state = require 'telescope.actions.state'
  local single_selection = actions_state.get_selected_entry()
  local multi_selection = actions_state.get_current_picker(bufnr):get_multi_selection()
  if not vim.tbl_isempty(multi_selection) then
    actions.close(bufnr)
    for _, file in pairs(multi_selection) do
      if file.path ~= nil then
        vim.cmd(string.format('edit %s', file.path))
      end
    end
    vim.cmd(string.format('edit %s', single_selection.path))
  else
    actions.select_default(bufnr)
  end
end

vim.keymap.set('i', '<CR>', telescope_open_single_or_multi)
vim.keymap.set('n', '<leader>sb', require('telescope.builtin').buffers, { desc = '[S]earch [B]uffers' })
vim.keymap.set('n', '<leader>sm', require('telescope.builtin').marks, { desc = '[S]earch [M]arks' })
vim.keymap.set('n', '<leader>sr', require('telescope.builtin').registers, { desc = '[S]earch [R]egisters' })

vim.keymap.set('n', '<leader>sk', require('telescope.builtin').keymaps, { desc = '[S]earch [K]eymaps' })

vim.keymap.set('n', '<leader>sd', require('telescope.builtin').help_tags, { desc = '[S]earch [D]ocs' })
vim.keymap.set('n', '<leader>sM', require('telescope.builtin').man_pages, { desc = '[M]an [P]ages' })

vim.keymap.set('n', '<leader>of', require('telescope.builtin').oldfiles, { desc = '[?] Find recently opened files' })
vim.keymap.set('n', '<leader>.', function()
  require('telescope.builtin').find_files { cwd = require('telescope.utils').buffer_dir() }
end, { desc = 'Find Files (buffer dir)' })
vim.keymap.set('n', '<leader>>', require('telescope.builtin').find_files, { desc = 'Search Files (cwd)' })
vim.keymap.set('n', '<leader>/', require('telescope.builtin').live_grep, { desc = 'Fuzzy Search' })

vim.keymap.set('n', '<leader>gs', require('telescope.builtin').git_status, { desc = '[G]it [S]tatus' })

vim.keymap.set('n', '<leader>cs', require('telescope.builtin').colorscheme, { desc = '[C]olor [S]cheme' })
---------------------- codecompanion

vim.keymap.set('n', '<leader>ca', '<cmd>CodeCompanionActions<cr>')
vim.keymap.set('n', '<LocalLeader>ct', '<cmd>CodeCompanionChat Toggle<cr>')
vim.keymap.set('v', 'ga', '<cmd>CodeCompanionChat Add<cr>')
vim.cmd [[cab cc CodeCompanion]]

---------------------------------------------------- coc.nvim
-- https://raw.githubusercontent.com/neoclide/coc.nvim/master/doc/coc-example-config.lua

-- Some servers have issues with backup files, see #649
vim.opt.backup = false
vim.opt.writebackup = false

-- Having longer updatetime (default is 4000 ms = 4s) leads to noticeable
-- delays and poor user experience
vim.opt.updatetime = 300

-- Always show the signcolumn, otherwise it would shift the text each time
-- diagnostics appeared/became resolved
vim.opt.signcolumn = 'yes'

local keyset = vim.keymap.set
-- Autocomplete
function _G.check_back_space()
  local col = vim.fn.col '.' - 1
  return col == 0 or vim.fn.getline('.'):sub(col, col):match '%s' ~= nil
end

-- Use Tab for trigger completion with characters ahead and navigate
-- NOTE: There's always a completion item selected by default, you may want to enable
-- no select by setting `"suggest.noselect": true` in your configuration file
-- NOTE: Use command ':verbose imap <tab>' to make sure Tab is not mapped by
-- other plugins before putting this into your config
local opts = { silent = true, noremap = true, expr = true, replace_keycodes = false }
keyset('i', '<TAB>', 'coc#pum#visible() ? coc#pum#next(1) : v:lua.check_back_space() ? "<TAB>" : coc#refresh()', opts)
keyset('i', '<S-TAB>', [[coc#pum#visible() ? coc#pum#prev(1) : "\<C-h>"]], opts)

-- Make <CR> to accept selected completion item or notify coc.nvim to format
-- <C-g>u breaks current undo, please make your own choice
keyset('i', '<cr>', [[coc#pum#visible() ? coc#pum#confirm() : "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"]], opts)

-- Use <c-j> to trigger snippets
keyset('i', '<c-j>', '<Plug>(coc-snippets-expand-jump)')
-- Use <c-space> to trigger completion
keyset('i', '<c-space>', 'coc#refresh()', { silent = true, expr = true })

-- Use `[g` and `]g` to navigate diagnostics
-- Use `:CocDiagnostics` to get all diagnostics of current buffer in location list
keyset('n', '[g', '<Plug>(coc-diagnostic-prev)', { silent = true })
keyset('n', ']g', '<Plug>(coc-diagnostic-next)', { silent = true })

-- GoTo code navigation
keyset('n', 'gd', '<Plug>(coc-definition)', { silent = true })
keyset('n', 'gy', '<Plug>(coc-type-definition)', { silent = true })
keyset('n', 'gi', '<Plug>(coc-implementation)', { silent = true })
keyset('n', 'gr', '<Plug>(coc-references)', { silent = true })

-- Use K to show documentation in preview window
function _G.show_docs()
  local cw = vim.fn.expand '<cword>'
  if vim.fn.index({ 'vim', 'help' }, vim.bo.filetype) >= 0 then
    vim.api.nvim_command('h ' .. cw)
  elseif vim.api.nvim_eval 'coc#rpc#ready()' then
    vim.fn.CocActionAsync 'doHover'
  else
    vim.api.nvim_command('!' .. vim.o.keywordprg .. ' ' .. cw)
  end
end
keyset('n', 'K', '<CMD>lua _G.show_docs()<CR>', { silent = true })

-- Highlight the symbol and its references on a CursorHold event(cursor is idle)
vim.api.nvim_create_augroup('CocGroup', {})
vim.api.nvim_create_autocmd('CursorHold', {
  group = 'CocGroup',
  command = "silent call CocActionAsync('highlight')",
  desc = 'Highlight symbol under cursor on CursorHold',
})

-- Symbol renaming
keyset('n', '<leader>rn', '<Plug>(coc-rename)', { silent = true })

-- Formatting selected code
keyset('x', '<leader>f', '<Plug>(coc-format-selected)', { silent = true })
keyset('n', '<leader>f', '<Plug>(coc-format-selected)', { silent = true })

-- Setup formatexpr specified filetype(s)
vim.api.nvim_create_autocmd('FileType', {
  group = 'CocGroup',
  pattern = 'typescript,json',
  command = "setl formatexpr=CocAction('formatSelected')",
  desc = 'Setup formatexpr specified filetype(s).',
})

-- Update signature help on jump placeholder
vim.api.nvim_create_autocmd('User', {
  group = 'CocGroup',
  pattern = 'CocJumpPlaceholder',
  command = "call CocActionAsync('showSignatureHelp')",
  desc = 'Update signature help on jump placeholder',
})

-- Apply codeAction to the selected region
-- Example: `<leader>aap` for current paragraph
local opts = { silent = true, nowait = true }
keyset('x', '<leader>a', '<Plug>(coc-codeaction-selected)', opts)
keyset('n', '<leader>a', '<Plug>(coc-codeaction-selected)', opts)

-- Remap keys for apply code actions at the cursor position.
keyset('n', '<leader>ac', '<Plug>(coc-codeaction-cursor)', opts)
-- Remap keys for apply source code actions for current file.
keyset('n', '<leader>as', '<Plug>(coc-codeaction-source)', opts)
-- Apply the most preferred quickfix action on the current line.
keyset('n', '<leader>qf', '<Plug>(coc-fix-current)', opts)

-- Remap keys for apply refactor code actions.
keyset('n', '<leader>re', '<Plug>(coc-codeaction-refactor)', { silent = true })
keyset('x', '<leader>r', '<Plug>(coc-codeaction-refactor-selected)', { silent = true })
keyset('n', '<leader>r', '<Plug>(coc-codeaction-refactor-selected)', { silent = true })

-- Run the Code Lens actions on the current line
keyset('n', '<leader>cl', '<Plug>(coc-codelens-action)', opts)

-- Map function and class text objects
-- NOTE: Requires 'textDocument.documentSymbol' support from the language server
keyset('x', 'if', '<Plug>(coc-funcobj-i)', opts)
keyset('o', 'if', '<Plug>(coc-funcobj-i)', opts)
keyset('x', 'af', '<Plug>(coc-funcobj-a)', opts)
keyset('o', 'af', '<Plug>(coc-funcobj-a)', opts)
keyset('x', 'ic', '<Plug>(coc-classobj-i)', opts)
keyset('o', 'ic', '<Plug>(coc-classobj-i)', opts)
keyset('x', 'ac', '<Plug>(coc-classobj-a)', opts)
keyset('o', 'ac', '<Plug>(coc-classobj-a)', opts)

-- Remap <C-f> and <C-b> to scroll float windows/popups
---@diagnostic disable-next-line: redefined-local
local opts = { silent = true, nowait = true, expr = true }
keyset('n', '<C-f>', 'coc#float#has_scroll() ? coc#float#scroll(1) : "<C-f>"', opts)
keyset('n', '<C-b>', 'coc#float#has_scroll() ? coc#float#scroll(0) : "<C-b>"', opts)
keyset('i', '<C-f>', 'coc#float#has_scroll() ? "<c-r>=coc#float#scroll(1)<cr>" : "<Right>"', opts)
keyset('i', '<C-b>', 'coc#float#has_scroll() ? "<c-r>=coc#float#scroll(0)<cr>" : "<Left>"', opts)
keyset('v', '<C-f>', 'coc#float#has_scroll() ? coc#float#scroll(1) : "<C-f>"', opts)
keyset('v', '<C-b>', 'coc#float#has_scroll() ? coc#float#scroll(0) : "<C-b>"', opts)

-- Use CTRL-S for selections ranges
-- Requires 'textDocument/selectionRange' support of language server
-- keyset('n', '<C-s>', '<Plug>(coc-range-select)', { silent = true })
-- keyset('x', '<C-s>', '<Plug>(coc-range-select)', { silent = true })

-- Add `:Format` command to format current buffer
vim.api.nvim_create_user_command('Format', "call CocAction('format')", {})

-- " Add `:Fold` command to fold current buffer
vim.api.nvim_create_user_command('Fold', "call CocAction('fold', <f-args>)", { nargs = '?' })

-- Add `:OR` command for organize imports of the current buffer
vim.api.nvim_create_user_command('OR', "call CocActionAsync('runCommand', 'editor.action.organizeImport')", {})

-- Add (Neo)Vim's native statusline support
-- NOTE: Please see `:h coc-status` for integrations with external plugins that
-- provide custom statusline: lightline.vim, vim-airline
vim.opt.statusline:prepend "%{coc#status()}%{get(b:,'coc_current_function','')}"

-- Mappings for CoCList
-- code actions and coc stuff
---@diagnostic disable-next-line: redefined-local
local opts = { silent = true, nowait = true }
-- Show all diagnostics
keyset('n', '<space>D', ':<C-u>CocList diagnostics<cr>', opts)
-- Manage extensions
keyset('n', '<space>e', ':<C-u>CocList extensions<cr>', opts)
-- -- Show commands
keyset('n', '<space>C', ':<C-u>CocList commands<cr>', opts)
-- Find symbol of current document
keyset('n', '<space>O', ':<C-u>CocList outline<cr>', opts)
-- Search workspace symbols
keyset('n', '<space>S', ':<C-u>CocList -I symbols<cr>', opts)
-- Do default action for next item
keyset('n', '<space>j', ':<C-u>CocNext<cr>', opts)
-- Do default action for previous item
keyset('n', '<space>k', ':<C-u>CocPrev<cr>', opts)
-- Resume latest coc list
keyset('n', '<space>p', ':<C-u>CocListResume<cr>', opts)

--------------------------------------------------------------------------------- nvim-surround
keyset('v', 'S', '<Plug>(nvim-surround-visual)')
