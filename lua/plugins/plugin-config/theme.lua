
vim.cmd([[ set background=light ]])
-- 应用主题
local colorscheme = "PaperColor"
--
local ok, _ = pcall(vim.cmd, "colorscheme " .. colorscheme)
if not ok then
    vim.notify("colorscheme " .. colorscheme .. " not found!", "warnings")
    return
end
