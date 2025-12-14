return {
  'Wansmer/treesj',
  keys = { '<space>m', '<space>j', '<space>s' },
  dependencies = { 'nvim-treesitter/nvim-treesitter' }, -- if you install parsers with `nvim-treesitter`
  config = function()
    require("treesj").setup({ use_default_keymaps = false })

    vim.keymap.set("n", "<leader>mt", require("treesj").toggle, { desc = "Split/Join toggle" })
    vim.keymap.set("n", "<leader>mj", require("treesj").join, { desc = "Join" })
    vim.keymap.set("n", "<leader>ms", require("treesj").split, { desc = "Split" })
  end,
}
