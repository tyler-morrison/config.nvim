return {
  'preservim/vim-pencil',
  ft = { 'markdown', 'text', 'txt' },
  config = function()
    -- Auto-enable for markdown and text files
    vim.api.nvim_create_autocmd('FileType', {
      pattern = { 'markdown', 'text', 'txt' },
      callback = function()
        vim.cmd 'PencilSoft'
      end,
    })

    -- Also trigger when entering a buffer (catches zen-mode case)
    vim.api.nvim_create_autocmd('BufEnter', {
      pattern = { '*.md', '*.markdown', '*.txt' },
      callback = function()
        -- Only activate if not already active
        if vim.fn.exists '#pencil' == 0 then
          vim.cmd 'PencilSoft'
        end
      end,
    })

    -- Keybindings
    vim.keymap.set('n', '<leader>wp', ':PencilToggle<CR>', { desc = '[W]riting [P]encil toggle' })
    vim.keymap.set('n', '<leader>ws', ':PencilSoft<CR>', { desc = '[W]riting [S]oft wrap' })
    vim.keymap.set('n', '<leader>wh', ':PencilHard<CR>', { desc = '[W]riting [H]ard wrap' })
  end,
}
