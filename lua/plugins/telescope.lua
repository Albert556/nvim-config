local M={
  'nvim-telescope/telescope.nvim',
  tag = '0.1.5',
  cmd = "Telescope",
  dependencies = {
    'nvim-lua/plenary.nvim',
    {
      "nvim-telescope/telescope-fzf-native.nvim",
      build = "make",
      enabled = vim.fn.executable("make") == 1,
      config = function()
        require("telescope").load_extension("fzf")
      end,
    },
  },
  keys = {
    {
      "<leader><tab>",
      "<cmd>Telescope buffers sort_mru=true sort_lastused=true<cr>",
      desc = "Switch Buffer",
    },
    { '<leader>:', "<cmd>Telescope command_history<cr>", desc = "Command History" },
    { '<leader><space>', "<cmd>Telescope find_files<cr>", "Find Files (root dir)" },

    -- find
    { "<leader>fr", "<cmd>Telescope oldfiles<cr>", desc = "Recent" },

    -- git
    { "<leader>gc", "<cmd>Telescope git_commits<CR>", desc = "commits" },
    { "<leader>gs", "<cmd>Telescope git_status<CR>", desc = "status" },

    -- search
    { "<leader>/", "<cmd>Telescope current_buffer_fuzzy_find<cr>", desc = "Buffer" },
    { '<c-/>', "<cmd>Telescope live_grep<cr>", desc = "Grep (root dir)" },
    { '<leader>s"', "<cmd>Telescope registers<cr>", desc = "Registers" },
    { "<leader>sa", "<cmd>Telescope autocommands<cr>", desc = "Auto Commands" },
    { "<leader>sd", "<cmd>Telescope diagnostics bufnr=0<cr>", desc = "Document diagnostics" },
    { "<leader>sD", "<cmd>Telescope diagnostics<cr>", desc = "Workspace diagnostics" },
    { "<leader>sm", "<cmd>Telescope marks<cr>", desc = "Jump to Mark" },
  },
}

return M
