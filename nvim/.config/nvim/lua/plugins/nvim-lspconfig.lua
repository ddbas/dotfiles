return {
  "neovim/nvim-lspconfig",
  config = function()
    -- https://github.com/neovim/nvim-lspconfig/blob/master/doc/configs.md
    vim.lsp.enable('bashls')
    vim.lsp.enable("biome")
    vim.lsp.enable("cssls")
    vim.lsp.enable("eslint")
    vim.lsp.enable("html")
    vim.lsp.enable("jsonls")
    vim.lsp.enable('lua_ls')
    vim.lsp.enable('marksman')
    vim.lsp.enable('rust_analyzer')
    vim.lsp.enable("ts_ls")
  end,
}
