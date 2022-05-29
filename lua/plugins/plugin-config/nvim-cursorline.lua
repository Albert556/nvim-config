-- https://github.com/yamatsum/nvim-cursorline
-- 光标当前行
-- 光标所在单词高亮

local cursorline = require('nvim-cursorline')

cursorline.setup {
  cursorline = {
    enable = true,
    timeout = 0,
    number = false,
  },
  cursorword = {
    enable = true,
    min_length = 3,
    hl = { underline = true },
  }
}
