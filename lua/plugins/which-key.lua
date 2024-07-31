return {
  "folke/which-key.nvim",
  event = "VeryLazy",
  init = function()
    vim.o.timeout = true
    vim.o.timeoutlen = 300
  end,
  opts = {
    plugins = { spelling = true },
  },
  config = function(_, opts)
    local wk = require("which-key")
    wk.setup(opts)
    wk.add({
      { "<leader>",   group = "More Actions" },
      { "<leader>f",  group = "Find Or Search" },
      { "<leader>ff", "<cmd>Telescope find_files<cr>", desc = "Find File" },
      { "<leader>fn", "<cmd>enew<cr>",                 desc = "New File" },
      { "<leader>fr", "<cmd>Telescope oldfiles<cr>",   desc = "Open Recent File" },
      { "<leader>h",  group = "Git Actions" },
      { "[",          group = "Previous Action" },
      { "]",          group = "Next Action" },
      { "g",          group = "Goto" },
    })
  end,
}
