----- [[ Basic Keymaps ]] -----
--  See `:help vim.keymap.set()`

-- Clear highlights on search when pressing <Esc> in normal mode
--  See `:help hlsearch`
vim.keymap.set('n', '<Esc>', '<cmd>nohlsearch<CR>')

-- Diagnostic keymaps
vim.keymap.set('n', '<leader>q', vim.diagnostic.setloclist, { desc = 'Open Fiagnostic Quickfix list' })

-- Exit terminal mode in the builtin terminal with a shortcut that is a bit easier
vim.keymap.set('t', '<Esc><Esc>', '<C-\\><C-n>', { desc = 'Exit Terminal Mode' })

-- Enable Oil file view functionality
vim.keymap.set('n', '-', '<cmd>Oil<CR>', { desc = 'Open Parent Directory' })

-- Save buffer
vim.keymap.set({ 'i', 'x', 'n', 's' }, '<leader>cs', '<cmd>w<cr><esc>', { desc = 'Save File' })

-- Quit buffer
vim.keymap.set('n', '<leader>q', '<cmd>q<cr>', { desc = 'Quit Buffer', noremap = true, silent = true })

-- Quit Talonvim
vim.keymap.set('n', '<leader>Q', '<cmd>qa!<cr>', { desc = 'Quit Talonvim', noremap = true, silent = true })

-- Keybinds to make split navigation easier.
--  Use CTRL+<hjkl> to switch between windows
--  See `:help wincmd` for a list of all window commands
vim.keymap.set('n', '<C-h>', '<C-w><C-h>', { desc = 'Move focus to the left window' })
vim.keymap.set('n', '<C-l>', '<C-w><C-l>', { desc = 'Move focus to the right window' })
vim.keymap.set('n', '<C-j>', '<C-w><C-j>', { desc = 'Move focus to the lower window' })
vim.keymap.set('n', '<C-k>', '<C-w><C-k>', { desc = 'Move focus to the upper window' })

vim.keymap.set('n', '<leader>w-', '<cmd>sp<CR>', { desc = 'Split Across', remap = true })
vim.keymap.set('n', '<leader>w|', '<cmd>vs<CR>', { desc = 'Split Down', remap = true })

-- Highlight when yanking (copying) text
--  See `:help vim.hl.on_yank()`
vim.api.nvim_create_autocmd('TextYankPost', {
  desc = 'Highlight when yanking (copying) text',
  group = vim.api.nvim_create_augroup('kickstart-highlight-yank', { clear = true }),
  callback = function()
    vim.hl.on_yank()
  end,
})

-- vim: ts=2 sts=2 sw=2 et
