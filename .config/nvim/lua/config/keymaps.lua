-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

-- run "go run cmd/<folder>/main.go" in a tmux split
vim.keymap.set("n", "<leader>gr", function()
  local filepath = vim.fn.expand("%:p")
  local folder = vim.fn.fnamemodify(filepath, ":h:t")
  vim.notify(filepath)
  local cmd = string.format("tmux split-window -v -l 10 'go run cmd/%s/main.go; read'", folder)
  os.execute(cmd)
end, { desc = "Run Go in tmux split" })
