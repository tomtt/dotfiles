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

local hash_rocket_replace = "/\\v(['\"])([a-z0-9_]{-})\\1\\s*\\=\\>/\\2:/g"

vim.keymap.set(
  "n",
  "<leader>eh",
  ":%s" .. hash_rocket_replace .. "c<cr>",
  { desc = "Replace rocket hash notations in buffer with symbol with confirmation" }
)

vim.keymap.set(
  "n",
  "<leader>eH",
  ":%s" .. hash_rocket_replace .. "<cr>",
  { desc = "Replace rocket hash notations in buffer with symbol without confirmation" }
)

vim.keymap.set(
  "v",
  "<leader>eh",
  ":s" .. hash_rocket_replace .. "c<cr>",
  { desc = "Replace rocket hash notations in selection with symbol with confirmation" }
)

vim.keymap.set(
  "v",
  "<leader>eH",
  ":s" .. hash_rocket_replace .. "<cr>",
  { desc = "Replace rocket hash notations in selection with symbol without confirmation" }
)

local replace_to_symbol_index = "/\\v\\['([a-z_]{-})'\\]/[:\\1]/g"
vim.keymap.set(
  "n",
  "<leader>ey",
  ":%s" .. replace_to_symbol_index .. "c<cr>",
  { desc = "Replace indexing with string with symbol with confirmation" }
)

vim.keymap.set(
  "n",
  "<leader>eY",
  ":%s" .. replace_to_symbol_index .. "<cr>",
  { desc = "Replace indexing with string with symbol without confirmation" }
)

vim.keymap.set(
  "v",
  "<leader>ey",
  ":s" .. replace_to_symbol_index .. "c<cr>",
  { desc = "Replace indexing with string with symbol in selection with confirmation" }
)

vim.keymap.set(
  "v",
  "<leader>eY",
  ":s" .. replace_to_symbol_index .. "<cr>",
  { desc = "Replace indexing with string with symbol in selection without confirmation" }
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
