return {
  'mfussenegger/nvim-lint',
  config = function ()
    local lint = require('lint')
    lint.linters_by_ft = {
      javascript = {'eslint'},
      javascriptreact = {'eslint'},
      typescript = {'eslint'},
      typescriptreact = {'eslint'},
    }
    vim.api.nvim_create_autocmd({ "BufEnter", "BufWritePost" }, {
      callback = function()
        -- lint.try_lint(nil, { ignore_errors = true })
        lint.try_lint()
      end,
    })
  end
}
