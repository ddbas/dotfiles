return {
	"neovim/nvim-lspconfig",
	config = function()
		-- Enable inline completion per-buffer only for clients that support it (e.g. copilot).
		-- Calling enable() globally (no bufnr) causes Completor timers to leak on exit and
		-- Completor:destroy() is never reached during normal nvim shutdown.
		vim.api.nvim_create_autocmd('LspAttach', {
			callback = function(args)
				local client = vim.lsp.get_client_by_id(args.data.client_id)
				if client and client:supports_method(vim.lsp.protocol.Methods.textDocument_inlineCompletion, args.buf) then
					vim.lsp.inline_completion.enable(true, { bufnr = args.buf })
				end
			end,
		})

		-- https://github.com/neovim/nvim-lspconfig/blob/master/doc/configs.md#lua_ls
		vim.lsp.config("lua_ls", {
			on_init = function(client)
				if client.workspace_folders then
					local path = client.workspace_folders[1].name
					if
						path ~= vim.fn.stdpath("config")
						and (vim.uv.fs_stat(path .. "/.luarc.json") or vim.uv.fs_stat(path .. "/.luarc.jsonc"))
					then
						return
					end
				end

				client.config.settings.Lua = vim.tbl_deep_extend("force", client.config.settings.Lua, {
					runtime = {
						-- Tell the language server which version of Lua you're using (most
						-- likely LuaJIT in the case of Neovim)
						version = "LuaJIT",
						-- Tell the language server how to find Lua modules same way as Neovim
						-- (see `:h lua-module-load`)
						path = {
							"lua/?.lua",
							"lua/?/init.lua",
						},
					},
					-- Make the server aware of Neovim runtime files
					workspace = {
						checkThirdParty = false,
						library = {
							vim.env.VIMRUNTIME,
							-- Depending on the usage, you might want to add additional paths
							-- here.
							-- '${3rd}/luv/library'
							-- '${3rd}/busted/library'
						},
						-- Or pull in all of 'runtimepath'.
						-- NOTE: this is a lot slower and will cause issues when working on
						-- your own configuration.
						-- See https://github.com/neovim/nvim-lspconfig/issues/3189
						-- library = {
						--   vim.api.nvim_get_runtime_file('', true),
						-- }
					},
				})
			end,
			settings = {
				Lua = {},
			},
		})

		-- Set exit_timeout so nvim waits for copilot-language-server to acknowledge
		-- shutdown and sends the LSP 'exit' notification before force-stopping.
		-- Without this, exit_timeout defaults to false -> vim.wait(0) -> nvim exits
		-- before 'exit' is ever sent, leaving copilot-language-server as an orphan.
		vim.lsp.config("copilot", { exit_timeout = 2000 })

		-- https://oxide.md/Setup+Instructions#!%20README%20Neovim
		local capabilities = vim.lsp.protocol.make_client_capabilities()
		vim.lsp.config("markdown_oxide", {
			-- Ensure that dynamicRegistration is enabled! This allows the LS to take into account actions like the
			-- Create Unresolved File code action, resolving completions for unindexed code blocks, ...
			capabilities = vim.tbl_deep_extend("force", capabilities, {
				workspace = {
					didChangeWatchedFiles = {
						dynamicRegistration = true,
					},
				},
			}),
		})

		-- https://github.com/neovim/nvim-lspconfig/blob/master/doc/configs.md
		vim.lsp.enable("bashls")
		vim.lsp.enable("biome")
		vim.lsp.enable("clangd")
		vim.lsp.enable("copilot")
		vim.lsp.enable("csharp_ls")
		vim.lsp.enable("cssls")
		vim.lsp.enable("dockerls")
		vim.lsp.enable("eslint")
		vim.lsp.enable("html")
		vim.lsp.enable("jsonls")
		vim.lsp.enable("lua_ls")
		vim.lsp.enable("markdown_oxide")
		vim.lsp.enable("marksman")
		vim.lsp.enable("pyright")
		vim.lsp.enable("rust_analyzer")
		vim.lsp.enable("ts_ls")
	end,
}
