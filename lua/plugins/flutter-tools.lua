return {
  "akinsho/flutter-tools.nvim",
  ft = "dart",
  dependencies = { "nvim-lua/plenary.nvim" },
  specs = {
    -- Add "flutter" extension to "telescope"
    {
      "nvim-telescope/telescope.nvim",
      optional = true,
      opts = function()
        require("telescope").load_extension("flutter")
      end,
    },
  },
  opts = {
    lsp = {
      on_attach = vim.g.lsp_on_attach,
    },
  } 

}
