-- https://github.com/ur4ltz/surround.nvim

local pluginName = "surround"
local surround, ok = pall(require, pluginName)
if not ok then
    vim.notify(pluginName.." load error", WARN)
    return
end

surround.setup(
    {
    context_offset = 100,
    load_autogroups = false,
    mappings_style = "surround",
    -- mappings_style = "sandwich",
    map_insert_mode = true,
    quotes = { "'", '"' },
    brackets = { "(", "{", "[" },
    space_on_closing_char = false,
    pairs = {
        nestable = { b = { "(", ")" }, s = { "[", "]" }, B = { "{", "}" }, a = { "<", ">" } },
        linear = { q = { "'", "'" }, t = { "`", "`" }, d = { '"', '"' } }
    },
    prefix = "s"
}
)
