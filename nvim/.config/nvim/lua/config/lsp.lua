-- https://neovim.io/doc/user/lsp.html#LSP
-- https://vonheikemen.github.io/learn-nvim/feature/lsp-setup.html

vim.keymap.set("n", "<leader>k", function() vim.lsp.buf.hover() end, opts)
vim.keymap.set("n", "<leader>a", function() vim.lsp.buf.code_action() end, opts)
vim.keymap.set("n", "<leader>r", function() vim.lsp.buf.rename() end, opts)
vim.keymap.set("n", "<leader>d", function() vim.diagnostic.open_float() end, opts)

vim.lsp.config['luals'] = {
  cmd = {'lua-language-server'},
  filetypes = {'lua'},
  root_markers = {'.luarc.json', '.luarc.jsonc'},
}
vim.lsp.enable('luals')
