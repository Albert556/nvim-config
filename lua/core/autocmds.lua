local insert_enter = vim.api.nvim_create_augroup('insert-enter', { clear = true })

local insert_leave = vim.api.nvim_create_augroup('insert-leave', { clear = true })

vim.api.nvim_create_autocmd('TextYankPost', {
  desc = 'Highlight when yanking (copying) text',
  group = vim.api.nvim_create_augroup('highlight-yank', { clear = true }),
  callback = function() vim.highlight.on_yank() end,
})

vim.api.nvim_create_autocmd('InsertEnter', {
  desc = 'Relativenumber on insert mode',
  group = insert_enter,
  callback = function() vim.o.relativenumber = true end,
})
vim.api.nvim_create_autocmd('InsertLeave', {
  desc = 'Number on normal mode',
  group = insert_leave,
  callback = function() vim.o.relativenumber = false end,
})

vim.api.nvim_create_autocmd({ 'InsertLeave', 'TextChanged', 'TextChangedI' }, {
  pattern = '*',
  group = vim.api.nvim_create_augroup('Autosave', { clear = true }),
  callback = function(ev)
    local buf = ev.buf
    local api = vim.api

    -- Only save normal buffer
    local buftype_ok, buftype = pcall(api.nvim_get_option_value, 'buftype', { buf = buf })
    if not buftype_ok then
      return
    elseif buftype ~= '' then
      return
    end
    -- Only save modified buffer
    local modeified_ok, modeified = pcall(api.nvim_get_option_value, 'modified', { buf = buf })
    if not modeified_ok then
      return
    elseif not modeified then
      return
    end

    local fn = vim.fn
    local key = 'save_delay_id'

    local ok, save_delay_id = pcall(api.nvim_buf_get_var, ev.buf, key)
    if ok and save_delay_id then
      fn.timer_stop(save_delay_id)
      api.nvim_buf_set_var(buf, key, nil)
    end
    local timer_id = fn.timer_start(1000, function()
      api.nvim_buf_set_var(buf, key, nil)
      vim.api.nvim_buf_call(buf, function()
        if vim.api.nvim_buf_is_valid(buf) then vim.cmd('silent! write') end
      end)
    end)
    api.nvim_buf_set_var(buf, key, timer_id)
  end,
})
