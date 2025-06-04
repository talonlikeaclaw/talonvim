return {
  'dgox16/oldworld.nvim',
  lazy = false,
  priority = 1000,
  opts = {
    variant = 'oled',
    integrations = {
      cmp = true,
      flash = true,
      gitsigns = true,
      indent_blankline = true,
      lazy = true,
      lsp = true,
      mason = true,
      markdown = true,
      neo_tree = true,
      noice = false,
      notify = true,
      telescope = true,
      treesitter = true,
    },
    highlight_overrides = {
      Normal = { bg = 'none' },
      NormalNC = { bg = 'none' },
      NormalFloat = { bg = 'none' },
      NonText = { bg = 'none' },
      EndOfBuffer = { bg = 'none' },
      FloatBorder = { bg = 'none' },
      Pmenu = { bg = 'none' },
    },
  },
}

-- vim: ts=2 sts=2 sw=2 et
