-- TODO: 增加额外插件的额检查
local configFile = {
    -- 加载autosave
    ["plugins/plugin-config/autosave"] = {
        enable = true,
        models = {"autosave"}
    },
    -- 加载bufferline配置
    ["plugins/plugin-config/bufferline"] = {
        enable = true,
        models = {"bufferline"}
    },
    -- 加载comment
    ["plugins/plugin-config/comment"] = {
        enable = true,
        models = {"ts_context_commentstring", "Comment"}
    },
    -- 加载feline
    ["plugins/plugin-config/feline"] = {
        enable = true,
        models = {"feline"}
    },
    -- 加载fidget
    ["plugins/plugin-config/fidget"] = {
        enable = true,
        models = {"fidget"}
    },
    -- 加载gitsigns
    ["plugins/plugin-config/gitsigns"] = {
        enable = true,
        models = {"gitsigns"}
    },
    -- 加载indent-blankline
    ["plugins/plugin-config/indent-blankline"] = {
        enable = true,
        models = {"indent_blankline"}
    },
    -- 加载 lsp_signature
    ["plugins/plugin-config/lsp_signature"] = {
        enable = true,
        models = {"lsp_signature"}
    },
    -- 加载 lspsaga
    ["plugins/plugin-config/lspsaga"] = {
        enable = true,
        models = {"lspsaga"}
    },
    -- 加载 null-ls
    ["plugins/plugin-config/null-ls"] = {
        enable = false,
        models = {"null-ls"}
    },

    -- 加载nvim-autopairs
    ["plugins/plugin-config/nvim-autopairs"] = {
        enable = true,
        models = {"nvim-autopairs"}
    },
    -- 加载补全
    ["plugins/plugin-config/nvim-cmp"] = {
        enable = true,
        models = {"lspkind", "cmp"}
    },
    -- 代码调试
    ["plugins/plugin-config/nvim-dap"] = {
        enable = true,
        models = {"dap", "dapui", "nvim-dap-virtual-text"}
    },
    -- 加载nvim-lightbulb
    ["plugins/plugin-config/nvim-lightbulb"] = {
        enable = true,
        models = {"nvim-lightbulb"}
    },
    -- 加载plugin-lsp-installer
    ["plugins/plugin-config/nvim-lsp-installer"] = {
        enable = true,
        models = {"nvim-lsp-installer", "cmp_nvim_lsp", "rust-tools"}
    },
    -- 加载plugin-lspconfig
    ["plugins/plugin-config/nvim-lspconfig"] = {
        enable = true,
        models = {"lspconfig"}
    },
    -- 加载nvim-notify
    ["plugins/plugin-config/nvim-notify"] = {
        enable = true,
        models = {"notify"}
    },
    -- 加载 nvim-tree
    ["plugins/plugin-config/nvim-tree"] = {
        enable = true,
        models = {"nvim-tree"}
        -- 'andymass/vim-matchup'
    },
    -- 加载nvim-treesitter
    ["plugins/plugin-config/nvim-treesitter"] = {
        enable = true,
        models = {"nvim-treesitter"}
    },
    -- 加载主题 packer
    ["plugins/plugin-config/packer"] = {
        enable = true,
        models = {"packer"}
    },
    -- 加载symbols-outline
    ["plugins/plugin-config/symbols-outline"] = {
        enable = true,
        models = {"symbols-outline"}
    },
    -- 加载telescope
    ["plugins/plugin-config/telescope"] = {
        enable = true,
        models = {"telescope"}
    },
    -- 加载 theme
    ["plugins/plugin-config/theme"] = {
        enable = true,
        models = {"catppuccin"}
    },
    -- 加载toggleterm
    ["plugins/plugin-config/toggleterm"] = {
        enable = true,
        models = {"toggleterm"}
    },
    -- vim配置少，合并 加载vim-plugin
    ["plugins/plugin-config/vim-plugin"] = {
        enable = true,
        models = {"gitsigns"}
    },
    -- 加载which-key
    ["plugins/plugin-config/which-key"] = {
        enable = true,
        models = {"which-key"}
    }
}

for configFil, configSet in pairs(configFile) do
    if configSet.enable == false then goto continue end
    local modelNotOkList = {}
    for _, model in pairs(configSet.models) do
        local ok, _ = pcall(require, model)
        if not ok then
            table.insert(modelNotOkList, model)
        end
    end
    if #modelNotOkList == 0 then
        require(configFil)
    else
        local str = ""
        for _, m in pairs(modelNotOkList) do
            str = str .. m .. " "
        end
        vim.notify(str .. "not found", "warn")
    end
    
    ::continue::
end
