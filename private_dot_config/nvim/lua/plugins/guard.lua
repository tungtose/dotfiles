return {
  "nvimdev/guard.nvim",
  -- Builtin configuration, optional
  dependencies = {
    "nvimdev/guard-collection",
  },

  config = function()
    vim.g.guard_config = {
        -- format on write to buffer
        fmt_on_save = false,
        -- use lsp if no formatter was defined for this filetype
        lsp_as_default_formatter = false,
        -- whether or not to save the buffer after formatting
        save_on_fmt = true,
        -- automatic linting
        auto_lint = true,
        -- how frequently can linters be called
        lint_interval = 500
    }

    local ft = require('guard.filetype')
    ft('c'):fmt('clang-format')
    ft('rust'):fmt('rustfmt')
    ft('python'):fmt({
      cmd = 'ruff',
      args = { 'format', '--stdin-filename', '%', '-' },
      stdin = true,
    })
    :lint({
      cmd = 'ruff',
      args = { 'check', '--stdin-filename', '%', '-' },
      stdin = true,
    })
  end

}
