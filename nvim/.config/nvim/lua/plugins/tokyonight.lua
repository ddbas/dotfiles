return {
  "folke/tokyonight.nvim",
  enabled = false,
  lazy = true,
  opts = {},
  config = function()
    require("tokyonight").setup({
      style = "storm",
      transparent = true,
    })
  end,
}
