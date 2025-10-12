return {
  'tpope/vim-fugitive',
  cmd = { 'Git', 'G' },
  keys = {
    { '<leader>gb', '<cmd>Git blame<CR>', desc = '[G]it [B]lame' },
    { '<leader>gc', '<cmd>Git commit<CR>', desc = '[G]it [C]ommit' },
    { '<leader>gp', '<cmd>Git push<CR>', desc = '[G]it [P]ush' },
  },
}
