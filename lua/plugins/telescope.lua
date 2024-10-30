return {
  'nvim-telescope/telescope.nvim',
  branch = '0.1.x',
  dependencies = {
    'nvim-lua/plenary.nvim',
    { -- If encountering errors, see telescope-fzf-native README for installation instructions
      'nvim-telescope/telescope-fzf-native.nvim',

      -- `build` is used to run some command when the plugin is installed/updated.
      -- This is only run then, not every time Neovim starts up.
      build = 'make',

      -- `cond` is a condition used to determine whether this plugin should be
      -- installed and loaded.
      cond = function() return vim.fn.executable('make') == 1 end,
    },
    { 'nvim-telescope/telescope-ui-select.nvim' },

    -- Useful for getting pretty icons, but requires a Nerd Font.
    { 'nvim-tree/nvim-web-devicons' },
  },
  cmd = 'Telescope',
  keys = {
    {
      '<leader>,',
      '<cmd>Telescope buffers sort_mru=true sort_lastused=true<cr>',
      desc = 'Switch Buffer',
    },
    { '<leader>/', '<cmd>Telescope current_buffer_fuzzy_find<cr>', desc = 'Search' },
    { '<leader>f/', '<cmd>Telescope live_grep<cr>', desc = 'Search Workspace' },
    { '<leader>f:', '<cmd>Telescope command_history<cr>', desc = 'Command History' },
    { '<leader>.', '<cmd>Telescope builtin<cr>', desc = 'Builtin' },
    { '<leader>:', '<cmd>Telescope commands<cr>', desc = 'Commands' },
    { '<leader>ff', '<cmd>Telescope find_files<cr>', desc = 'Find Files' },
    { '<leader>f"', '<cmd>Telescope registers<cr>', desc = 'Registers' },
    { '<leader>fd', '<cmd>Telescope diagnostics bufnr=0<cr>', desc = 'Document Diagnostics' },
    { '<leader>fD', '<cmd>Telescope diagnostics<cr>', desc = 'Workspace Diagnostics' },
    { '<leader>fj', '<cmd>Telescope jumplist<cr>', desc = 'Jumplist' },
    { '<leader>fl', '<cmd>Telescope loclist<cr>', desc = 'Location List' },
    { '<leader>fm', '<cmd>Telescope marks<cr>', desc = 'Jump to Mark' },
    { '<leader>fq', '<cmd>Telescope quickfix<cr>', desc = 'Quickfix List' },
    -- git
    { '<leader>gc', '<cmd>Telescope git_commits<CR>', desc = 'Git Commits' },
    { '<leader>gs', '<cmd>Telescope git_status<CR>', desc = 'Git Status' },
    { '<leader>gb', '<cmd>Telescope git_branches<CR>', desc = 'Git Branches' },
  },
  opts = {
    defaults = {
      prompt_prefix = '   ',
      selection_caret = ' ',
      entry_prefix = ' ',
      sorting_strategy = 'ascending',
      layout_strategy = 'vertical',
      layout_config = {
        horizontal = {
          prompt_position = 'top',
          preview_width = 0.55,
        },
        vertical = {
          prompt_position = 'top',
          preview_width = 0.55,
        },
        width = function(_, cols, _) return cols end,
        height = function(_, _, rows) return rows end,
      },
      mappings = {

        n = { ['q'] = require('telescope.actions').close },
      },
    },

    extensions_list = { 'themes', 'terms' },
    extensions = {
      ['ui-select'] = {
        require('telescope.themes').get_dropdown(),
      },
      fzf = {
        fuzzy = true, -- false will only do exact matching
        override_generic_sorter = true, -- override the generic sorter
        override_file_sorter = true, -- override the file sorter
        case_mode = 'smart_case', -- or "ignore_case" or "respect_case"
        -- the default case_mode is "smart_case"
      },
    },
  },
  config = function(_, opts)
    local telescope = require('telescope')
    telescope.setup(opts)
    telescope.load_extension('fzf')
    telescope.load_extension('ui-select')
  end,
}
