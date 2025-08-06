-- Formatter
vim.keymap.set("n", "<leader>F", ":Format<CR>")

-- LSP
vim.keymap.set("n", "gd", vim.lsp.buf.definition, {})
vim.keymap.set("n", "gi", vim.lsp.buf.implementation, {})
vim.keymap.set("n", "gr", vim.lsp.buf.references, {})
vim.keymap.set("n", "<leader>k", vim.lsp.buf.hover, {})
vim.keymap.set("n", "<leader>a", vim.lsp.buf.code_action, {})
vim.keymap.set("n", "<leader>r", vim.lsp.buf.rename, {})
vim.keymap.set("n", "<leader>d", vim.diagnostic.open_float, {})

-- netrw
vim.keymap.set("n", "<leader>pv", ":Neotree<CR>")
