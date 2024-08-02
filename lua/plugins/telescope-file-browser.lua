return {
  "nvim-telescope/telescope-file-browser.nvim",
  dependencies = { {
    "nvim-telescope/telescope.nvim",
    opts = {
      extensions = {
        file_browser = {
          theme = "ivy",
          -- disables netrw and use telescope-file-browser in its place
          hijack_netrw = true,
          mappings = {
            ["i"] = {
              -- your custom insert mode mappings
            },
            ["n"] = {
              -- your custom normal mode mappings
            },
          },
        },
      },
    },
  }, "nvim-lua/plenary.nvim" },
  keys = {
    -- require("telescope").extensions.file_browser.file_browser()
    { "\\",     ":Telescope file_browser<CR>",                               desc = "Telescope File Browser" },
    { "<C-\\>", ":Telescope file_browser path=%:p:h select_buffer=true<CR>", desc = "Telescope File Browser Of The Current Buffer" },
  },
  config = function()
    require("telescope").load_extension "file_browser"
  end

}
