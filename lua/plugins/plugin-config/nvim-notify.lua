-- https://github.com/rcarriga/nvim-notify

vim.notify = require("notify")

vim.notify.setup({})

-- 使用案例：
-- 信息、级别、标题
-- 级别有：info、warn、error、debug、trace
-- 示例：
-- vim.notify("hello world", "info", {title = "info"})
