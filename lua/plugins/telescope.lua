return {
'nvim-telescope/telescope.nvim', tag = '0.1.8',
  dependencies = { 
    'nvim-lua/plenary.nvim',
    { 
      'nvim-telescope/telescope-fzf-native.nvim',
      build = 'cmake -S. -Bbuild -DCMAKE_BUILD_TYPE=Release && cmake --build build --config Release' ,
    }, 
  },
  cmd = "Telescope",
  keys = {
    {
      "<leader>,",
      "<cmd>Telescope buffers sort_mru=true sort_lastused=true<cr>",
      desc = "Switch Buffer",
    },
    { "<leader>/", "<cmd>Telescope current_buffer_fuzzy_find<cr>", desc = "Search" },
    { "<leader>f/", "<cmd>Telescope live_grep<cr>", desc = "Search Workspace" },
    { "<leader>f:", "<cmd>Telescope command_history<cr>", desc = "Command History" },
    { "<leader>:", "<cmd>Telescope commands<cr>", desc = "Commands" },
    { "<leader>fb", "<cmd>Telescope buffers sort_mru=true sort_lastused=true<cr>", desc = "Buffers" },
    { "<leader>fg", "<cmd>Telescope git_files<cr>", desc = "Find Files (git-files)" },
    { '<leader>f"', "<cmd>Telescope registers<cr>", desc = "Registers" },
    { "<leader>fd", "<cmd>Telescope diagnostics bufnr=0<cr>", desc = "Document Diagnostics" },
    { "<leader>fD", "<cmd>Telescope diagnostics<cr>", desc = "Workspace Diagnostics" },
    { "<leader>fj", "<cmd>Telescope jumplist<cr>", desc = "Jumplist" },
    { "<leader>fl", "<cmd>Telescope loclist<cr>", desc = "Location List" },
    { "<leader>fm", "<cmd>Telescope marks<cr>", desc = "Jump to Mark" },
    { "<leader>fq", "<cmd>Telescope quickfix<cr>", desc = "Quickfix List" },
    -- git 
    { "<leader>gc", "<cmd>Telescope git_commits<CR>", desc = "Commits" },
    { "<leader>gs", "<cmd>Telescope git_status<CR>", desc = "Status" },
    { "<leader>gb", "<cmd>Telescope git_branches<CR>", desc = "Status" },

  },
  opts = {
    extensions = {
      fzf = {
        fuzzy = true,                    -- false will only do exact matching
        override_generic_sorter = true,  -- override the generic sorter
        override_file_sorter = true,     -- override the file sorter
        case_mode = "smart_case",        -- or "ignore_case" or "respect_case"
                                         -- the default case_mode is "smart_case"
      }
    }
  },
  config = function(_, opts)
    local telescope = require('telescope')
    telescope.load_extension('fzf')
  end,
}

