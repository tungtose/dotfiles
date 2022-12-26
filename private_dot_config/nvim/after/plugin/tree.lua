-- [[ Configure tree ]]
--
-- disable netrw at the very start of your init.lua (strongly advised)
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

-- set termguicolors to enable highlight groups
vim.opt.termguicolors = true

vim.keymap.set("n", "<leader>n", ":NvimTreeForcus<CR>")
vim.keymap.set("n", "<C-n>", ":NvimTreeOpen<CR>")
vim.keymap.set("n", "<C-f>", ":NvimTreeFindFile<CR>")
vim.keymap.set("n", "<leader>t", ":NvimTreeToggle<CR>")

require("nvim-tree").setup({
  sort_by = "case_sensitive",
  view = {
    adaptive_size = true,
    mappings = {
      list = {
        { key = "u", action = "dir_up" },
        { key = "s", action = "" },
        { key = "o", action = "system_open" },
      },
    },
  },
  renderer = {
    group_empty = true,
  },
  filters = {
    dotfiles = true,
  },
})
