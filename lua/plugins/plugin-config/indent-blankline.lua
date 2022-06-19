-- https://github.com/lukas-reineke/indent-blankline.nvim
-- 锁进显示，换行显示，括号匹配显示

vim.opt.list = true
-- vim.opt.listchars:append("space:⋅")
-- vim.opt.listchars:append("eol:↴")

local pluginName = "indent_blankline"
local indent_blankline, ok = pall(require, pluginName)
if not ok then
    vim.notify(pluginName.." load error", WARN)
    return
end

indent_blankline.setup {
    space_char_blankline = " ",
    -- 显示当前所在区域
    show_current_context = true,
    -- 显示当前所在区域的开始位置
    show_current_context_start = true,
    -- 显示行尾符
    show_end_of_line = true
}
