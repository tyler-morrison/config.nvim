return {
  'folke/zen-mode.nvim',
  cmd = 'ZenMode',
  keys = {
    { '<leader>z', '<cmd>ZenMode<CR>', desc = '[Z]en mode toggle' },
  },
  opts = {
    window = {
      width = 120, -- Your preferred max width
      options = {
        number = false, -- Hide line numbers in zen mode
        relativenumber = false,
        signcolumn = 'no', -- Hide git signs, etc.
        cursorline = false,
      },
    },
    plugins = {
      options = {
        enabled = true,
        ruler = false,
        showcmd = false,
      },
      twilight = { enabled = false }, -- Dims inactive paragraphs (optional)
      gitsigns = { enabled = false }, -- Disable git signs in zen mode
      tmux = { enabled = false }, -- Disable tmux statusline
    },
  },
}
