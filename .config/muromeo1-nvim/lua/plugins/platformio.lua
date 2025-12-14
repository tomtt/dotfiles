return {
  "anurag3301/nvim-platformio.lua",
  lazy = true,
  dependencies = {
    { "akinsho/nvim-toggleterm.lua" },
    { "nvim-telescope/telescope.nvim" },
    { "nvim-lua/plenary.nvim" },
  },
  keys = {
    { "<leader>pi", ":Pioinit<CR>", desc = "PlatformIO Init" },
    { "<leader>pr", ":Piorun<CR>", desc = "PlatformIO Run" },
    { "<leader>pc", ":Piocmd<CR>", desc = "PlatformIO Command" },
    { "<leader>pl", ":Piolib ", desc = "PlatformIO Library" },
    { "<leader>pm", ":Piomon<CR>", desc = "PlatformIO Monitor" },
    { "<leader>pd", ":Piodebug<CR>", desc = "PlatformIO Debug" },
    { "<leader>pb", ":Piodb<CR>", desc = "PlatformIO Database" },
  },
}
