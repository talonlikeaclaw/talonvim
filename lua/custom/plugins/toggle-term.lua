return {
  {
    'akinsho/toggleterm.nvim',
    version = '*',
    opts = {
      size = 20,
      open_mapping = [[<leader>tt]],
      shade_terminals = true,
      shading_factor = 2,
      start_in_insert = true,
      persist_size = true,
      direction = 'horizontal',
      close_on_exit = true,
      shell = vim.o.shell,
    },
    config = function(_, opts)
      require('toggleterm').setup(opts)
    end,
  },
}

-- vim: ts=2 sts=2 sw=2 et
