return {
  {
    'EdenEast/nightfox.nvim',
    priority = 1000,
    config = function()
      require('nightfox').setup {
        options = {
          transparent = true, -- Enable transparent background
          styles = {
            comments = 'italic', -- Style for comments
            keywords = 'bold', -- Style for keywords
          },
        },
      }
      vim.cmd.colorscheme 'duskfox' -- Try nordfox or duskfox for warm tones
    end,
  },
}
