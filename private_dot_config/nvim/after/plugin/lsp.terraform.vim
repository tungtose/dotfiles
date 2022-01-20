lua <<EOF
  local M = {}
  require'lspconfig'.terraformls.setup{} 

  
EOF
autocmd BufWritePre *.tf lua vim.lsp.buf.formatting_sync()
