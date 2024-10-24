return {
  "folke/which-key.nvim",
  event = "VimEnter",
  opts = {
    spec = {

      { "<leader>",   group = "More Actions" },
      { "<leader>f",  group = "Find Or Search" },
      { "<leader>ff", "<cmd>Telescope find_files<cr>", desc = "Find File" },
      { "<leader>fn", "<cmd>enew<cr>",                 desc = "New File" },
      { "<leader>fr", "<cmd>Telescope oldfiles<cr>",   desc = "Open Recent File" },
      { "<leader>h",  group = "Git Actions" },
      { "<leader>s",  group = "search" },
      { "[",          group = "Previous Action" },
      { "]",          group = "Next Action" },
      { "g",          group = "Goto" },
      -- { '<leader>c', group = '[C]ode', mode = { 'n', 'x' } },
      -- { '<leader>d', group = '[D]ocument' },
      -- { '<leader>r', group = '[R]ename' },
      -- { '<leader>s', group = '[S]earch' },
      -- { '<leader>w', group = '[W]orkspace' },
      -- { '<leader>t', group = '[T]oggle' },
      -- { '<leader>h', group = 'Git [H]unk', mode = { 'n', 'v' } },
    },
  },
}
