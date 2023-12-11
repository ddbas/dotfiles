return {
  "VonHeikemen/lsp-zero.nvim",
  branch = "v3.x",
  dependencies = {
    -- LSP support
    "neovim/nvim-lspconfig",
    "williamboman/mason.nvim",
    "williamboman/mason-lspconfig.nvim",

    -- Autocompletion
    "hrsh7th/nvim-cmp",
    "hrsh7th/cmp-buffer",
    "hrsh7th/cmp-path",
    "saadparwaiz1/cmp_luasnip",
    "hrsh7th/cmp-nvim-lsp",
    "hrsh7th/cmp-nvim-lua",

    -- Snippets
    "L3MON4D3/LuaSnip"
  },
  config = function()
    local lsp_zero = require("lsp-zero")


    require("mason").setup({})
    require("mason-lspconfig").setup({
      ensure_installed = {
        'astro',
        'bashls',
        'cssls',
        'html',
        'lua_ls',
        'marksman',
        'rust_analyzer',
        'tailwindcss',
        'tsserver'
      },
      handlers = {
        lsp_zero.default_setup,
      }
    })

    local lua_opts = lsp_zero.nvim_lua_ls()
    require('lspconfig').lua_ls.setup(lua_opts)

    local cmp = require('cmp')
    local cmp_action = require('lsp-zero').cmp_action()

    cmp.setup({
      mapping = cmp.mapping.preset.insert({
        -- `Enter` key to confirm completion
        ['<CR>'] = cmp.mapping.confirm({ select = false }),
      })
    })

    lsp_zero.on_attach(function(_, bufnr)
      local opts = { buffer = bufnr, remap = false }

      vim.keymap.set("n", "gd", function() vim.lsp.buf.definition() end, opts)
      vim.keymap.set("n", "<leader>k", function() vim.lsp.buf.hover() end, opts)
      vim.keymap.set("n", "<leader>a", function() vim.lsp.buf.code_action() end, opts)
      vim.keymap.set("n", "gr", function() vim.lsp.buf.references() end, opts)
      vim.keymap.set("n", "<leader>r", function() vim.lsp.buf.rename() end, opts)
      vim.keymap.set("n", "<leader>d", function() vim.diagnostic.open_float() end, opts)
      vim.keymap.set("n", "gs", function() vim.lsp.buf.workspace_symbol() end, opts)
      vim.keymap.set("n", "<leader>F", function() vim.lsp.buf.format() end, opts)
    end)

    lsp_zero.setup()
  end
}
