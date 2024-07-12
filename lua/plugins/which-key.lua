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
    wk.register({
      ["["] = {
        name = "Previous Action",
      },
      ["]"] = {
        name = "Next Action",
      },
      ["g"] = {
        name = "Goto",
      },
      ["<leader>"] = {
        name = "More Actions",
        f    = {
          name = "Find Or Search",
          f = { "<cmd>Telescope find_files<cr>", "Find File" },
          r = { "<cmd>Telescope oldfiles<cr>", "Open Recent File" },
          n = { "<cmd>enew<cr>", "New File" },
        },
        h    = {
          name = "Git Actions",
        },
      },
    })
  end,
}
