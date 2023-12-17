return {
  "catppuccin/nvim",
  name = "catppuccin",
  priority = 1000,
  config = function()
    local catppuccin = require("catppuccin")
    catppuccin.setup({
      flavour = "macchiato",
      integrations = {
        cmp = true,
        mason = true,
        native_lsp = {
          enabled = true
        },
        telescope = {
          enabled = true
        },
        treesitter = true
      }
    })

    vim.cmd.colorscheme "catppuccin"
  end
}
