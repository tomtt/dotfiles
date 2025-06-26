return {
  -- Catpuccin as main theme
  {
    "LazyVim/LazyVim",
    opts = {
      colorscheme = "catppuccin",
    },
  },

  -- Honestly, I can't remember
  {
    "L3MON4D3/LuaSnip",
    keys = function()
      return {}
    end,
  },

  -- Use tab instead of enter to select completion
  {
    "saghen/blink.cmp",
    opts = {
      keymap = {
        preset = "super-tab",
      },
    },
  },

  -- Disable mini.pairs to use endwise instead
  { "echasnovski/mini.pairs", enabled = false },

  -- Disable flash.nvim, really annoying
  { "folke/flash.nvim", enabled = false },

  -- ruby-lsp config to not ovveride code highlighting
  {
    "neovim/nvim-lspconfig",
    opts = {
      inlay_hints = { enabled = false },
      servers = {
        ruby_lsp = {
          on_attach = function(client, _)
            -- Disable semantic highlighting provided by ruby-lsp
            if client.server_capabilities.semanticTokensProvider then
              client.server_capabilities.semanticTokensProvider = nil
            end

            -- Disable document highlighting feature when put cursor on words
            if client.server_capabilities.documentHighlightProvider then
              client.server_capabilities.documentHighlightProvider = false
            end
          end,
        },
      },
    },
  },

  -- Disable snacks.nvim scroll animation
  {
    "folke/snacks.nvim",
    opts = {
      scroll = {
        enabled = false,
      },
    },
  },

  -- Force to not search for .git and node_modules on fzf-lua
  -- Also, append notes.md to the file list
  {
    "ibhagwan/fzf-lua",
    opts = {
      files = {
        -- cmd = "rg --files --hidden --glob '!.git/' --glob '!node_modules/'",
        cmd = "bash -c \"(rg --files --hidden --glob '!.git/' --glob '!node_modules/'; echo ~/notes.md)\"",
      },
    },
  },

  -- Ensure code highlight to ruby, go and js
  {
    "nvim-treesitter/nvim-treesitter",
    opts = {
      ensure_installed = {
        "javascript",
        "go",
        "ruby",
      },
    },
  },
}
