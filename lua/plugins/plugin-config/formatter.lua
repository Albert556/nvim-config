-- https://github.com/mhartington/formatter.nvim
-- 代码格式化工具

-- Utilities for creating configurations
local formatter = require('formatter')
-- local formatter_util = require("formatter.util")

-- Provides the Format and FormatWrite commands
formatter.setup {
    -- All formatter configurations are opt-in
    filetype = {
        lua = {
            -- Pick from defaults:
            require('formatter.filetypes.lua').stylua,

            -- -- ,or define your own:
            -- function()
            --     return {
            --         exe = "stylua",
            --         args = {
            --             "--search-parent-directories",
            --             "--stdin-filepath",
            --             util.escape_path(util.get_current_buffer_file_path()),
            --             "--",
            --             "-",
            --         },
            --         stdin = true,
            --     }
            -- end
        }
    }
}
vim.keymap.set('n', "<leader>=", ":Format<CR>", { noremap = true, silent = true })
vim.keymap.set('n', "<leader>==", ":FormatWrite<CR>", { noremap = true, silent = true })

vim.cmd([[
augroup FormatAutogroup
  autocmd!
  autocmd BufWritePost * FormatWrite
augroup END
]])
