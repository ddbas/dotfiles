return {
  'mhartington/formatter.nvim',
  config = function ()
    local formatter = require('formatter')
    formatter.setup({
      filetype = {
        css = {
          require('formatter.filetypes.css').prettier
        },
        html = {
          require('formatter.filetypes.html').prettier
        },
        javascript = {
          require('formatter.filetypes.javascript').prettier
        },
        javascriptreact = {
          require('formatter.filetypes.javascriptreact').prettier
        },
        json = {
          require('formatter.filetypes.json').prettier
        },
        markdown = {
          require('formatter.filetypes.markdown').prettier
        },
        rust = {
          require('formatter.filetypes.rust').rustfmt
        },
        typescript = {
          require('formatter.filetypes.typescript').prettier
        },
        typescriptreact = {
          require('formatter.filetypes.typescriptreact').prettier
        },
        ['*'] = {
          require('formatter.filetypes.any').remove_trailing_whitespace
        }
      }
    })

    vim.keymap.set("n", "<leader>F", ':Format<CR>')
  end
}
