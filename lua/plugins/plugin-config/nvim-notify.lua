-- https://github.com/rcarriga/nvim-notify
-- 弹框提示信息

local pluginName = "notify"
local ok, notify = pcall(require, pluginName)
if not ok then
    vim.notify(pluginName.." load error", WARN)
    return
end

vim.notify = notify
vim.notify.setup({})

-- 使用案例：
-- 信息、级别、标题
-- 级别有：info、warn、error、debug、trace
-- 示例：
-- vim.notify("hello world", "info", {title = "info"})

-- keymap
-- 显示历史弹窗记录
vim.keymap.set(
    "n",
    "<leader>nh",
    "<cmd>lua require('telescope').extensions.notify.notify()<CR>",
    { noremap = true, silent = true }
)
