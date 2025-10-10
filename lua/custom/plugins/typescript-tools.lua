-- Drop in, pure lua replacement for `typescript-language-server`
-- https://github.com/pmizio/typescript-tools.nvim

return {
  'pmizio/typescript-tools.nvim',
  ft = { 'typescript', 'javascript', 'typescriptreact', 'javascriptreact', 'tsx', 'jsx' },
  dependencies = { 'nvim-lua/plenary.nvim', 'neovim/nvim-lspconfig' },
  opts = {
    on_attach = function(client, bufnr)
      -- Disable formatting (let conform.nvim handle it via prettier/eslint)
      client.server_capabilities.documentFormattingProvider = false
      client.server_capabilities.documentRangeFormattingProvider = false
      -- Auto-organize imports on save
      vim.api.nvim_create_autocmd('BufWritePre', {
        buffer = bufnr,
        callback = function()
          vim.cmd 'TSToolsOrganizeImports'
        end,
      })
    end,
    settings = {
      -- Inlay hints - shows inferred types inline
      tsserver_file_preferences = {
        includeInlayParameterNameHints = 'all',
        includeInlayParameterNameHintsWhenArgumentMatchesName = false,
        includeInlayFunctionParameterTypeHints = true,
        includeInlayVariableTypeHints = true,
        includeInlayVariableTypeHintsWhenTypeMatchesName = false,
        includeInlayPropertyDeclarationTypeHints = true,
        includeInlayFunctionLikeReturnTypeHints = true,
        includeInlayEnumMemberValueHints = true,
      },
    },
  },
  keys = {
    -- Organize imports
    {
      '<leader>co',
      '<cmd>TSToolsOrganizeImports<CR>',
      desc = '[C]ode [O]rganize Imports',
    },
    -- Add missing imports
    {
      '<leader>ci',
      '<cmd>TSToolsAddMissingImports<CR>',
      desc = '[C]ode Add Missing [I]mports',
    },
    -- Remove unused imports
    {
      '<leader>cu',
      '<cmd>TSToolsRemoveUnusedImports<CR>',
      desc = '[C]ode Remove [U]nused Imports',
    },
    -- Fix all fixable errors
    {
      '<leader>cf',
      '<cmd>TSToolsFixAll<CR>',
      desc = '[C]ode [F]ix All',
    },
  },
}
