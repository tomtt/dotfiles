return {
  "gbprod/yanky.nvim",
  config = function()
    local yanky = require("yanky")
    yanky.setup({})
    pcall(require("telescope").load_extension, "yank_history")
    vim.keymap.set("n", "<leader>fy", "<cmd>Telescope yank_history<cr>", { desc = "Yank history" })
  end
}
