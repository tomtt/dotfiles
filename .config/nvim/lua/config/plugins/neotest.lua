return {
  "nvim-neotest/neotest",
  lazy = true,
  dependencies = {
    "nvim-neotest/nvim-nio",
    "zidhuss/neotest-minitest",
  },
  ft = { "ruby" },
  config = function()
    local neotest = require("neotest")
    neotest.setup({
      adapters = {
        require("neotest-minitest"),
      },
      watch = {
        enabled = true,
      },
    })

    require("neotest-minitest")({
      test_cmd = function()
        return {
          "bundle",
          "exec",
          "rails",
          "test",
        }
      end
    })

    vim.keymap.set("n", "<leader>tn", function()
      neotest.run.run()
    end, { desc = "Test: nearest" })
    vim.keymap.set("n", "<leader>tf", function()
      neotest.run.run(vim.fn.expand("%"))
    end, { desc = "Test: file" })
    vim.keymap.set("n", "<leader>ts", neotest.summary.toggle, { desc = "Test: summary" })
    vim.keymap.set("n", "<leader>to", neotest.output.open, { desc = "Test: output" })
    vim.keymap.set("n", "[e", function()
      neotest.jump.prev({ status = "failed" })
    end, { desc = "Test: previous error" })
    vim.keymap.set("n", "]e", function()
      neotest.jump.next({ status = "failed" })
    end, { desc = "Test: next error" })
    vim.keymap.set("n", "<leader>tw", function()
      neotest.watch.toggle(vim.fn.expand("%"))
    end, { desc = "Test: toggle watch" })
  end,
}
