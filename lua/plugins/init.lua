-- 优先加载packer，未安装会自动安装packer
-- require('plugins/plugin-config/packer')
-- Automatically install packer
local fn = vim.fn
local install_path = fn.stdpath("data") .. "/site/pack/packer/start/packer.nvim"
if fn.empty(fn.glob(install_path)) > 0 then
    packer_bootstrap = fn.system({ "git", "clone", "--depth", "1", "https://github.com/wbthomason/packer.nvim", install_path })
end

vim.cmd([[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins.lua source <afile> | PackerCompile
  augroup end
]])


-- packer插件管理
-- This file can be loaded by calling `lua require('plugins')` from your init.vim
-- Only required if you have packer configured as `opt`

require("packer").startup(
    function()
        -- Packer can manage itself
        use("wbthomason/packer.nvim")

    -- theme
    use({
        "catppuccin/nvim",
        as = "catppuccin",
        config = function()
            require("plugins/plugin-config/theme")
        end
    })

    -- edit
    -- 编辑器需要的窗口
    -- buffer设置
    use(
        {
        "akinsho/bufferline.nvim",
        tag = "v2.*",
        requires = "kyazdani42/nvim-web-devicons",
        config = function()
            require("plugins/plugin-config/bufferline")
        end
    }
    )

    -- 文件树
    use(
        {
        "kyazdani42/nvim-tree.lua",
        requires = {
            "kyazdani42/nvim-web-devicons" -- optional, for file icon
        },
        config = function()
            require("plugins/plugin-config/nvim-tree")
        end
    }
    )

    -- 状态栏
    use(
        {
        "feline-nvim/feline.nvim",
        tag = "v1.*",
        config = function()
            require("plugins/plugin-config/feline")
        end
    }
    )

    -- outline
    use({"simrat39/symbols-outline.nvim",
        config = function()
            require("plugins/plugin-config/symbols-outline")
        end
    })

    -- git
    use(
        {
        "lewis6991/gitsigns.nvim",
        -- tag = 'release', -- To use the latest release
        config = function()
            require("plugins/plugin-config/gitsigns")
        end
    }
    )

    -- 内置终端
    use(
        {
        "akinsho/toggleterm.nvim",
        tag = "v1.*",
        config = function()
            require("plugins/plugin-config/toggleterm")
        end
    }
    )

    -- 缩进
    use({"lukas-reineke/indent-blankline.nvim",
        config = function()
            require("plugins/plugin-config/indent-blankline")
        end})

    -- autopairs
    use({"windwp/nvim-autopairs",
        config = function()
            require("plugins/plugin-config/nvim-autopairs")
        end})

    -- 代码高亮
    use(
        {
        "nvim-treesitter/nvim-treesitter",
            run = ":TSUpdate",
        requires = {
            "p00f/nvim-ts-rainbow", -- 彩虹括号
            "andymass/vim-matchup",
            "nvim-treesitter/nvim-treesitter-textobjects",
            "JoosepAlviste/nvim-ts-context-commentstring"
        },
        config = function()
            require("plugins/plugin-config/nvim-treesitter")
        end
    }
    )

    use({ "yamatsum/nvim-cursorline" ,
        config = function()
            require("plugins/plugin-config/nvim-cursorline")
        end})

    -- 代码注释
    use({ "b3nj5m1n/kommentary" ,
        config = function()
            require("plugins/plugin-config/kommentary")
        end})

    -- 显示光标所在函数或代码块
    use({ "nvim-treesitter/nvim-treesitter-context" ,
        config = function()
            -- require("plugins/plugin-config/nvim-treesitter-context")
        end})

    -- AutoSave
    use(
        {
        "Pocco81/AutoSave.nvim",
        config = function()
            require("plugins/plugin-config/autosave")
        end
    }
    )

    -- 快捷操作
    -- hop
    use(
        {
        "phaazon/hop.nvim",
        branch = "v1", -- optional but strongly recommended,
        config = function()
            require("plugins/plugin-config/hop")
        end
    }
    )
    -- lightspeed
    use({ "ggandor/lightspeed.nvim" ,
        config = function()
            require("plugins/plugin-config/lightspeed")
        end})
    -- surround
    use({"ur4ltz/surround.nvim",
        config = function()
            require("plugins/plugin-config/surround")
        end})

    -- 快速搜索
    -- brew install ripgrep
    -- choco install ripgrep
    -- scoop
    -- linux repo
    use(
        {
        "nvim-telescope/telescope.nvim",
        requires = {
            { "nvim-lua/plenary.nvim" },
            "kyazdani42/nvim-web-devicons",
            {
                "nvim-telescope/telescope-fzf-native.nvim",
                -- run = "cmake -S. -Bbuild -DCMAKE_BUILD_TYPE=Release && cmake --build build --config Release && cmake --install build --prefix build"
                run = "make"
            },
            -- telescope-ui
            "nvim-telescope/telescope-ui-select.nvim",
            "nvim-telescope/telescope-live-grep-raw.nvim",
            "BurntSushi/ripgrep" -- ripgrep
        },
        config = function()
            require("plugins/plugin-config/telescope")
        end
    }
    )

    -- lsp
    use({ "neovim/nvim-lspconfig" ,
        after = "nvim-lsp-installer",
        config = function()
            require("plugins/plugin-config/nvim-lspconfig")
        end})

    -- lsp安装
    use({ "williamboman/nvim-lsp-installer",
        requires={
            "simrat39/rust-tools.nvim" ,
        },
        config = function()
            require("plugins/plugin-config/nvim-lsp-installer")
        end})

    -- LSP UI 美化
    use(
        {
        "tami5/lspsaga.nvim",
        config = function()
            require("plugins/plugin-config/lspsaga")
        end
    }
    )

    -- LSP 进度提示
    use(
        {
        "j-hui/fidget.nvim",
        config = function()
            require("plugins/plugin-config/fidget")
        end
    }
    )

    -- 插入模式获得函数签名
    use(
        {
        "ray-x/lsp_signature.nvim",
        config = function()
            require("plugins/plugin-config/lsp_signature")
        end
    }
    )

    -- 自动代码补全系列插件
    use(
        {
        "hrsh7th/nvim-cmp", -- 代码补全核心插件，下面都是增强补全的体验插件
        requires = {
            { "onsails/lspkind-nvim" }, -- 为补全添加类似 vscode 的图标
            { "hrsh7th/vim-vsnip" }, -- vsnip 引擎，用于获得代码片段支持
            { "hrsh7th/cmp-nvim-lsp" }, -- 替换内置 omnifunc，获得更多补全
            { "hrsh7th/cmp-path" }, -- 路径补全
            { "hrsh7th/cmp-buffer" }, -- 缓冲区补全
            { "hrsh7th/cmp-cmdline" }, -- 命令补全
            { "f3fora/cmp-spell" }, -- 拼写建议
            { "rafamadriz/friendly-snippets" }, -- 提供多种语言的代码片段
            { "lukas-reineke/cmp-under-comparator" } -- 让补全结果的排序更加智能
            -- {"tzachr/cmp-tabnine", run = "./install.sh"} -- tabnine 源,提供基于 AI 的智能补全
        },
        config = function()
            require("plugins/plugin-config/nvim-cmp")
        end
    }
    )

    -- null-ls
    -- use(
    --     {
    --     "jose-elias-alvarez/null-ls.nvim",
    --           require = {
    --         "nvim-lua/plenary.nvim"
    --     },
    --     after = "nvim-lsp-installer",
    --     config = function()
    --         require("plugins/plugin-config/null-ls")
    --     end
    -- }
    -- )

    -- 代码调试基础插件
    -- use(
    --     {
    --     "mfussenegger/nvim-dap",
    --     config = function()
    --         require("plugins/plugin-config/nvim-dap")
    --     end
    -- }
    -- )

    -- 为代码调试提供内联文本
    -- use(
    --     {
    --     "theHamsta/nvim-dap-virtual-text",
    --     requires = {
    --         "mfussenegger/nvim-dap"
    --     },
    --     config = function()
    --         -- require("plugins/plugin-config/feline")
    --     end
    -- }
    -- )

    -- 为代码调试提供 UI 界面
    -- use(
    --     {
    --     "rcarriga/nvim-dap-ui",
    --     requires = {
    --         "mfussenegger/nvim-dap"
    --     },
    --     config = function()
    --         require("plugins/plugin-config/feline")
    --     end
    -- }
    -- )

    -- which-key
    -- whichkey 显示key map
    -- z 折叠等功能
    -- z= 单词拼写建议
    -- " 显示寄存器，<c-r>插入模式显示，可以直接按键粘贴
    -- ' or ` 显示marks'
    use({"folke/which-key.nvim",
        config = function()
            require("plugins/plugin-config/which-key")
        end})

    -- nvim-notify
    -- 弹窗
    use({"rcarriga/nvim-notify",
        config = function()
                require("plugins/plugin-config/nvim-notify")
            end})

    -- Automatically set up your configuration after cloning packer.nvim
    -- Put this at the end after all plugins
    if packer_bootstrap then
        require("packer").sync()
    end
end
)

