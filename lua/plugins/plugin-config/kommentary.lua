-- https://github.com/b3nj5m1n/kommentary
-- 注释

local pluginName = "kommentary"
local ok, kommentary = pcall(require, pluginName)
if not ok then
    vim.notify(pluginName.." load error", WARN)
    return
end

local kommentary_config = require('kommentary.config')

kommentary_config.configure_language({ "c", "cpp", "go", "lua", "rust" }, {
    prefer_single_line_comments = true,
})

kommentary_config.use_extended_mappings()
