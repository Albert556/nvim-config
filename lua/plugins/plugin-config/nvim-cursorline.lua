-- https://github.com/yamatsum/nvim-cursorline
-- 光标当前行
-- 光标所在单词高亮

local pluginName = "nvim-cursorline"
local cursorline, ok = pall(require, pluginName)
if not ok then
    vim.notify(pluginName.." load error", WARN)
    return
end

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
