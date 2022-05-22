-- leader key 为空格
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-----------------------------------------------------------------
-- 替代<ESC>
vim.keymap.set("i", "jj", "<ESC>", {noremap = true, silent = true})

-- 调节窗口大小
-- 窗口宽度增大
vim.keymap.set("n", "<leader>v=", "<cmd>res +5<cr>", {noremap = true, silent = true})
-- 窗口宽度减小
vim.keymap.set("n", "<leader>v-", "<cmd>res -5<cr>", {noremap = true, silent = true})
-- 窗口高度增大
vim.keymap.set("n", "<leader>h=", "<cmd>vertical res +5<cr>", {noremap = true, silent = true})
-- 窗口高度减小
vim.keymap.set("n", "<leader>h-", "<cmd>vertical res -5<cr>", {noremap = true, silent = true})

-- 反撤销
vim.keymap.set("n", "U", "<C-r>", {noremap = true, silent = true})

-- 行头行尾
vim.keymap.set("n", "H", "^", {noremap = true, silent = true})
vim.keymap.set("v", "H", "^", {noremap = true, silent = true})
vim.keymap.set("n", "L", "$", {noremap = true, silent = true})
vim.keymap.set("v", "L", "$", {noremap = true, silent = true})

-- 快捷翻页
vim.keymap.set("n", "J", "10j", {noremap = true, silent = true})
vim.keymap.set("n", "K", "10k", {noremap = true, silent = true})
vim.keymap.set("v", "J", "10j", {noremap = true, silent = true})
vim.keymap.set("v", "K", "10k", {noremap = true, silent = true})

-- 回到上一个tag
-- 引申为回到函数跳转
vim.keymap.set("n", "gb", "<C-t>", {noremap = true, silent = true})

-- 格式化代码 Neoformat
vim.keymap.set("n", "<leader>=", "<cmd>Neoformat<CR>", {noremap = true, silent = true})

--------------------------------------------------------------------
