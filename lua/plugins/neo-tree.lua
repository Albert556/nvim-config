return {
  "nvim-neo-tree/neo-tree.nvim",
  branch = "v3.x",
  dependencies = {
    "nvim-lua/plenary.nvim",
    "nvim-tree/nvim-web-devicons", -- not strictly required, but recommended
    "MunifTanjim/nui.nvim",
    -- "3rd/image.nvim", -- Optional image support in preview window: See `# Preview Mode` for more information
  },
  cmd = "Neotree",
  keys = {
    { "\\", "<cmd>Neotree toggle reveal<CR>", desc = "Toggle Explorer" },
  },
  deactivate = function()
    vim.cmd([[Neotree close]])
  end,
  opts = {
    close_if_last_window = true,
      sources = { "filesystem", "buffers", "git_status" },
      open_files_do_not_replace_types = { "terminal", "Trouble", "trouble", "qf", "Outline" },
      filesystem = {
        follow_current_file = { enabled = true },
        filtered_items = {  hide_dotfiles = false, hide_gitignored = false },
        use_libuv_file_watcher = true,
      },
  }
}
