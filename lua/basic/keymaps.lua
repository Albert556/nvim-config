vim.g.mapleader = " "
vim.g.maplocalleader = " "

vim.api.nvim_set_keymap("n", "j", "v:count == 0 ? 'gj' : 'j'", { expr = true, desc = "Move Cursor Donw" })
vim.api.nvim_set_keymap("n", "k", "v:count == 0 ? 'gk' : 'k'", { expr = true, desc = "Move Cursor Up" })

vim.keymap.set("n", "==", "<Esc>ggVG=<C-o>", { desc = "Format And Save" })
vim.keymap.set("x", "p", "pgvy", { desc = "Paste" })

vim.keymap.set({"n", "v"}, "H", "^", { desc = "Move Line Start" })
vim.keymap.set({"n", "v"}, "L", "$", { desc = "Move Line End" })

-- Move to window using the <ctrl> hjkl keys
vim.keymap.set("n", "<C-h>", "<C-w>h", { desc = "Go to left window" })
vim.keymap.set("n", "<C-j>", "<C-w>j", { desc = "Go to lower window" })
vim.keymap.set("n", "<C-k>", "<C-w>k", { desc = "Go to upper window" })
vim.keymap.set("n", "<C-l>", "<C-w>l", { desc = "Go to right window" })

-- Resize window using <ctrl> arrow keys
vim.keymap.set("n", "<M-Up>", "<cmd>resize +2<cr>", { desc = "Increase window height" })
vim.keymap.set("n", "<M-Down>", "<cmd>resize -2<cr>", { desc = "Decrease window height" })
vim.keymap.set("n", "<M-Left>", "<cmd>vertical resize -2<cr>", { desc = "Decrease window width" })
vim.keymap.set("n", "<M-Right>", "<cmd>vertical resize +2<cr>", { desc = "Increase window width" })

-- Split
vim.keymap.set("n", "|", "<C-w>v", { desc = "Vertical Split" })
vim.keymap.set("n", "-", "<C-w>s", { desc = "Horizontal Split" })

-- buffers
-- 可能会被 bufferline 覆盖
vim.keymap.set("n", "K", "<cmd>bprevious<cr>", { desc = "Prev buffer" })
vim.keymap.set("n", "J", "<cmd>bnext<cr>", { desc = "Next buffer" })

-- tabs
vim.keymap.set("n", "<leader><tab>l", "<cmd>tablast<cr>", { desc = "Last Tab" })
vim.keymap.set("n", "<leader><tab>f", "<cmd>tabfirst<cr>", { desc = "First Tab" })
vim.keymap.set("n", "<leader><tab><tab>", "<cmd>tabnew<cr>", { desc = "New Tab" })
vim.keymap.set("n", "<leader><tab>]", "<cmd>tabnext<cr>", { desc = "Next Tab" })
vim.keymap.set("n", "<leader><tab>d", "<cmd>tabclose<cr>", { desc = "Close Tab" })
vim.keymap.set("n", "<leader><tab>[", "<cmd>tabprevious<cr>", { desc = "Previous Tab" })

-- Clear search with <esc>
vim.keymap.set({ "i", "n" }, "<esc>", function()
  if vim.o.buftype == '' then
    return "<esc><cmd>noh<cr><cmd>w<cr>"
  else
    return "<esc>"
  end
end, { expr = true, replace_keycodes = true,desc = "Escape and clear hlsearch, Save" })

-- better indenting
vim.keymap.set({"n","v"}, "<", "<gv")
vim.keymap.set({"n","v"}, ">", ">gv")
