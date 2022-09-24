local configs = require('lspconfig.configs')
local lspconfig = require('lspconfig')
local util = require('lspconfig.util')

if not configs.helm_lint_ls then
  configs.helm_lint_ls = {
    default_config = {
      cmd = {"helm_lint_ls", "serve"},
      filetypes = {'helm'},
      root_dir = function(fname)
        return util.root_pattern('Chart.yaml')(fname)
      end,
    },
  }
end

lspconfig.helm_lint_ls.setup {
  filetypes = {"helm", "yaml"},
  cmd = {"helm_lint_ls", "serve"},
}
