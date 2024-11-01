return {
  'hrsh7th/nvim-cmp',
  dependencies = {
    'hrsh7th/cmp-nvim-lsp',
    'hrsh7th/cmp-buffer',
    'hrsh7th/cmp-path',
    'hrsh7th/cmp-cmdline',

    {
      'L3MON4D3/LuaSnip',
      build = (function()
        -- Build Step is needed for regex support in snippets.
        -- This step is not supported in many windows environments.
        -- Remove the below condition to re-enable on windows.
        if vim.fn.has('win32') == 1 or vim.fn.executable('make') == 0 then return end
        return 'make install_jsregexp'
      end)(),
      dependencies = {
        -- `friendly-snippets` contains a variety of premade snippets.
        --    See the README about individual language/framework/plugin snippets:
        --    https://github.com/rafamadriz/friendly-snippets
        {
          'rafamadriz/friendly-snippets',
          config = function() require('luasnip.loaders.from_vscode').lazy_load() end,
        },
      },
    },
    'saadparwaiz1/cmp_luasnip',
  },
  event = { 'InsertEnter', 'CmdlineEnter' },
  opts = function(_, opts)
    -- nvim-cmp setup
    local cmp = require('cmp')
    local luasnip = require('luasnip')

    local next_item = function(fallback)
      if cmp.visible() then
        cmp.select_next_item({ behavior = cmp.SelectBehavior.Select })
      elseif luasnip.locally_jumpable(1) then
        luasnip.jump(1)
      else
        fallback()
      end
    end

    local prev_item = function(fallback)
      if cmp.visible() then
        cmp.select_prev_item({ behavior = cmp.SelectBehavior.Select })
      elseif luasnip.locally_jumpable(-1) then
        luasnip.jump(-1)
      else
        fallback()
      end
    end

    -- 命令行补全不主动选择
    -- 补全没有选择时使用默认功能
    local cmdline_confirm = function(fallback)
      if not cmp.visible() then
        fallback()
        return
      end
      if not cmp.get_selected_index() then
        fallback()
        return
      end

      if luasnip.expandable() then
        luasnip.expand()
      else
        cmp.confirm({ select = true })
      end
    end

    -- 输入模式默认选择第一个
    local confirm = function(fallback)
      if not cmp.visible() then
        fallback()
        return
      end

      if luasnip.expandable() then
        luasnip.expand()
      else
        cmp.confirm({ select = true })
      end
    end

    local fb = function(fallback) fallback() end

    local scroll_up_docs = function(fallback)
      if cmp.visible_docs() then
        cmp.mapping.scroll_docs(-4)(fallback)
      else
        cmp.open_docs()
      end
    end

    local scroll_down_docs = function(fallback)
      if cmp.visible_docs() then
        cmp.mapping.scroll_docs(4)(fallback)
      else
        cmp.open_docs()
      end
    end

    return {
      luasnip = {},
      cmp = {
        global = {
          completion = {
            completeopt = 'menu,menuone,noinsert,popup',
          },
          snippet = {
            -- REQUIRED - you must specify a snippet engine
            expand = function(args)
              luasnip.lsp_expand(args.body) -- For `luasnip` users.
            end,
          },
          window = {
            -- completion = cmp.config.window.bordered(),
            -- documentation = cmp.config.window.bordered(),
          },
          mapping = {
            ['<C-n>'] = cmp.mapping({ i = next_item, s = next_item, c = next_item }),
            ['<C-p>'] = cmp.mapping({ i = prev_item, s = prev_item, c = prev_item }),
            -- Scroll the documentation window [b]ack / [f]orward
            ['<C-u>'] = scroll_up_docs,
            ['<C-d>'] = scroll_down_docs,
            ['<CR>'] = cmp.mapping({ i = confirm, s = confirm, c = fb }),
            ['<Tab>'] = cmp.mapping({ i = confirm, s = confirm, c = cmdline_confirm }),

            -- For more advanced Luasnip keymaps (e.g. selecting choice nodes, expansion) see:
            --    https://github.com/L3MON4D3/LuaSnip?tab=readme-ov-file#keymaps
          },
          sources = cmp.config.sources({ opts.sources }, {
            { name = 'nvim_lsp' },
            { name = 'luasnip' }, -- For luasnip users.
          }, {
            { name = 'buffer' },
            { name = 'path' },
          }),
        },
        -- Use buffer source for `/` and `?` (if you enabled `native_menu`, this won't work anymore).
        cmdline = {
          slash_question_mark = {
            sources = {
              { name = 'buffer' },
            },
          },
          -- Use cmdline & path source for ':' (if you enabled `native_menu`, this won't work anymore).
          colon = {
            completion = {
              completeopt = 'menu,menuone,noinsert,noselect,popup',
            },
            sources = cmp.config.sources({
              { name = 'path', option = {
                trailing_slash = true,
              } },
            }, {
              { name = 'cmdline' },
            }),
            matching = { disallow_symbol_nonprefix_matching = false },
          },
        },
      },
    }
  end,
  config = function(_, opts)
    local cmp = require('cmp')
    local luasnip = require('luasnip')
    luasnip.config.setup(opts.luasnip)

    cmp.setup(opts.cmp.global)

    -- Use buffer source for `/` and `?` (if you enabled `native_menu`, this won't work anymore).
    cmp.setup.cmdline({ '/', '?' }, opts.cmp.cmdline.slash_question_mark)

    -- Use cmdline & path source for ':' (if you enabled `native_menu`, this won't work anymore).
    cmp.setup.cmdline(':', opts.cmp.cmdline.colon)
  end,
}
