return {
  "tpope/vim-rails",
  config = function()
    vim.keymap.set({ "n" }, "<leader>ra", "<C-W>o:AV<cr>")
    vim.keymap.set({ "n" }, "<leader>rr", "<C-W>o:RV<cr>")
    vim.keymap.set({ "n" }, "<Leader>rm", ":Emodel<Space>")
    vim.keymap.set({ "n" }, "<Leader>rc", ":Econtroller<Space>")
    vim.keymap.set({ "n" }, "<Leader>rl", ":Elocale<Space>")
    vim.keymap.set({ "n" }, "<Leader>rn", ":Elocale nl<cr>")
    vim.keymap.set({ "n" }, "<Leader>rv", ":Eview<Space>")
    vim.keymap.set({ "n" }, "<Leader>rs", ":Eschema<Space>")
    vim.keymap.set({ "n" }, "<Leader>ri", ":Emigration<Space>")
    vim.keymap.set({ "n" }, "<Leader>rt", ":Rails test<cr>")
  end,
}
