return {
  'akinsho/bufferline.nvim',
  version = "*",
  dependencies = 'nvim-tree/nvim-web-devicons',
  event = "VeryLazy",
  keys = {
    { "<leader>bp",  "<Cmd>BufferLinePick<CR>",                 desc = "Pick Buffer" },
    { "<leader>bP",  "<Cmd>BufferLineTogglePin<CR>",            desc = "Toggle Pin" },
    { "<leader>bgc", "<Cmd>BufferLineGroupClose ungrouped<CR>", desc = "Delete Non-Pinned Buffers" },
    { "<leader>boc", "<Cmd>BufferLineCloseOthers<CR>",          desc = "Delete Other Buffers" },
    { "<leader>brc", "<Cmd>BufferLineCloseRight<CR>",           desc = "Delete Buffers to the Right" },
    { "<leader>blc", "<Cmd>BufferLineCloseLeft<CR>",            desc = "Delete Buffers to the Left" },
    { "<S-h>",       "<cmd>BufferLineCyclePrev<cr>",            desc = "Prev Buffer" },
    { "<S-l>",       "<cmd>BufferLineCycleNext<cr>",            desc = "Next Buffer" },
    { "[b",          "<cmd>BufferLineCyclePrev<cr>",            desc = "Prev Buffer" },
    { "]b",          "<cmd>BufferLineCycleNext<cr>",            desc = "Next Buffer" },
    { "[B",          "<cmd>BufferLineMovePrev<cr>",             desc = "Move buffer prev" },
    { "]B",          "<cmd>BufferLineMoveNext<cr>",             desc = "Move buffer next" },
  },
  opts = {
    options = {
      indicator = {
        style = 'underline',
      },
      diagnostics = "nvim_lsp",
      offsets = {
        {
          filetype = "neo-tree",
          text = "Neo-tree",
          highlight = "Directory",
          text_align = "left",
        },
      },
      always_show_bufferline = true,
      auto_toggle_bufferline = true,
    },
  },
}
