vim.keymap.set(
  "n",
  "<leader>ed",
  ":%s/\\(\\**\\) \\(.*\\)/\\1 <s>\\2<\\/s>/<cr>",
  { desc = "Strike through wiki items" }
)
vim.keymap.set(
  "v",
  "<leader>ed",
  ":s/\\(\\**\\) \\(.*\\)/\\1 <s>\\2<\\/s>/<cr>",
  { desc = "Strike through selected wiki items" }
)

function ApplyColorscheme(color)
  color = color or 'tokyonight-night'
  vim.cmd.colorscheme(color)

  vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
  vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })
end

require("tokyonight").setup({
  on_highlights = function(hl, colors)
    hl.ColorColumn = {
      -- bg = colors.bg_highlight,
      bg = "#4b121d",
    }
  end,
})

ApplyColorscheme()
