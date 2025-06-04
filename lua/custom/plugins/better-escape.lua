return {
  'max397574/better-escape.nvim',
  config = function()
    require('better_escape').setup {
      default_mappings = false,
      mappings = {
        i = {
          h = {
            h = '<Esc>',
          },
        },
      },
    }
  end,
}

-- vim: ts=2 sts=2 sw=2 et
