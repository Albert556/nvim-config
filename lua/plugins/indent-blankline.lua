return {
  "lukas-reineke/indent-blankline.nvim",
  event = vim.g.userevent,
  main = "ibl",
  opts = {
    indent = { char = "│" },
    scope = { char = "│" },
    exclude = {
      buftypes = {
        "nofile",
        "prompt",
        "quickfix",
        "terminal",
      },
      filetypes = {
        "NvimTree",
        "Trouble",
        "Trouble",
        "aerial",
        "alpha",
        "dashboard",
        "help",
        "lazy",
        "lazyterm",
        "mason",
        "neo-tree",
        "neogitstatus",
        "notify",
        "startify",
        "toggleterm",
        "trouble",
      },
    },
  }
}
