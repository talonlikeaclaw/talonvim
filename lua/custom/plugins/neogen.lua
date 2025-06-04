return {
  'danymat/neogen',
  config = true,
  -- Uncomment next line if you want to follow only stable versions
  -- version = "*"
  vim.api.nvim_set_keymap('n', '<Leader>cd', ":lua require('neogen').generate()<CR>", { desc = 'Generate Method Annotations', noremap = true, silent = true }),
}

-- vim: ts=2 sts=2 sw=2 et
