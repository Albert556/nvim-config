return {
  "nvim-telescope/telescope-file-browser.nvim",
  dependencies = { {
    "nvim-telescope/telescope.nvim",
  }, "nvim-lua/plenary.nvim" },
  keys = {
    -- require("telescope").extensions.file_browser.file_browser()
    { "<leader>\\", ":Telescope file_browser path=%:p:h select_buffer=true<CR>", desc = "Telescope File Browser Of The Current Buffer" },
  },
  config = function()
    require("telescope").load_extension "file_browser"
  end

}
