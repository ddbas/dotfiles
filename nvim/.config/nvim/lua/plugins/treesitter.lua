return {
  "nvim-treesitter/nvim-treesitter",
  lazy = false,
  build = ":TSUpdate",
  config = function()
    vim.filetype.add({ extension = { mdx = "markdown.mdx" } })

    require("nvim-treesitter").install({
      "bash",
      "c",
      "c_sharp",
      "cpp",
      "css",
      "dockerfile",
      "html",
      "javascript",
      "json",
      "lua",
      "markdown",
      "markdown_inline",
      "python",
      "rust",
      "hcl",
      "tsx",
      "typescript",
      "vimdoc",
    })

    vim.api.nvim_create_autocmd("FileType", {
      pattern = {
        "bash",
        "c",
        "cpp",
        "cs",
        "css",
        "dockerfile",
        "html",
        "javascript",
        "json",
        "lua",
        "markdown",
        "python",
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
