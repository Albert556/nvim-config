-- packer插件管理
-- This file can be loaded by calling `lua require('plugins')` from your init.vim
-- Only required if you have packer configured as `opt`

-- Automatically install packer
local fn = vim.fn
local install_path = fn.stdpath("data") .. "/site/pack/packer/start/packer.nvim"
if fn.empty(fn.glob(install_path)) > 0 then
    packer_bootstrap =
        fn.system({"git", "clone", "--depth", "1", "https://github.com/wbthomason/packer.nvim", install_path})
end

require("packer").startup(
    function()
        -- Packer can manage itself
        use("wbthomason/packer.nvim")

        -- theme
        use(
            {
                "catppuccin/nvim",
                -- 改个别名，因为它的名字是 nvim，可能会冲突
                as = "catppuccin",
                config = function()
                    -- 插件加载完成后自动运行 lua/conf/catppuccin.lua 文件中的代码
                end
            }
        )
        use({"arcticicestudio/nord-vim"})
        use(
            {
                "sonph/onehalf",
                rtp = "vim"
            }
        )
        use({"rakr/vim-one"})
        use({"drewtempelmeyer/palenight.vim"})

        -- edit
        -- 编辑器需要的窗口
        -- buffer设置
        use(
            {
                "akinsho/bufferline.nvim",
                tag = "v2.*",
                requires = "kyazdani42/nvim-web-devicons"
            }
        )

        -- 文件树
        use(
            {
                "kyazdani42/nvim-tree.lua",
                requires = {
                    "kyazdani42/nvim-web-devicons" -- optional, for file icon
                }
            }
        )

        -- use(
        --     {
        --         "Shougo/defx.nvim"
        --     }
        -- )

        -- 状态栏
        use ({"feline-nvim/feline.nvim",
            tag = 'v1.*',
        })

        -- outline
        use("simrat39/symbols-outline.nvim")

        -- git
        use(
            {
                "lewis6991/gitsigns.nvim"
                -- tag = 'release' -- To use the latest release
            }
        )

        -- 内置终端
        use({
            "akinsho/toggleterm.nvim",
            tag = 'v1.*',
        })

        -- 缩进
        use("lukas-reineke/indent-blankline.nvim")

        -- autopairs
        use("windwp/nvim-autopairs")

        -- 代码高亮
        use(
            {
                "nvim-treesitter/nvim-treesitter",
                run = ":TSUpdate",
                requires = {
                    "p00f/nvim-ts-rainbow", -- 彩虹括号
                    "andymass/vim-matchup",
                    "nvim-treesitter/nvim-treesitter-textobjects"
                }
            }
        )

        -- 代码注释
        use(
            {
                "numToStr/Comment.nvim",
                requires = {
                    "JoosepAlviste/nvim-ts-context-commentstring"
                }
            }
        )

        use({"mg979/vim-visual-multi"})

        -- AutoSave
        use("Pocco81/AutoSave.nvim")

        -- 代码格式化
        -- neoformat
        use("sbdchd/neoformat")

        -- 快捷操作
        -- vim-surround
        use("tpope/vim-surround")

        -- vim-easymotion
        use("easymotion/vim-easymotion")

        -- vim-sneak
        use("justinmk/vim-sneak")

        -- 快速搜索
        -- brew install ripgrep
        -- choco install ripgrep
        -- scoop
        -- linux repo
        use(
            {
                "nvim-telescope/telescope.nvim",
                requires = {
                    "nvim-lua/plenary.nvim",
                    "kyazdani42/nvim-web-devicons",
                    {
                        "nvim-telescope/telescope-fzf-native.nvim",
                        run = "make"
                    },
                    -- telescope-ui
                    "nvim-telescope/telescope-ui-select.nvim",
                    "nvim-telescope/telescope-live-grep-raw.nvim",
                    "BurntSushi/ripgrep" -- ripgrep
                }
            }
        )

        -- lsp
        use({"neovim/nvim-lspconfig"})

        -- lsp安装
        use({"williamboman/nvim-lsp-installer", "simrat39/rust-tools.nvim"})

        -- LSP UI 美化
        use(
            {
                "tami5/lspsaga.nvim"
            }
        )

        -- LSP 进度提示
        use(
            {
                "j-hui/fidget.nvim"
            }
        )

        -- 插入模式获得函数签名
        use(
            {
                "ray-x/lsp_signature.nvim"
            }
        )

        -- 灯泡显示提醒
        use("kosayoda/nvim-lightbulb")

        -- 自动代码补全系列插件
        use(
            {
                "hrsh7th/nvim-cmp", -- 代码补全核心插件，下面都是增强补全的体验插件
                requires = {
                    {"onsails/lspkind-nvim"}, -- 为补全添加类似 vscode 的图标
                    {"hrsh7th/vim-vsnip"}, -- vsnip 引擎，用于获得代码片段支持
                    {"hrsh7th/cmp-nvim-lsp"}, -- 替换内置 omnifunc，获得更多补全
                    {"hrsh7th/cmp-path"}, -- 路径补全
                    {"hrsh7th/cmp-buffer"}, -- 缓冲区补全
                    {"hrsh7th/cmp-cmdline"}, -- 命令补全
                    {"f3fora/cmp-spell"}, -- 拼写建议
                    {"rafamadriz/friendly-snippets"}, -- 提供多种语言的代码片段
                    {"lukas-reineke/cmp-under-comparator"} -- 让补全结果的排序更加智能
                    -- {"tzachr/cmp-tabnine", run = "./install.sh"} -- tabnine 源,提供基于 AI 的智能补全
                }
            }
        )

        -- null-ls
        use(
            {
                "jose-elias-alvarez/null-ls.nvim",
                require = {
                    "nvim-lua/plenary.nvim"
                }
            }
        )

        -- 代码调试基础插件
        use(
            {
                "mfussenegger/nvim-dap"
            }
        )

        -- 为代码调试提供内联文本
        use(
            {
                "theHamsta/nvim-dap-virtual-text",
                requires = {
                    "mfussenegger/nvim-dap"
                }
            }
        )

        -- 为代码调试提供 UI 界面
        use(
            {
                "rcarriga/nvim-dap-ui",
                requires = {
                    "mfussenegger/nvim-dap"
                }
            }
        )

        -- lua debug
        use({"jbyuki/one-small-step-for-vimkind"})

        -- which-key
        -- whichkey 显示key map
        -- z 折叠等功能
        -- z= 单词拼写建议
        -- " 显示寄存器，<c-r>插入模式显示，可以直接按键粘贴
        -- ' or ` 显示marks'
        use("folke/which-key.nvim")

        -- nvim-notify
        -- 弹窗
        use("rcarriga/nvim-notify")

        -- Automatically set up your configuration after cloning packer.nvim
        -- Put this at the end after all plugins
        if packer_bootstrap then
            require("packer").sync()
        end
    end
)
