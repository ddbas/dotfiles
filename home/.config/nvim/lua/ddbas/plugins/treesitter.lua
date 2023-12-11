return {
  "nvim-treesitter/nvim-treesitter",
  build = ":TSUpdate",
  config = function()
    local configs = require("nvim-treesitter.configs")

    configs.setup({
        ensure_installed = {
          'astro',
          'css',
          'dockerfile',
          'html',
          'javascript',
          'json',
          'lua',
          'markdown',
          'rust',
          'tsx',
          'typescript',
          'vimdoc'
        },
        sync_install = false,
        auto_install = true,
        highlight = {
            enable = true,
            additional_vim_regex_highlighting = false
        }
    })

    vim.treesitter.language.register('markdown', 'mdx')
  end
}
