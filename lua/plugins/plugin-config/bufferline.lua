-- https://github.com/akinsho/bufferline.nvim
-- buffer控制插件

local pluginName = "bufferline"
local ok, bufferline = pcall(require, pluginName)
if not ok then
    vim.notify(pluginName.." load error", WARN)
    return
end

bufferline.setup(
    {
    options = {
        diagnostics = "nvim_lsp",
        -- 左侧让出 nvim-tree 的位置
        offsets = {
            {
                filetype = "NvimTree",
                text = function()
                    return vim.fn.getcwd()
                end,
                highlight = "Directory",
                text_align = "left"
            }
        },
    }
}
)

-- keymap
vim.keymap.set("n", "<Tab>", ":BufferLineCycleNext<CR>", { noremap = true, silent = true })
vim.keymap.set("n", "<S-Tab>", ":BufferLineCyclePrev<CR>", { noremap = true, silent = true })
vim.keymap.set("n", "<leader>bp", "<cmd>BufferLinePick<cr>", { silent = true, nowait = true })
vim.keymap.set("n", "<leader>bc", "<cmd>BufferLinePickClose<cr>", { silent = true, nowait = true })
