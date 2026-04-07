return {
  'coder/claudecode.nvim',
  opts = {
    terminal = {
      provider = 'none', -- headless: WebSocket only, no terminal management
    },
    connection_wait_delay = 800,
    diff_opts = {
      open_in_new_tab = true, -- diff occupies entire tab instead of a vertical split
      on_new_file_reject = 'close_window',
    },
  },
}
