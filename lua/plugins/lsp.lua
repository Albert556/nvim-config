return {
  {
    "neovim/nvim-lspconfig",
    event = vim.g.userevent,
    dependencies = {
      { "williamboman/mason-lspconfig.nvim" },
      {
        'hrsh7th/nvim-cmp',
        'L3MON4D3/LuaSnip',
        'saadparwaiz1/cmp_luasnip',
      },
    },
    opts = {
    },
    config = function(_, opts)
      -- load mason-lspconfig
      require("mason-lspconfig").setup()

      -- Add additional capabilities supported by nvim-cmp
      local capabilities = require("cmp_nvim_lsp").default_capabilities()

      require("lspconfig").lua_ls.setup {
        on_attach = vim.g.lsp_on_attach,
        capabilities = capabilities,
      }

      local lsp_util = vim.lsp.util

      -- Code Action
      local code_action_listener = function()
        local context = { diagnostics = vim.lsp.diagnostic.get_line_diagnostics() }
        local params = lsp_util.make_range_params()
        params.context = context
        vim.lsp.buf_request(0, 'textDocument/codeAction', params, function(err, result, ctx, config)
          -- do something with result - e.g. check if empty and show some indication such as a sign
        end)
      end

      vim.api.nvim_create_autocmd({ "CursorHold", "CursorHoldI" }, {
        group = vim.api.nvim_create_augroup("code_action_sign", { clear = true }),
        callback = function()
          code_action_listener()
        end,
      })
    end,
  },
  {
    "williamboman/mason.nvim",
    cmd = { "Mason", "MasonInstall", "MasonLog", "MasonUninstall", "MasonUninstallAll", "MasonUpdata" },
    opts = {},
  },
  {
    "williamboman/mason-lspconfig.nvim",
    opts = {},
  },
  {
    'hrsh7th/nvim-cmp',
    dependencies = {
      'hrsh7th/cmp-nvim-lsp',
      'hrsh7th/cmp-buffer',
      'hrsh7th/cmp-path',
      'hrsh7th/cmp-cmdline',
      'hrsh7th/nvim-cmp',
      'L3MON4D3/LuaSnip',
      'saadparwaiz1/cmp_luasnip',
    },
    main = "cmp",
    opts = function()
      -- nvim-cmp setup
      local cmp = require 'cmp'
      return {
        snippet = {
          -- REQUIRED - you must specify a snippet engine
          expand = function(args)
            require('luasnip').lsp_expand(args.body) -- For `luasnip` users.
          end,
        },
        window = {
          -- completion = cmp.config.window.bordered(),
          -- documentation = cmp.config.window.bordered(),
        },
        mapping = cmp.mapping.preset.insert({
          ['<C-b>'] = cmp.mapping.scroll_docs(-4),
          ['<C-f>'] = cmp.mapping.scroll_docs(4),
          ['<C-e>'] = cmp.mapping.abort(),
          ['<CR>'] = cmp.mapping.confirm({ select = false }), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
        }),
        sources = cmp.config.sources({
          { name = 'nvim_lsp' },
          { name = 'luasnip' },
        }, {
          { name = 'buffer' },
        })
      }
    end,
  },
  {

  },
}
