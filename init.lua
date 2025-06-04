----- Talonvim Initialization -----
-- Set <space> as the leader key
-- See `:help mapleader`
vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

-- Enable nerd font
vim.g.have_nerd_font = true

require 'options'
require 'keymaps'
require 'lazy-bootstrap'
require 'lazy-plugins'

vim.cmd.colorscheme 'oldworld'

-- vim: ts=2 sts=2 sw=2 et
