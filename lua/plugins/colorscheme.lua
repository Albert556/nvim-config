return {
  {
    "rebelot/kanagawa.nvim",
    lazy = false,
    priority = 1000, -- make sure to load this before all the other start plugins
  },
  {
    "neanias/everforest-nvim",
    lazy = false,
    version = false,
    priority = 1000, -- make sure to load this before all the other start plugins
    main = "everforest",
    -- Optional; default configuration will be used if setup isn't called.
    opts = {
      background = "soft",
    },
    config = function(_, opts)
      require("everforest").setup(opts)
      vim.opt.background = "dark"
      vim.cmd([[colorscheme everforest]])
    end,
  },
}
