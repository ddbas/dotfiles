return {
  "nvim-treesitter/nvim-treesitter",
  lazy = false,
  build = ":TSUpdate",
  config = function()
    require("nvim-treesitter").install({
      "css",
      "dockerfile",
      "html",
      "javascript",
      "json",
      "lua",
      "markdown",
      "markdown_inline",
      "rust",
      "hcl",
      "tsx",
      "typescript",
      "vimdoc",
    })

    vim.api.nvim_create_autocmd("FileType", {
      pattern = {
        "css",
        "dockerfile",
        "html",
        "javascript",
        "json",
        "lua",
        "markdown",
        "rust",
        "hcl",
        "terraform",
        "javascript.jsx",
        "typescript",
        "typescript.tsx",
        "vimdoc",
      },
      callback = function()
        vim.treesitter.start()
      end,
    })
  end,
}
