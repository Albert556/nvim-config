-- https://github.com/hrsh7th/nvim-cmp
-- https://github.com/hrsh7th/vim-vsnip
-- https://github.com/hrsh7th/cmp-vsnip
-- https://github.com/hrsh7th/cmp-nvim-lsp
-- https://github.com/hrsh7th/cmp-path
-- https://github.com/hrsh7th/cmp-buffer
                    -- https://github.com/hrsh7th/cmp-cmdline
-- https://github.com/f3fora/cmp-spell
-- https://github.com/rafamadriz/friendly-snippets
-- https://github.com/lukas-reineke/cmp-under-comparator
-- https://github.com/tzachar/cmp-tabnine

-- FIX: tabline 在某些计算机上有 1 个 BUG
-- 当出现：
--    TabNine is not executable
-- 等字样时，需要手动执行（仅限 Manjaro）：
--    rm ~/.local/share/nvim/plugged/cmp-tabnine/binaries
--    ~/.local/share/nvim/plugged/cmp-tabnine/install.sh

local lspkind = require("lspkind")

local cmp = require("cmp")

cmp.setup(
    {
        formatting = {
            format = lspkind.cmp_format(
                {
                    mode = "symbol", -- show only symbol annotations
                    with_text = true,
                    maxwidth = 50, -- prevent the popup from showing more than provided characters (e.g 50 will not show more than 50 characters)
                    -- The function below will be called before any actual modifications from lspkind
                    -- so that you can provide more controls on popup customization. (See [#30](https://github.com/onsails/lspkind-nvim/pull/30))
                    before = function(entry, vim_item)
                        -- Source 显示提示来源
                        vim_item.menu = "[" .. string.upper(entry.source.name) .. "]"
                        return vim_item
                    end
                }
            )
        },
        snippet = {
            -- REQUIRED - you must specify a snippet engine
            expand = function(args)
                vim.fn["vsnip#anonymous"](args.body) -- For `vsnip` users.
                -- require('luasnip').lsp_expand(args.body) -- For `luasnip` users.
                -- require('snippy').expand_snippet(args.body) -- For `snippy` users.
                -- vim.fn["UltiSnips#Anon"](args.body) -- For `ultisnips` users.
            end
        },
        -- 对补全建议排序
        sorting = {
            comparators = {
                cmp.config.compare.offset,
                cmp.config.compare.exact,
                cmp.config.compare.score,
                cmp.config.compare.recently_used,
                require("cmp-under-comparator").under,
                -- require("cmp_tabnine.compare"),
                cmp.config.compare.kind,
                cmp.config.compare.sort_text,
                cmp.config.compare.length,
                cmp.config.compare.order
            }
        },
        mapping = {
            -- 上一个
            ["<UP>"] = cmp.mapping.select_prev_item(),
            -- 下一个
            ["<DOWN>"] = cmp.mapping.select_next_item(),
            ["<C-b>"] = cmp.mapping(cmp.mapping.scroll_docs(-4), {"i", "c"}),
            ["<C-f>"] = cmp.mapping(cmp.mapping.scroll_docs(4), {"i", "c"}),
            ["<C-Space>"] = cmp.mapping(cmp.mapping.complete(), {"i", "c"}),
            ["<C-y>"] = cmp.config.disable, -- Specify `cmp.config.disable` if you want to remove the default `<C-y>` mapping.
            ["<C-e>"] = cmp.mapping(
                {
                    i = cmp.mapping.abort(),
                    c = cmp.mapping.close()
                }
            ),
            ["<CR>"] = cmp.mapping.confirm(
                {
                    select = true
                }
            ), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
            -- 类似于 IDEA 的功能，如果没进入选择框，tab
            -- 会选择下一个，如果进入了选择框，tab 会确认当前选择
            ["<Tab>"] = cmp.mapping(
                function(fallback)
                    if cmp.visible() then
                        local entry = cmp.get_selected_entry()
                        if not entry then
                            cmp.select_next_item({behavior = cmp.SelectBehavior.Select})
                        end
                        cmp.confirm()
                    else
                        fallback()
                    end
                end,
                {"i", "s"}
            ),
            ["<S-Tab>"] = cmp.mapping(
                function(fallback)
                    if cmp.visible() then
                        cmp.select_prev_item()
                    else
                        fallback()
                    end
                end,
                {"i", "s"}
            )
        },
        sources = cmp.config.sources(
            {
                {name = "nvim_lsp"},
                {name = "vsnip"}, -- For vsnip users.
                -- { name = 'luasnip' }, -- For luasnip users.
                -- { name = 'ultisnips' }, -- For ultisnips users.
                -- { name = 'snippy' }, -- For snippy users.
                {name = "cmdline"},
                {name = "spell"},
                {name = "buffer"},
                {name = "path"}
            }
        ),
        confirm_opts = {
            behavior = cmp.ConfirmBehavior.Replace,
            select = false
        },
        experimental = {
            ghost_text = false,
            native_menu = false
        }
    }
)

-- Set configuration for specific filetype.
cmp.setup.filetype(
    "gitcommit",
    {
        sources = cmp.config.sources(
            {
                {
                    name = "cmp_git"
                } -- You can specify the `cmp_git` source if you were installed it.
            },
            {
                {
                    name = "buffer"
                }
            }
        )
    }
)

-- Use buffer source for `/` (if you enabled `native_menu`, this won't work anymore).
cmp.setup.cmdline(
    "/",
    {
        mapping = cmp.mapping.preset.cmdline(),
        sources = {
            {
                name = "buffer"
            }
        }
    }
)

-- Use cmdline & path source for ':' (if you enabled `native_menu`, this won't work anymore).
cmp.setup.cmdline(
    ":",
    {
        mapping = cmp.mapping.preset.cmdline(),
        sources = cmp.config.sources(
            {
                {
                    name = "path"
                }
            },
            {
                {
                    name = "cmdline"
                }
            }
        )
    }
)
