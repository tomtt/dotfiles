-- Autocmds are automatically loaded on the VeryLazy event
-- Default autocmds that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/autocmds.lua
-- Add any additional autocmds here

-- Recognize any yaml file with {{ .* }} as helm
vim.api.nvim_create_autocmd({ "BufRead", "BufNewFile" }, {
  pattern = { "*.yaml", "*.yml" },
  callback = function()
    if vim.fn.search("{{.*}}", "nw") ~= 0 then
      vim.bo.filetype = "helm"
    end
  end,
})
