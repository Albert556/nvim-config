return {
  {
    'sainnhe/gruvbox-material',
    lazy = false,
    priority = 1000,
    config = function()
      -- Optionally configure and load the colorscheme
      -- directly inside the plugin declaration.
      vim.g.gruvbox_material_enable_italic = true
      vim.cmd.colorscheme('gruvbox-material')
    end,
  },
  {
    'rcarriga/nvim-notify',
    event = 'VeryLazy',
    opts = {},
    config = function(_, opts)
      local notify = require('notify')
      notify.setup(opts)
      vim.notify = notify
    end,
  },
}
