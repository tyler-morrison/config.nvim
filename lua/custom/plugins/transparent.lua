return {
  {
    'xiyaowong/transparent.nvim',
    priority = 1000,
    config = function()
      require('transparent').setup {
        -- Be more selective about which groups to make transparent
        groups = {
          'Normal',
          'NormalNC',
          -- Comment out some of these to keep certain UI elements with background
          -- 'Comment',
          -- 'Constant',
          -- 'Special',
          -- 'Identifier',
          -- 'Statement',
          -- 'PreProc',
          -- 'Type',
          -- 'Underlined',
          -- 'Todo',
          -- 'String',
          -- 'Function',
          -- 'Conditional',
          -- 'Repeat',
          -- 'Operator',
          -- 'Structure',
          'LineNr',
          'NonText',
          'SignColumn',
          -- 'CursorLine',
          -- 'CursorLineNr',
          -- 'StatusLine',
          -- 'StatusLineNC',
          'EndOfBuffer',
        },
        -- Add any groups that should explicitly be transparent
        extra_groups = {
          'NormalFloat', -- Make floating windows transparent
          'NvimTreeNormal', -- For NvimTree (if you use it)
          'TroubleNormal', -- For Trouble (if you use it)
        },
        -- Groups to never make transparent
        exclude_groups = {
          'CursorLine',
          'CursorLineNr',
          'StatusLine',
          'StatusLineNC',
          'TabLineFill',
          'Pmenu',
        },
      }

      -- Create a command to toggle transparency on/off
      vim.api.nvim_create_user_command('TransparencyToggle', function()
        require('transparent').toggle()
      end, {})

      -- Map a key to toggle transparency
      vim.keymap.set('n', '<leader>tt', require('transparent').toggle, { desc = '[T]oggle [T]ransparency' })
    end,
  },
}
