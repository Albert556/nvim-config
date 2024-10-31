local map = vim.keymap.set

map('x', 'p', 'pgvy', { desc = 'Paste Without Copy' })

map({ 'n', 'v' }, 'j', "v:count == 0 ? 'gj' : 'j'", { expr = true, silent = true, desc = 'Move cursor down' })
map({ 'n', 'v' }, 'k', "v:count == 0 ? 'gk' : 'k'", { expr = true, silent = true, desc = 'Move cursor up' })

map({ 'n' }, '|', '<Cmd>vsplit<CR>', { desc = 'Vertical Split' })
map({ 'n' }, '-', '<Cmd>split<CR>', { desc = 'Horizontal Split' })

map('n', '<Esc>', '<cmd>nohlsearch<CR>', { silent = true, desc = 'Clear highlights And Save' })

map('n', '<C-h>', '<C-w><C-h>', { desc = 'Move focus to the left window' })
map('n', '<C-l>', '<C-w><C-l>', { desc = 'Move focus to the right window' })
map('n', '<C-j>', '<C-w><C-j>', { desc = 'Move focus to the lower window' })
map('n', '<C-k>', '<C-w><C-k>', { desc = 'Move focus to the upper window' })

-- Exit terminal mode in the builtin terminal with a shortcut that is a bit easier
-- for people to discover. Otherwise, you normally need to press <C-\><C-n>, which
-- is not what someone will guess without a bit more experience.
--
-- NOTE: This won't work in all terminal emulators/tmux/etc. Try your own mapping
-- or just use <C-\><C-n> to exit terminal mode
map('t', '<Esc><Esc>', '<C-\\><C-n>', { desc = 'Exit terminal mode' })

map('n', '<M-Down>', '<Cmd>resize -2<CR>', { desc = 'Resize split up' })
map('n', '<M-Up>', '<Cmd>resize +2<CR>', { desc = 'Resize split down' })
map('n', '<M-Left>', '<Cmd>vertical resize -2<CR>', { desc = 'Resize split left' })
map('n', '<M-Right>', '<Cmd>vertical resize +2<CR>', { desc = 'Resize split right' })

map('v', '<', '<gv', { desc = 'Unindent line' })
map('v', '>', '>gv', { desc = 'Indent line' })
