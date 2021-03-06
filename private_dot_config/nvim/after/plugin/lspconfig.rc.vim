" if !exists('g:lspconfig')
"   finish
" endif
"
" lua << EOF
" -- vim.lsp.set_log_level("debug")
" EOF
"
"
" lua << EOF
" local nvim_lsp = require('lspconfig')
" local protocol = require'vim.lsp.protocol'
"
" -- Use an on_attach function to only map the following keys 
" -- after the language server attaches to the current buffer
" local on_attach = function(client, bufnr)
"   local function buf_set_keymap(...) vim.api.nvim_buf_set_keymap(bufnr, ...) end
"   local function buf_set_option(...) vim.api.nvim_buf_set_option(bufnr, ...) end
"
"   --Enable completion triggered by <c-x><c-o>
"   buf_set_option('omnifunc', 'v:lua.vim.lsp.omnifunc')
"
"   -- Mappings.
"   local opts = { noremap=true, silent=true }
"
"   -- See `:help vim.lsp.*` for documentation on any of the below functions
"   buf_set_keymap('n', 'gD', '<Cmd>lua vim.lsp.buf.declaration()<CR>', opts)
"   buf_set_keymap('n', 'gd', '<Cmd>lua vim.lsp.buf.definition()<CR>', opts)
"   buf_set_keymap('n', 'K', '<Cmd>lua vim.lsp.buf.hover()<CR>', opts)
"   buf_set_keymap('n', 'gi', '<cmd>lua vim.lsp.buf.implementation()<CR>', opts)
"   --buf_set_keymap('i', '<C-k>', '<cmd>lua vim.lsp.buf.signature_help()<CR>', opts)
"   buf_set_keymap('n', '<leader>wa', '<cmd>lua vim.lsp.buf.add_workspace_folder()<CR>', opts)
"   buf_set_keymap('n', '<leader>wr', '<cmd>lua vim.lsp.buf.remove_workspace_folder()<CR>', opts)
"   buf_set_keymap('n', '<leader>wl', '<cmd>lua print(vim.inspect(vim.lsp.buf.list_workspace_folders()))<CR>', opts)
"   buf_set_keymap('n', '<leader>D', '<cmd>lua vim.lsp.buf.type_definition()<CR>', opts)
"   buf_set_keymap('n', '<leader>rn', '<cmd>lua vim.lsp.buf.rename()<CR>', opts)
"   buf_set_keymap('n', '<leader>ca', '<cmd>lua vim.lsp.buf.code_action()<CR>', opts)
"   buf_set_keymap('n', 'gr', '<cmd>lua vim.lsp.buf.references()<CR>', opts)
"   buf_set_keymap('n', '<leader>e', '<cmd>lua vim.lsp.diagnostic.show_line_diagnostics()<CR>', opts)
"   --buf_set_keymap('n', '<C-j>', '<cmd>lua vim.lsp.diagnostic.goto_prev()<CR>', opts)
"   buf_set_keymap('n', '<S-C-j>', '<cmd>lua vim.lsp.diagnostic.goto_next()<CR>', opts)
"   buf_set_keymap('n', '<leader>q', '<cmd>lua vim.lsp.diagnostic.set_loclist()<CR>', opts)
"   buf_set_keymap("n", "<leader>f", "<cmd>lua vim.lsp.buf.formatting()<CR>", opts)
"
"   -- formatting
"   if client.name == 'tsserver' then
"     client.resolved_capabilities.document_formatting = true
"   end
"
"   if client.resolved_capabilities.document_formatting then
"     vim.api.nvim_command [[augroup Format]]
"     vim.api.nvim_command [[autocmd! * <buffer>]]
"     vim.api.nvim_command [[autocmd BufWritePre <buffer> lua vim.lsp.buf.formatting_seq_sync()]]
"     vim.api.nvim_command [[augroup END]]
"   end
"
" end
"
"
" -- Set up completion using nvim_cmp with LSP source
" local capabilities = require('cmp_nvim_lsp').update_capabilities(
"   vim.lsp.protocol.make_client_capabilities()
" )
"
" nvim_lsp.rust_analyzer.setup {
"   on_attach = on_attach,
"   filetypes = { "rust" },
"   capabilities = capabilities,
"   checkOnSave = {
"     command = "clippy"
"   }
" }
"
" nvim_lsp.hls.setup {
"   on_attach = on_attach,
"   filetypes = { "haskell" },
"   capabilities = capabilities,
" }
"
" nvim_lsp.tsserver.setup {
"   on_attach = on_attach,
"   filetypes = { "javascript", "typescript", "typescriptreact", "typescript.tsx" },
"   capabilities = capabilities
" }
"
" -- icon
" vim.lsp.handlers["textDocument/publishDiagnostics"] = vim.lsp.with(
"   vim.lsp.diagnostic.on_publish_diagnostics, {
"     underline = true,
"     -- This sets the spacing and the prefix, obviously.
"     virtual_text = {
"       spacing = 4,
"       prefix = '???'
"     }
"   }
" )
"
" EOF

" let g:compe = {}
" let g:compe.enabled = v:true
" let g:compe.autocomplete = v:true
" let g:compe.debug = v:false
" let g:compe.min_length = 1
" let g:compe.preselect = 'enable'
" let g:compe.throttle_time = 80
" let g:compe.source_timeout = 200
" let g:compe.incomplete_delay = 400
" let g:compe.max_abbr_width = 100
" let g:compe.max_kind_width = 100
" let g:compe.max_menu_width = 100
" let g:compe.documentation = v:true
"
" let g:compe.source = {}
" let g:compe.source.path = v:true
" let g:compe.source.buffer = v:true
" let g:compe.source.calc = v:true
" let g:compe.source.nvim_lsp = v:true
" let g:compe.source.nvim_lua = v:true
" let g:compe.source.vsnip = v:true
" let g:compe.source.ultisnips = v:true
" let g:compe.source.luasnip = v:true
