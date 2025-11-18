local opts = { noremap = true, silent = true }

vim.g.mapleader = " "
vim.g.maplocalleader = " "

vim.keymap.set("n", "n", "nzzzv", { desc = "next find with aligned cursor" })
vim.keymap.set("n", "N", "Nzzzv", { desc = "prev find with aligned cursor" })
vim.keymap.set("n", "<leader>pv", vim.cmd.Ex, { desc = "open explorer" })
vim.keymap.set("n", "<leader>s", vim.cmd.write, { desc = "write buffer" })
vim.keymap.set("n", "<leader>pc", function()
	ApplyColorscheme()
end, { desc = "apply colorscheme and transparency" })

-- <space><space> to swap alternate buffer
vim.keymap.set("n", "<leader><leader>", "<c-^>", { desc = "swap to alternate buffer" })

opts.desc = "indent left maintaining selection"
vim.keymap.set("v", "<", "<gv", opts)
opts.desc = "indent right maintaining selection"
vim.keymap.set("v", ">", ">gv", opts)

-- Paste without replacing clipboard content
vim.keymap.set("x", "<leader>ep", [["_dP]], { desc = 'paste in visual mode without changing @"' })
opts.desc = 'paste without changing @"'
vim.keymap.set("v", "p", '"_dP', opts)
vim.keymap.set({ "n", "v" }, "<leader>d", [["_d]], { desc = 'delete without changing @"' })

vim.keymap.set("n", "Q", "<nop>", { desc = "disable Q" })

-- Replace the word cursor is on globally
vim.keymap.set(
	"n",
	"<leader>es",
	[[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]],
	{ desc = "Replace word cursor is on globally" }
)

-- Hightlight yanking
vim.api.nvim_create_autocmd("TextYankPost", {
	desc = "Highlight when yanking (copying) text",
	group = vim.api.nvim_create_augroup("kickstart-highlight-yank", { clear = true }),
	callback = function()
		vim.hl.on_yank()
	end,
})

-- Clear search highlight
opts.desc = "Clear search highligh"
vim.keymap.set("n", "<C-l>", vim.cmd.nohlsearch, opts)

vim.keymap.set("v", "<leader>ej", ":m '>+1<CR>gv=gv", { desc = "move lines down in visual mode" })
vim.keymap.set("v", "<leader>ek", ":m '<-2<CR>gv=gv", { desc = "move lines up in visual mode" })
vim.keymap.set("n", "<leader>bf", vim.lsp.buf.format, { desc = "format buffer" })

-- close current split window
vim.keymap.set("n", "<C-w>c", "<cmd>close<CR>", { desc = "Close current split" })

-- Executes shell command from in here making file executable
vim.keymap.set("n", "<leader>bx", "<cmd>!chmod +x %<CR>", { silent = true, desc = "makes file executable" })
vim.keymap.set("n", "<leader>bX", "<cmd>!chmod -x %<CR>", { silent = true, desc = "makes file not executable" })

-- Copy filepath to the clipboard
vim.keymap.set("n", "<leader>bp", function()
	local filePath = vim.fn.expand("%:~") -- Gets the file path relative to the home directory
	vim.fn.setreg("+", filePath) -- Copy the file path to the clipboard register
	print("File path copied to clipboard: " .. filePath) -- Optional: print message to confirm
end, { desc = "Copy file path to clipboard" })
