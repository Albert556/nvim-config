-- https://github.com/tami5/lspsaga.nvim
-- lsp ui

local lspsaga = require("lspsaga")

lspsaga.setup(
    {
    -- 提示边框样式：round、single、double
    border_style = "round",
    error_sign = " ",
    warn_sign = " ",
    hint_sign = " ",
    infor_sign = " ",
    diagnostic_header_icon = " ",
    -- 正在写入的行提示
    code_action_icon = " ",
    code_action_prompt = {
        -- 显示写入行提示
        -- 如果为 true ，则写代码时会在左侧行号栏中显示你所定义的图标
        enable = false,
        sign = true,
        sign_priority = 40,
        virtual_text = true
    },
    -- 快捷键配置
    code_action_keys = {
        quit = "<Esc>",
        exec = "CR>"
    },
    rename_action_keys = {
        quit = "<Esc>",
        exec = "<CR>"
    }
}
)

-- keymap
-- 按键映射配置在lsp-installer
-- vim.keymap.set("n", "gx", "<cmd>Lspsaga code_action<cr>", {silent = true, noremap = true, buffer = 0})
-- vim.keymap.set("x", "gx", ":<c-u>Lspsaga range_code_action<cr>", {silent = true, noremap = true, buffer = 0})
-- vim.keymap.set("n", "gh", "<cmd>Lspsaga hover_doc<cr>", {silent = true, noremap = true, buffer = 0})
-- vim.keymap.set("n", "<leader>ld", "<cmd>Lspsaga show_line_diagnostics<CR>", {noremap = true, silent = true, buffer = 0})
-- vim.keymap.set(
--     "n",
--     "<leader>cd",
--     "<cmd>Lspsaga show_cursor_diagnostics<CR>",
--     {noremap = true, silent = true, buffer = 0}
-- )
-- vim.keymap.set("n", "gj", "<cmd>Lspsaga diagnostic_jump_next<cr>", {silent = true, noremap = true, buffer = 0})
-- vim.keymap.set("n", "gk", "<cmd>Lspsaga diagnostic_jump_prev<cr>", {silent = true, noremap = true, buffer = 0})
-- vim.keymap.set("n", "<C-k>", "<cmd>lua require('lspsaga.action').smart_scroll_with_saga(-1, '<c-u>')<cr>", {buffer = 0})
-- vim.keymap.set("n", "<C-j>", "<cmd>lua require('lspsaga.action').smart_scroll_with_saga(1, '<c-d>')<cr>", {buffer = 0})
