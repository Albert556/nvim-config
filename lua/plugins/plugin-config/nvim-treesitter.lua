-- https://github.com/nvim-treesitter/nvim-treesitter
-- https://github.com/p00f/nvim-ts-rainbow

local treesitter = require("nvim-treesitter.configs")

treesitter.setup(
    {
        -- 安装 language parser
        -- :TSInstallInfo 命令查看支持的语言
        ensure_installed = {
            "c",
            "c_sharp",
            "cmake",
            "cpp",
            "dart",
            "dockerfile",
            "go",
            "java",
            "javascript",
            "json",
            "json5",
            "llvm",
            "lua",
            "make",
            "python",
            "rust",
            "toml",
            "vue",
            "yaml"
        },
        -- 同步下载高亮支持
        sync_install = false,
        ignore_install = {},
        autopairs = {
            enable = true
        },
        -- 启用代码高亮功能
        highlight = {
            enable = true,
            -- 使用 treesitter 高亮而不是 neovim 内置的高亮
            disable = {""},
            additional_vim_regex_highlighting = true
        },
        -- 根据当前上下文定义文件类型，由 nvim-ts-context-commentstring 插件提供
        context_commentstring = {
            enable = true,
            enable_autocmd = false,
            config = {
                -- Languages that have a single comment style
                typescript = "// %s",
                css = "/* %s */",
                scss = "/* %s */",
                html = "<!-- %s -->",
                svelte = "<!-- %s -->",
                vue = "<!-- %s -->",
                json = ""
            }
        },
        -- 启用增量选择
        incremental_selection = {
            enable = true,
            keymaps = {
                init_selection = "<CR>",
                node_incremental = "<CR>",
                node_decremental = "<BS>",
                scope_incremental = "<TAB>"
            }
        },
        -- 启用基于Treesitter的代码格式化(=) . NOTE: This is an experimental feature.
        indent = {
            enable = true
        },
        -- rainbow
        rainbow = {
            enable = true,
            -- disable = { "jsx", "cpp" }, list of languages you want to disable the plugin for
            extended_mode = true, -- Also highlight non-bracket delimiters like html tags, boolean or table: lang -> boolean
            max_file_lines = nil -- Do not enable for files with more than n lines, int
            -- colors = {}, -- table of hex strings
            -- termcolors = {} -- table of colour name strings
        },
        -- textobjects extension settings
        -- https://github.com/nvim-treesitter/nvim-treesitter-textobjects
        textobjects = {
            select = {
                enable = true,
                -- Automatically jump forward to textobj, similar to targets.vim
                lookahead = true,
                keymaps = {
                    -- You can use the capture groups defined in textobjects.scm
                    ["af"] = "@function.outer",
                    ["if"] = "@function.inner",
                    ["ac"] = "@class.outer",
                    ["ic"] = "@class.inner"
                }
            },
            swap = {
                enable = true,
                swap_next = {
                    ["<leader>a"] = "@parameter.inner"
                },
                swap_previous = {
                    ["<leader>A"] = "@parameter.inner"
                }
            },
            move = {
                enable = true,
                set_jumps = true, -- whether to set jumps in the jumplist
                goto_next_start = {
                    ["]m"] = "@function.outer",
                    ["]]"] = "@class.outer"
                },
                goto_next_end = {
                    ["]M"] = "@function.outer",
                    ["]["] = "@class.outer"
                },
                goto_previous_start = {
                    ["[m"] = "@function.outer",
                    ["[["] = "@class.outer"
                },
                goto_previous_end = {
                    ["[M"] = "@function.outer",
                    ["[]"] = "@class.outer"
                }
            },
            lsp_interop = {
                enable = true,
                border = "none",
                peek_definition_code = {
                    ["<leader>df"] = "@function.outer",
                    ["<leader>dF"] = "@class.outer"
                }
            }
        },
        -- matchup plugins
        -- https://github.com/andymass/vim-matchup       },
        matchup = {
            enable = true -- mandatory, false will disable the whole extension
            -- disable = { "c", "ruby" },  -- optional, list of language that will be disabled
        }
    }
)
-- 开启 Folding
vim.wo.foldmethod = "expr"
vim.wo.foldexpr = "nvim_treesitter#foldexpr()"
-- 默认不要折叠
-- https://stackoverflow.com/questions/8316139/how-to-set-the-default-to-unfolded-when-you-open-a-file
vim.wo.foldlevel = 99
