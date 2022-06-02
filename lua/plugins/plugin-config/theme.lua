vim.cmd([[ set background=light ]])
-- 应用主题
vim.g.catppuccin_flavour = "latte" -- latte, frappe, macchiato, mocha

local colorscheme = "catppuccin"
--
local ok, _ = pcall(vim.cmd, "colorscheme " .. colorscheme)
if not ok then
    vim.notify("colorscheme " .. colorscheme .. " not found!", "warnings")
    return
end
