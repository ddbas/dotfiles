-- https://neovim.io/doc/user/lsp.html#LSP
-- https://vonheikemen.github.io/learn-nvim/feature/lsp-setup.html
-- https://github.com/neovim/nvim-lspconfig/tree/master/lsp

vim.keymap.set("n", "<leader>k", function()
	vim.lsp.buf.hover()
end, opts)
vim.keymap.set("n", "<leader>a", function()
	vim.lsp.buf.code_action()
end, opts)
vim.keymap.set("n", "<leader>r", function()
	vim.lsp.buf.rename()
end, opts)
vim.keymap.set("n", "<leader>d", function()
	vim.diagnostic.open_float()
end, opts)

vim.lsp.config["bash"] = {
	cmd = { "bash-language-server", "start" },
	filetypes = { "sh", "bash" },
	root_markers = { ".git" },
}
vim.lsp.enable("bash")

vim.lsp.config["css"] = {
	cmd = { "vscode-css-language-server", "--stdio" },
	filetypes = { "css", "scss", "less" },
	root_markers = { ".git" },
}
vim.lsp.enable("css")

vim.lsp.config["eslint"] = {
	cmd = { "vscode-eslint-language-server", "--stdio" },
	filetypes = { "javascript", "javascriptreact", "typescript", "typescriptreact" },
	root_markers = { ".eslintrc", ".eslintrc.json", ".eslintrc.js", ".eslintrc.cjs", ".eslintrc.yaml", ".eslintrc.yml" },
}
vim.lsp.enable("eslint")

vim.lsp.config["html"] = {
	cmd = { "vscode-html-language-server", "--stdio" },
	filetypes = { "html" },
	root_markers = { ".git" },
}
vim.lsp.enable("html")

vim.lsp.config["javascript/typescript"] = {
	cmd = { "typescript-language-server", "--stdio" },
	filetypes = { "javascript", "javascriptreact", "typescript", "typescriptreact" },
	root_markers = { "package.json" },
}
vim.lsp.enable("javascript/typescript")

vim.lsp.config["json"] = {
	cmd = { "vscode-json-language-server", "--stdio" },
	filetypes = { "json" },
	root_markers = { ".git" },
}
vim.lsp.enable("json")

vim.lsp.config["lua"] = {
	cmd = { "lua-language-server" },
	filetypes = { "lua" },
	root_markers = { ".luarc.json", ".luarc.jsonc" },
}
vim.lsp.enable("lua")

vim.lsp.config["markdown"] = {
	cmd = { "marksman", "server" },
	filetypes = { "markdown" },
	root_markers = { ".git" },
}
vim.lsp.enable("markdown")

vim.lsp.config["rust"] = {
	cmd = { "rust-analyzer" },
	filetypes = { "rust" },
	root_markers = { "Cargo.toml" },
}
vim.lsp.enable("rust")
