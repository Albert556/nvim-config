-- 自动命令
-- nested 是指该自动命令可以被其他BufWrite 自动命令的事件所依赖

local function augroup(name)
  return vim.api.nvim_create_augroup(name, { clear = true })
end

-- 去除行尾空白和尾部空行
vim.api.nvim_create_autocmd("BufWritePre", {
  group = augroup("tidy"),
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

-- resize splits if window got resized
vim.api.nvim_create_autocmd({ "VimResized" }, {
  group = augroup("resize_splits"),
  callback = function()
    local current_tab = vim.fn.tabpagenr()
    vim.cmd("tabdo wincmd =")
    vim.cmd("tabnext " .. current_tab)
  end,
})

-- go to last loc when opening a buffer
vim.api.nvim_create_autocmd("BufReadPost", {
  group = augroup("last_loc"),
  callback = function(ev)
    local exclude = { "gitcommit" }
    local buf = ev.buf
    if vim.tbl_contains(exclude, vim.bo[buf].filetype) or vim.b[buf].last_loc then
      return
    end
    vim.b[buf].last_loc = true
    local mark = vim.api.nvim_buf_get_mark(buf, '"')
    local lcount = vim.api.nvim_buf_line_count(buf)
    if mark[1] > 0 and mark[1] <= lcount then
      pcall(vim.api.nvim_win_set_cursor, 0, mark)
    end
  end,
})

