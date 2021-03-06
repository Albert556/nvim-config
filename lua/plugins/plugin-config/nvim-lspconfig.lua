-- https://github.com/neovim/nvim-lspconfig

local pluginName = "lspconfig"
local ok, lspconfig = pcall(require, pluginName)
if not ok then
    vim.notify(pluginName.." load error", WARN)
    return
end

-- 配置lsp显示UI
vim.diagnostic.config(
    {
    virtual_text = {
        -- 显示的前缀，可选项：'●', '▎', 'x'
        -- 默认是一个小方块，不是很好看，所以这里改了
        prefix = "●",
        -- 是否总是显示前缀？是的
        source = "always"
    },
    signs = true,
    underline = true,
    float = {
        -- 是否显示诊断来源？是的
        source = "always"
    },
    -- 在插入模式下是否显示诊断？不要
    update_in_insert = false,
    severity_sort = false
}
)
