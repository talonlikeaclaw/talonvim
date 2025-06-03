return {
  'folke/snacks.nvim',
  priority = 1000,
  lazy = false,
  ---@type snacks.Config
  opts = {
    animate = {
      duration = 20,
      easing = 'linear',
      fps = 120,
    },
    bigfile = { enabled = true },
    dashboard = {
      enabled = true,
      preset = {
        header = [[
████████╗ █████╗ ██╗      ██████╗ ███╗   ██╗██╗   ██╗██╗███╗   ███╗
╚══██╔══╝██╔══██╗██║     ██╔═══██╗████╗  ██║██║   ██║██║████╗ ████║
   ██║   ███████║██║     ██║   ██║██╔██╗ ██║██║   ██║██║██╔████╔██║
   ██║   ██╔══██║██║     ██║   ██║██║╚██╗██║╚██╗ ██╔╝██║██║╚██╔╝██║
   ██║   ██║  ██║███████╗╚██████╔╝██║ ╚████║ ╚████╔╝ ██║██║ ╚═╝ ██║
   ╚═╝   ╚═╝  ╚═╝╚══════╝ ╚═════╝ ╚═╝  ╚═══╝  ╚═══╝  ╚═╝╚═╝     ╚═╝]],
      },
      sections = {
        { section = 'header' },
        {
          pane = 2,
          section = 'terminal',
          cmd = 'cmatrix -b -r -u 8',
          height = 5,
          padding = 2,
        },
        { section = 'keys', gap = 1, padding = 2 },
        { pane = 2, icon = ' ', title = 'Recent Files', section = 'recent_files', indent = 2, padding = 3 },
        { pane = 2, icon = ' ', title = 'Projects', section = 'projects', indent = 2, padding = 3 },
        {
          pane = 2,
          icon = ' ',
          title = 'Git Status',
          section = 'terminal',
          enabled = function()
            return Snacks.git.get_root() ~= nil
          end,
          cmd = 'hub status --short --branch --renames',
          height = 5,
          padding = 2,
          ttl = 5 * 60,
          indent = 3,
        },
        { section = 'startup' },
      },
    },
    notifier = {
      enabled = true,
      timeout = 1000,
    },
    quickfile = { enabled = true },
    scroll = {
      animate = {
        duration = { step = 15, total = 250 },
        easing = 'linear',
      },
      spamming = 10, -- threshold for spamming detection
      -- what buffers to animate
      filter = function(buf)
        return vim.g.snacks_scroll ~= false and vim.b[buf].snacks_scroll ~= false and vim.bo[buf].buftype ~= 'terminal'
      end,
    },
    scope = { enabled = true },
    statuscolumn = { enabled = true },
    styles = {
      notification = {
        wo = { wrap = true }, -- Wrap notifications
      },
    },
  },
  keys = {
    {
      '<leader>z',
      function()
        Snacks.zen()
      end,
      desc = 'Zen mode',
    },
    {
      '<leader>gg',
      function()
        Snacks.lazygit()
      end,
      desc = 'Lazygit',
    },
    {
      '<c-/>',
      function()
        Snacks.terminal()
      end,
      desc = 'Terminal',
    },
  },
  init = function()
    vim.api.nvim_create_autocmd('User', {
      pattern = 'VeryLazy',
      callback = function()
        -- Setup some globals for debugging (lazy-loaded)
        _G.dd = function(...)
          Snacks.debug.inspect(...)
        end
        _G.bt = function()
          Snacks.debug.backtrace()
        end
        vim.print = _G.dd -- Override print to use snacks for `:=` command

        -- Create some toggle mappings
        Snacks.toggle.option('spell', { name = 'spelling' }):map '<leader>us'
        Snacks.toggle.option('wrap', { name = 'wrap' }):map '<leader>uw'
        Snacks.toggle.option('relativenumber', { name = 'relative number' }):map '<leader>uL'
        Snacks.toggle.diagnostics():map '<leader>ud'
        Snacks.toggle.line_number():map '<leader>ul'
        Snacks.toggle.option('conceallevel', { off = 0, on = vim.o.conceallevel > 0 and vim.o.conceallevel or 2 }):map '<leader>uc'
        Snacks.toggle.treesitter():map '<leader>uT'
        Snacks.toggle.inlay_hints():map '<leader>uh'
      end,
    })
  end,
}
