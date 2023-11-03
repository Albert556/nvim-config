-- nested 是指该自动命令可以被其他BufWrite 自动命令的事件所依赖

-- 自动命令
-- 重新打开缓冲区恢复光标位置
vim.api.nvim_create_autocmd("BufReadPost", {
  pattern = "*",
  callback = function()
    if vim.fn.line("'\"") > 0 and vim.fn.line("'\"") <= vim.fn.line("$") then
      vim.fn.setpos(".", vim.fn.getpos("'\""))
      vim.cmd("silent! foldopen")
    end
  end,
})

-- 自动保存编辑的缓冲区
vim.api.nvim_create_autocmd({ "InsertLeave", "TextChanged" }, {
  pattern = { "*" },
  command = "silent! wall",
  nested = true,
})

-- go to last loc when opening a buffer
vim.api.nvim_create_autocmd("BufReadPost", {
  group = vim.api.nvim_create_augroup("last_loc", { clear = true }),
  callback = function()
    local exclude = { "gitcommit" }
    local buf = vim.api.nvim_get_current_buf()
    if vim.tbl_contains(exclude, vim.bo[buf].filetype) then
      return
    end
    local mark = vim.api.nvim_buf_get_mark(buf, '"')
    local lcount = vim.api.nvim_buf_line_count(buf)
    if mark[1] > 0 and mark[1] <= lcount then
      pcall(vim.api.nvim_win_set_cursor, 0, mark)
    end
  end,
})

-- 取消自动注释
vim.api.nvim_create_autocmd("BufEnter", {
  pattern = "*",
  callback = function()
    vim.opt.formatoptions:remove("c")
    vim.opt.formatoptions:remove("r")
    vim.opt.formatoptions:remove("o")
  end,
})

-- 配置文件变更自动重新加载
local config_auto_source_group = vim.api.nvim_create_augroup("configAutoSource", { clear = true })

-- 去除行尾空白和尾部空行
local opts = {
  filetype_exclude = {},
}

local tidy_grp = vim.api.nvim_create_augroup("tidy", { clear = true })

vim.api.nvim_create_autocmd("BufWritePre", {
  group = tidy_grp,
  callback = function()
    local ft = vim.api.nvim_buf_get_option(0, "filetype")
    for _, value in ipairs(opts) do
      if ft == value then
        return
      end
    end

    local cursor_pos = vim.api.nvim_win_get_cursor(0)

    -- delete trailing whitespace
    vim.cmd([[:keepjumps keeppatterns %s/\s\+$//e]])

    -- delete lines @ eof
    -- vim.cmd([[:keepjumps keeppatterns silent! 0;/^\%(\n*.\)\@!/,$d_]])

    local num_rows = vim.api.nvim_buf_line_count(0)
    if cursor_pos[1] > num_rows then
      cursor_pos[1] = num_rows
    end

    vim.api.nvim_win_set_cursor(0, cursor_pos)
  end,
})

-- Auto delete [No Name] buffers.
if not vim.g.vscode then
  vim.api.nvim_create_autocmd('BufLeave', {
    callback = function()
      local buffers = vim.fn.filter(vim.fn.range(1, vim.fn.bufnr('$')),
        'buflisted(v:val) && empty(bufname(v:val)) && bufwinnr(v:val) < 0 && (getbufline(v:val, 1, "$") == [""])')
      local next = next
      if next(buffers) == nil then
        return
      end
      local cmdstr = ':silent! bw!'
      for _, v in pairs(buffers) do
        cmdstr = cmdstr .. ' ' .. v
      end
      vim.cmd(cmdstr)
    end
  })
end
