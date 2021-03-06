-- https://github.com/Pocco81/AutoSave.nvim
-- 文件自动保存

local pluginName = "autosave"
local ok, autosave = pcall(require, pluginName)
if not ok then
    vim.notify(pluginName.." load error", WARN)
    return
end

autosave.setup(
    {
    enabled = true,
    execution_message = "AutoSave: saved at " .. vim.fn.strftime("%H:%M:%S"),
    events = { "InsertLeave", "TextChanged" },
    conditions = {
        exists = true,
        -- 忽略自动保存的文件名字或文件类型
        filename_is_not = {},
        filetype_is_not = {},
        modifiable = true
    },
    -- 保存时写入全部的 Buffer
    write_all_buffers = false,
    on_off_commands = true,
    clean_command_line_interval = 0,
    debounce_delay = 135
}
)
