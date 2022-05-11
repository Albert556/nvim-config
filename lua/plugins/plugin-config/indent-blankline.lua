vim.opt.list = true
-- vim.opt.listchars:append("space:⋅")
-- vim.opt.listchars:append("eol:↴")

local indent_blankline = require("indent_blankline")

indent_blankline.setup {
    space_char_blankline = " ",
    -- 显示当前所在区域
    show_current_context = true,
    -- 显示当前所在区域的开始位置
    show_current_context_start = true,
    -- 显示行尾符
    show_end_of_line = true
}
