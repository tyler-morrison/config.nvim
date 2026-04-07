return {
  'nvim-neotest/neotest',
  dependencies = {
    'nvim-neotest/nvim-nio',
    'nvim-lua/plenary.nvim',
    'antoinemadec/FixCursorHold.nvim',
    'nvim-treesitter/nvim-treesitter',
    'olimorris/neotest-rspec',
  },
  keys = {
    {
      '<leader>tr',
      function() require('neotest').run.run() end,
      desc = '[T]est [R]un nearest',
    },
    {
      '<leader>tf',
      function() require('neotest').run.run(vim.fn.expand '%') end,
      desc = '[T]est run [F]ile',
    },
    {
      '<leader>ts',
      function() require('neotest').summary.toggle() end,
      desc = '[T]est [S]ummary',
    },
    {
      '<leader>to',
      function() require('neotest').output_panel.toggle() end,
      desc = '[T]est [O]utput',
    },
  },
  config = function()
    require('neotest').setup {
      adapters = {
        require 'neotest-rspec' {
          -- Uses `bundle exec rspec` when a Gemfile is present, so specs run
          -- against the correct gem versions for each project.
          rspec_cmd = function() return vim.fn.filereadable 'Gemfile' == 1 and { 'bundle', 'exec', 'rspec' } or { 'rspec' } end,
        },
      },
    }
  end,
}
-- vim: ts=2 sts=2 sw=2 et
