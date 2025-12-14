return {
  "folke/which-key.nvim",
  configure = function()
    require("which-key").setup({
      disable = { filetypes = { "TelescopePrompt" } },
    })
  end
}
