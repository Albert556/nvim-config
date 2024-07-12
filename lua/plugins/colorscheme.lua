return {
  "f-person/auto-dark-mode.nvim",
  opts = {
    update_interval = 1000,
    set_dark_mode = function()
      vim.api.nvim_set_option("background", "dark")
      vim.cmd("colorscheme everforest")
    end,
    set_light_mode = function()
      vim.api.nvim_set_option("background", "light")
      vim.cmd("colorscheme everforest")
    end,
  },
  {
    "neanias/everforest-nvim",
    lazy = false,
    version = false,
    priority = 1000, -- make sure to load this before all the other start plugins
    main = "everforest",
    -- Optional; default configuration will be used if setup isn't called.
    opts ={ 
      background = "soft",
      },
    config = function(_, opts)
      require("everforest").setup(opts)
      vim.opt.background = "dark"
      vim.cmd([[colorscheme everforest]])
    end,


  },
}
