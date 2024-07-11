return {
  {
    'numToStr/Comment.nvim',
    event = vim.g.userevent,
    opts = {
      pre_hook = function()
        return vim.bo.commentstring
      end,
    },
  },
   {
    'JoosepAlviste/nvim-ts-context-commentstring',
    event = "VeryLazy",
  }
}
