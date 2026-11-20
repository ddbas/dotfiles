-- zk note-taking (https://github.com/zk-org/zk-nvim). Only loaded inside a zk notebook
-- (a directory containing `.zk`), so other projects are unaffected.
return {
  "zk-org/zk-nvim",
  name = "zk",
  cond = function()
    return vim.uv.fs_stat(vim.fn.getcwd() .. "/.zk") ~= nil
  end,
  dependencies = { "nvim-telescope/telescope.nvim" },
  config = function()
    require("zk").setup({
      picker = "telescope",
      lsp = {
        config = { name = "zk", cmd = { "zk", "lsp" }, filetypes = { "markdown" } },
        auto_attach = { enabled = true },
      },
    })
  end,
}
