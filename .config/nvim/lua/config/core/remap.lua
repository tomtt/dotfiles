local opts = { noremap = true, silent = true }

vim.keymap.set("n", "n", "nzzzv", { desc = "next find with aligned cursor" })
vim.keymap.set("n", "N", "Nzzzv", { desc = "prev find with aligned cursor" })
vim.keymap.set("n", "<leader>s", vim.cmd.write, { desc = "write buffer" })
vim.keymap.set("n", "<leader>ec", function()
  ApplyColorscheme()
end, { desc = "apply colorscheme and transparency" })
vim.keymap.set("n", "<leader>eR", ":source " .. vim.fn.stdpath("config") .. '/lua/config/core/remap.lua<cr>',
  { desc = 'Resource remap.lua' })

-- <space><space> to swap alternate buffer
vim.keymap.set("n", "<leader><leader>", "<c-^>", { desc = "swap to alternate buffer" })

opts.desc = "indent left maintaining selection"
vim.keymap.set("v", "<", "<gv", opts)
opts.desc = "indent right maintaining selection"
vim.keymap.set("v", ">", ">gv", opts)

opts.desc = "yank to system clipboard"
vim.keymap.set({ "n", "v" }, "<leader>y", '"+y', opts)
vim.keymap.set({ "n", "v" }, "<leader>Y", '"+Y', opts)
opts.desc = "paste from system clipboard"
vim.keymap.set({ "n", "v" }, "<leader>p", '"+p', opts)
vim.keymap.set({ "n", "v" }, "<leader>P", '"+P', opts)

-- Paste without replacing clipboard content
vim.keymap.set("x", "<leader>ep", [["_dP]], { desc = 'paste in visual mode without changing @"' })
opts.desc = 'paste without changing @"'
vim.keymap.set("v", "p", '"_dP', opts)
vim.keymap.set({ "n", "v" }, "<leader>d", [["_d]], { desc = 'delete without changing @"' })

vim.keymap.set("n", "Q", "<nop>", { desc = "disable Q" })

-- Replace the word cursor is on globally
vim.keymap.set(
  "n",
  "<leader>mr",
  [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]],
  { desc = "Replace word cursor is on globally" }
)

-- Visual select current indentation
vim.keymap.set({ "n", "v" }, "<leader>vi", "<cmd>normal Vaijo_<CR>",
  { desc = "Visual select around current indentation level" })

-- Put cursor on def of current method
vim.keymap.set("n", "<leader>vm", "<cmd>normal <esc>vamo<esc>w_w<CR>", { desc = "Go to method name" })

-- Hightlight yanking
vim.api.nvim_create_autocmd("TextYankPost", {
  desc = "Highlight when yanking (copying) text",
  group = vim.api.nvim_create_augroup("kickstart-highlight-yank", { clear = true }),
  callback = function()
    vim.hl.on_yank()
  end,
})

vim.keymap.set("v", "<leader>mj", ":m '>+1<CR>gv=gv", { desc = "move lines down in visual mode" })
vim.keymap.set("v", "<leader>mk", ":m '<-2<CR>gv=gv", { desc = "move lines up in visual mode" })
vim.keymap.set("n", "<leader>bf", vim.lsp.buf.format, { desc = "format buffer" })

-- close current split window
vim.keymap.set("n", "<C-w>c", "<cmd>close<CR>", { desc = "Close current split" })

-- Executes shell command from in here making file executable
vim.keymap.set("n", "<leader>bx", "<cmd>!chmod +x %<CR>", { silent = true, desc = "makes file executable" })
vim.keymap.set("n", "<leader>bX", "<cmd>!chmod -x %<CR>", { silent = true, desc = "makes file not executable" })

-- Copy filepath to the clipboard
vim.keymap.set("n", "<leader>bp", function()
  local filePath = vim.fn.expand("%:~")
  vim.fn.setreg("+", filePath)
  print("File path copied to clipboard: " .. filePath)
end, { desc = "Copy file path to clipboard" })

-- LSP code actions
vim.keymap.set({ "n", "v" }, "<leader>ma", function()
  vim.lsp.buf.code_action()
end, { desc = "Code actions" })

-- Spelling
vim.keymap.set("n", "<leader>zn", function()
  vim.opt_local.spelllang = "nl"
  vim.opt_local.spell = true
end, { desc = "Enable NL spelling" })
vim.keymap.set("n", "<leader>ze", function()
  vim.opt_local.spelllang = "en"
  vim.opt_local.spell = true
end, { desc = "Enable EN spelling" })
vim.keymap.set("n", "<leader>zz", function()
  vim.opt_local.spell = false
end, { desc = "Disable spelling" })

vim.keymap.set("n", "<M-t>", function()
  print("Pressed <M-t>")
end, { desc = "Test defining Alt mappings" })

vim.keymap.set("n", "<leader>zm", function()
  local ts = vim.treesitter
  local node = (ts.get_node and ts.get_node({})) -- Neovim ≥0.10
      or require("nvim-treesitter.ts_utils").get_node_at_cursor()
  while node do
    local t = node:type()
    if t == "method" or t == "singleton_method" then
      local srow = node:range() -- start_row
      vim.api.nvim_win_set_cursor(0, { srow + 1, 0 })
      vim.cmd("normal! zc")
      return
    end
    node = node:parent()
  end
end, { desc = "Fold current method" })
