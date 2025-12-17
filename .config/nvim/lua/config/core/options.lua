local opt = vim.opt

-- syntax on
opt.termguicolors = true
--
-- --"" Other Configurations
-- filetype plugin indent on
opt.incsearch = true
opt.ignorecase = true
opt.smartcase = true
opt.hlsearch = true
opt.ruler = true
opt.laststatus = 2
opt.showcmd = true
opt.showmode = true
-- opt.fillchars+=vert:\
opt.wrap = false
opt.encoding = "utf-8"
opt.number = true
opt.numberwidth = 3
opt.title = true
opt.autoread = true
opt.updatetime = 500

opt.history = 100    -- keep 100 lines of command line history
opt.ruler = true     -- show the cursor position all the time
opt.showcmd = true   -- display incomplete commands
opt.incsearch = true -- do incremental searching

opt.mouse = [[ch]]

opt.showmatch = true -- show matching parenthesis

opt.showmode = false

opt.tabstop = 2
opt.softtabstop = 2
opt.shiftwidth = 2
opt.shiftround = true
opt.expandtab = true
opt.smarttab = true
opt.autoindent = true
opt.copyindent = true -- copy previous indentation on autoindenting
opt.smartindent = true
opt.lazyredraw = true -- prevent redraws while executing

opt.list = true
opt.listchars = { tab = "┊┈", extends = "▶", precedes = "◀", nbsp = "‿" }
opt.joinspaces = false

opt.startofline = false

-- opt.suffixesadd+=.tsx,.ts,.js,.jsx,.scss,.css,.json

-- opt.clipboard:append("unnamedplus")

opt.formatoptions = [[croqj]]

opt.undofile = true
opt.undodir = ".vim_undo"

opt.colorcolumn = "131"
opt.textwidth = 130
-- <C-w>c sets width window to textwidth (value >130 because of line number column)
vim.keymap.set("n", "<C-w>f", "137<C-w>|", { desc = "set window width to fit max length code lines" })

opt.scrolloff = 2
opt.signcolumn = "yes"
opt.backspace = { "start", "eol", "indent" }
opt.updatetime = 50
vim.g.editorconfig = true

-- Treesitter folds
opt.foldmethod = "expr"
opt.foldexpr = "v:lua.vim.treesitter.foldexpr()"
opt.foldlevelstart = 99
opt.foldenable = true

vim.o.winborder = 'rounded'
