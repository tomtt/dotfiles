return {
  "vim-test/vim-test",
  dependencies = {
    "preservim/vimux",
  },

  vim.keymap.set("n", "<leader>t", ":TestNearest<CR>"),
  vim.keymap.set("n", "<leader>T", ":TestFile<CR>"),
  vim.keymap.set("n", "<leader>vta", ":TestSuite<CR>"),
  vim.keymap.set("n", "<leader>vtl", ":TestLast<CR>"),
  vim.keymap.set("n", "<leader>vtg", ":TestVisit<CR>"),

  vim.cmd("let test#strategy = 'vimux'"),
}
