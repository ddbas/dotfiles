return {
  "hrsh7th/nvim-cmp",
  dependencies = {
    "neovim/nvim-lspconfig",
    "hrsh7th/cmp-nvim-lsp",
    "hrsh7th/cmp-buffer",
    "hrsh7th/cmp-path",
    "hrsh7th/cmp-cmdline",
  },
  config = function()
    -- nvim-cmp
    local cmp = require("cmp")
    cmp.setup({
      snippet = {
        expand = function(args)
          vim.snippet.expand(args.body) -- For native neovim snippets (Neovim v0.10+)
        end,
      },
      mapping = cmp.mapping.preset.insert({
        ["<C-b>"] = cmp.mapping.scroll_docs(-4),
        ["<C-f>"] = cmp.mapping.scroll_docs(4),
        ["<C-Space>"] = cmp.mapping.complete(),
        ["<C-e>"] = cmp.mapping.abort(),
        -- Enter confirms the completion menu, but in markdown it must still make a new bullet.
        -- Markdown: confirm if an item was explicitly selected, or if the cursor is in a link/tag
        -- context ([[..., #tag) where the first suggestion is wanted; otherwise normal Enter
        -- (list continuation). Other filetypes: confirm the first item (select = true).
        ["<CR>"] = cmp.mapping({
          i = function(fallback)
            if not cmp.visible() then
              return fallback()
            end
            if cmp.get_active_entry() then
              return cmp.confirm({ behavior = cmp.ConfirmBehavior.Replace, select = false })
            end
            if vim.bo.filetype ~= "markdown" then
              return cmp.confirm({ select = true })
            end
            local before = vim.api.nvim_get_current_line():sub(1, vim.api.nvim_win_get_cursor(0)[2])
            if before:match("%[%[[^%]]*$") or before:match("#[%w_/-]*$") then
              return cmp.confirm({ select = true })
            end
            fallback()
          end,
          s = cmp.mapping.confirm({ select = true }),
          c = cmp.mapping.confirm({ behavior = cmp.ConfirmBehavior.Replace, select = true }),
        }),
      }),
      sources = cmp.config.sources({
        { name = "nvim_lsp" },
        { name = 'buffer' }
      }),
    })
  end,
}
