-- 自动命令
-- nested 是指该自动命令可以被其他BufWrite 自动命令的事件所依赖

-- 去除行尾空白和尾部空行

vim.api.nvim_create_autocmd("BufWritePre", {
  group = vim.api.nvim_create_augroup("tidy", { clear = true }),
  callback = function()
    local ft = vim.api.nvim_buf_get_option(0, "filetype")
    for _, value in ipairs({
      filetype_exclude = {},
    }) do
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
