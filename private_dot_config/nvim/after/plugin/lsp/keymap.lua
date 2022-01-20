local keymap = vim.api.nvim_set_keymap;
-- LSP
keymap("n", "gd", "<cmd>lua vim.lsp.buf.definition()<CR>", { noremap = true, silent = true })
keymap("n", "gr", "<cmd>lua vim.lsp.buf.references()<CR>", { noremap = true, silent = true })
keymap("n", "<C-Space>", "<cmd>lua vim.lsp.buf.code_action()<CR>", { silent = true })
keymap("n", "<leader>ca", "<cmd>lua vim.lsp.buf.code_action()<CR>", { noremap = true, silent = true })
keymap("v", "<leader>ca", "<cmd>'<,'>lua vim.lsp.buf.range_code_action()<CR>", { noremap = true, silent = true })
keymap("n", "<leader>cr", "<cmd>lua vim.lsp.buf.rename()<CR>", { noremap = true, silent = true })
keymap("n", "<leader>cf", "<cmd>lua vim.lsp.buf.formatting()<CR>", { noremap = true, silent = true })
keymap("v", "<leader>cf", "<cmd>'<.'>lua vim.lsp.buf.range_formatting()<CR>", { noremap = true, silent = true })
keymap("n", "K", "<cmd>lua vim.lsp.buf.hover()<CR>", { noremap = true, silent = true })
keymap("n", "]g", "<cmd>lua vim.diagnostic.goto_next({ float = { border = 'rounded' }})<CR>", { noremap = true, silent = true })
keymap("n", "[g", "<cmd>lua vim.diagnostic.goto_prev({ float = { border = 'rounded' }})<CR>", { noremap = true, silent = true })
