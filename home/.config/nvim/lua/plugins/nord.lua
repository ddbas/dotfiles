return {
  "shaunsingh/nord.nvim",
  name = "nord",
  lazy = true,
  config = function()
    -- https://github.com/shaunsingh/nord.nvim/issues/143
    vim.api.nvim_create_autocmd('LspAttach', {
      callback = function(args)
        local client = vim.lsp.get_client_by_id(args.data.client_id)
        client.server_capabilities.semanticTokensProvider = nil
      end,
    })
    vim.g.nord_disable_background = true

    require('nord').set()
  end
}
