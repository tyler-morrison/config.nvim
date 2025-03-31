-- Drop in, pure lua replacement for `typescript-language-server`
-- https://github.com/pmizio/typescript-tools.nvim

return {
  'pmizio/typescript-tools.nvim',
  ft = { 'typescript', 'javascript', 'typescriptreact', 'javascriptreact', 'tsx', 'jsx' },
  dependencies = { 'nvim-lua/plenary.nvim', 'neovim/nvim-lspconfig' },
  opts = {},
}
