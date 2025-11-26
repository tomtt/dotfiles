local conf = require("telescope.config").values
local themes = require("telescope.themes")

-- helper function to use telescope on harpoon list.
-- change get_ivy to other themes if wanted
local function toggle_telescope(harpoon_files)
  local file_paths = {}
  for _, item in ipairs(harpoon_files.items) do
    table.insert(file_paths, item.value)
  end
  local opts = themes.get_ivy({
    promt_title = "Working List",
  })

  require("telescope.pickers")
      .new(opts, {
        finder = require("telescope.finders").new_table({
          results = file_paths,
        }),
        previewer = conf.file_previewer(opts),
        sorter = conf.generic_sorter(opts),
      })
      :find()
end

return {
  "ThePrimeagen/harpoon",
  branch = "harpoon2",
  dependencies = {
    "nvim-lua/plenary.nvim",
  },
  config = function()
    local harpoon = require("harpoon")
    vim.keymap.set("n", "<leader>a", function()
      print(vim.fn.expand('%') .. ' added to harpoon list')
      harpoon:list():add()
    end, { desc = "Add buffer to harpoon list" })
    vim.keymap.set("n", "<leader>h;", function()
      print(vim.fn.expand('%') .. ' added to harpoon list')
      harpoon:list():add()
    end, { desc = "Add buffer to harpoon list" })
    vim.keymap.set("n", "<M-e>", function()
      harpoon.ui:toggle_quick_menu(harpoon:list())
    end, { desc = "Toggle harpoon window" })
    vim.keymap.set("n", "<leader>he", function()
      harpoon.ui:toggle_quick_menu(harpoon:list())
    end, { desc = "Toggle harpoon window" })
    vim.keymap.set("n", "<leader>fh", function()
      toggle_telescope(harpoon:list())
    end, { desc = "Telescope harpoon buffers" })
    vim.keymap.set("n", "<C-p>", function()
      harpoon:list():prev()
    end, { desc = "Previous buffer in harpoon list" })
    vim.keymap.set("n", "<C-n>", function()
      harpoon:list():next()
    end, { desc = "Next buffer in harpoon list" })

    vim.keymap.set("n", "<leader>ha", function()
      harpoon:list():select(1)
    end, { desc = "Select #1 harpoon buffer" })
    vim.keymap.set("n", "<M-a>", function()
      harpoon:list():select(1)
    end, { desc = "Select #1 harpoon buffer" })
    vim.keymap.set("n", "<leader>hs", function()
      harpoon:list():select(2)
    end, { desc = "Select #2 harpoon buffer" })
    vim.keymap.set("n", "<M-s>", function()
      harpoon:list():select(2)
    end, { desc = "Select #2 harpoon buffer" })
    vim.keymap.set("n", "<leader>hd", function()
      harpoon:list():select(3)
    end, { desc = "Select #3 harpoon buffer" })
    vim.keymap.set("n", "<M-d>", function()
      harpoon:list():select(3)
    end, { desc = "Select #3 harpoon buffer" })
    vim.keymap.set("n", "<leader>hf", function()
      harpoon:list():select(4)
    end, { desc = "Select #4 harpoon buffer" })
    vim.keymap.set("n", "<M-f>", function()
      harpoon:list():select(4)
    end, { desc = "Select #4 harpoon buffer" })
    vim.keymap.set("n", "<leader>hg", function()
      harpoon:list():select(5)
    end, { desc = "Select #5 harpoon buffer" })
    vim.keymap.set("n", "<M-g>", function()
      harpoon:list():select(5)
    end, { desc = "Select #5 harpoon buffer" })
    vim.keymap.set("n", "<leader>hh", function()
      harpoon:list():select(6)
    end, { desc = "Select #6 harpoon buffer" })
    vim.keymap.set("n", "<M-h>", function()
      harpoon:list():select(6)
    end, { desc = "Select #6 harpoon buffer" })
  end,
}
