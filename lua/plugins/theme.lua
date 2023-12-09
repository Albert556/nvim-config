local M = {
  {
    'uloco/bluloco.nvim',
    lazy = false,
    priority = 1000,
    dependencies = { 'rktjmp/lush.nvim' },
    opt = {
      style = "auto",               -- "auto" | "dark" | "light"
      transparent = false,
      italics = false,
      terminal = vim.fn.has("gui_running") == 1, -- bluoco colors are enabled in gui terminals per default.
      guicursor   = true,
    },
  },
  {
    'sainnhe/everforest',
    lazy = false,
    priority = 1000,
  },
  {
    'projekt0n/github-nvim-theme',
    lazy = false, -- make sure we load this during startup if it is your main colorscheme
    priority = 1000, -- make sure to load this before all the other start plugins
    config = function()
      require('github-theme').setup({
        -- ...
      })

    end,
  },
}

return M
