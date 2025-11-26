return {
  "nvim-telescope/telescope.nvim",
  branch = "master", -- using master to fix issues with deprecated to definition warnings
  -- '0.1.x' for stable ver.
  dependencies = {
    "nvim-lua/plenary.nvim",
    { "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
    "nvim-tree/nvim-web-devicons",
    "andrew-george/telescope-themes",
  },
  config = function()
    local telescope = require("telescope")
    local actions = require("telescope.actions")
    local builtin = require("telescope.builtin")

    telescope.load_extension("fzf")
    telescope.load_extension("themes")

    telescope.setup({
      defaults = {
        path_display = { "smart" },
        mappings = {
          i = {
            ["<C-k>"] = actions.move_selection_previous,
            ["<C-j>"] = actions.move_selection_next,
          },
        },
      },
      extensions = {
        themes = {
          enable_previewer = true,
          enable_live_preview = true,
          persist = {
            enabled = true,
            path = vim.fn.stdpath("config") .. "/lua/colorscheme.lua",
          },
        },
      },
    })

    -- Keymaps
    vim.keymap.set(
      "n",
      "<leader>ths",
      "<cmd>Telescope themes<CR>",
      { noremap = true, silent = true, desc = "Theme Switcher" }
    )
    vim.keymap.set("n", "<leader>fa", builtin.autocommands, { desc = "Telescope autocommands" })
    vim.keymap.set("n", "<leader>fb", builtin.buffers, { desc = "Telescope buffers" })
    vim.keymap.set(
      "n",
      "<leader>fB",
      builtin.current_buffer_fuzzy_find,
      { desc = "Telescope current buffer fuzzy find" }
    )
    vim.keymap.set("n", "<leader>fc", vim.cmd.cclose, { desc = "Close quickfix window" })
    vim.keymap.set("n", "<leader>fF", builtin.find_files, { desc = "Telescope find files" })
    vim.keymap.set("n", "<leader>ff", builtin.git_files, { desc = "Telescope find git files" })
    vim.keymap.set(
      "v",
      "<leader>fgb",
      builtin.git_bcommits_range,
      { desc = "Telescope buffer's git commits in range of lines" }
    )
    vim.keymap.set("n", "<leader>fgb", builtin.git_bcommits, { desc = "Telescope buffer's git commits" })
    vim.keymap.set("n", "<leader>fgc", builtin.git_commits, { desc = "Telescope git commits" })
    vim.keymap.set("n", "<leader>fgs", builtin.git_status, { desc = "Telescope git status" })
    vim.keymap.set("n", "<leader>fH", builtin.help_tags, { desc = "Telescope help tags" })
    vim.keymap.set("n", "<leader>fj", builtin.jumplist, { desc = "Telescope jumplist" })
    vim.keymap.set("n", "<leader>fK", builtin.keymaps, { desc = "Telescope keymaps" })
    vim.keymap.set("n", "<leader>fl", builtin.lsp_document_symbols, { desc = "Telescope methods" })
    vim.keymap.set("n", "<leader>fL", builtin.colorscheme, { desc = "Telescope colorscheme" })
    vim.keymap.set("n", "<leader>fm", builtin.man_pages, { desc = "Telescope man pages" })
    vim.keymap.set("n", "<leader>fM", builtin.marks, { desc = "Telescope marks" })
    vim.keymap.set("n", "<leader>fp", builtin.resume, { desc = "Telescope previous picker results" })
    vim.keymap.set("n", "<leader>fq", builtin.quickfix, { desc = "Telescope quickfix" })
    vim.keymap.set("n", "<leader>fQ", builtin.quickfixhistory, { desc = "Telescope quickfix history" })
    vim.keymap.set("n", "<leader>fr", builtin.registers, { desc = "Telescope registers" })
    vim.keymap.set("n", "<leader>fS", builtin.grep_string, { desc = "Telescope search string" })
    vim.keymap.set("n", "<leader>fs", builtin.live_grep, { desc = "Telescope live grep" })
    vim.keymap.set("n", "<leader>ft", builtin.treesitter, { desc = "Telescope treesitter" })
    vim.keymap.set("n", "<leader>fT", vim.cmd.TodoTelescope, { desc = "Telescope todos" })
    vim.keymap.set("n", "<leader>fv", builtin.vim_options, { desc = "Telescope vim options" })
    vim.keymap.set("n", "<leader>fy", builtin.filetypes, { desc = "Telescope file types" })
    vim.keymap.set("n", "<leader>fz", builtin.spell_suggest, { desc = "Telescope spelling suggestions" })
    vim.keymap.set("n", "<leader>fo", "<cmd>Telescope oldfiles<CR>", { desc = "Fuzzy find recent files" })
    vim.keymap.set("n", "<leader>fW", function()
      local word = vim.fn.expand("<cWORD>")
      builtin.grep_string({ search = word })
    end, { desc = "Find Connected Words under cursor" })
  end,
}
