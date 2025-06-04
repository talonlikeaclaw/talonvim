return {
  'ptdewey/yankbank-nvim',
  dependencies = 'kkharji/sqlite.lua',
  config = function()
    require('yankbank').setup {
      persist_type = 'sqlite',
    }
  end,
  vim.api.nvim_set_keymap('n', '<Leader>sy', '<cmd>YankBank<CR>', { desc = 'Search Yank Bank', noremap = true, silent = true }),
}

-- vim: ts=2 sts=2 sw=2 et
