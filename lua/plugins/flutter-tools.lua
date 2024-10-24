return {
  'nvim-flutter/flutter-tools.nvim',
  ft = 'dart',
  dependencies = {
    'nvim-lua/plenary.nvim',
    'stevearc/dressing.nvim', -- optional for vim.ui.select
    'nvim-telescope/telescope.nvim',
  },
  opts = {
    decorations = {
      device = true,
    },
    fvm = true,
  },
  config = function(_, opts)
    require('flutter-tools').setup(opts)

    require('telescope').load_extension('flutter')
  end,
}
