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
