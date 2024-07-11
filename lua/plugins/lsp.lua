return {
  {
    "neovim/nvim-lspconfig",
    event = vim.g.userevent,
    dependencies = {
      "mason.nvim",
      { "williamboman/mason-lspconfig.nvim" },
    },
    opts = {
    },
    config = function(_, opts)
      require("lspconfig").lua_ls.setup {
        on_attach = vim.g.lsp_on_attach,
      }
    end,
  },
  {
   "williamboman/mason.nvim",
    opts = {},
  },
  {
    "williamboman/mason-lspconfig.nvim",
    opts = {
      ensure_installed = {
        "clangd",
        "codelldb",
        "gopls",
        "lua-language-server",
        "rust-analyzer",
        "shellcheck",
        "shfmt",
      },
    },
  },
}
