vim.keymap.set(
	{ "n", "v" },
	"j",
	"v:count == 0 ? 'gj' : 'j'",
	{ expr = true, silent = true, desc = "Move cursor down" }
)
vim.keymap.set({ "n", "v" }, "k", "v:count == 0 ? 'gk' : 'k'", { expr = true, silent = true, desc = "Move cursor up" })

vim.keymap.set({ "n" }, "|", "<Cmd>vsplit<CR>", { desc = "Vertical Split" })
vim.keymap.set({ "n" }, "-", "<Cmd>split<CR>", { desc = "Horizontal Split" })

vim.keymap.set("n", "<Esc>", "<cmd>nohlsearch<CR>", { desc = "Esc and clear highlights" })
vim.keymap.set("i", "<Esc>", "<Esc><cmd>noh<CR>", { desc = "general clear highlights" })

vim.keymap.set("n", "<C-h>", "<C-w><C-h>", { desc = "Move focus to the left window" })
vim.keymap.set("n", "<C-l>", "<C-w><C-l>", { desc = "Move focus to the right window" })
vim.keymap.set("n", "<C-j>", "<C-w><C-j>", { desc = "Move focus to the lower window" })
vim.keymap.set("n", "<C-k>", "<C-w><C-k>", { desc = "Move focus to the upper window" })

vim.keymap.set("n", "<leader>df", vim.diagnostic.open_float, { desc = "lsp floating diagnostics" })
vim.keymap.set("n", "[d", vim.diagnostic.goto_prev, { desc = "lsp prev diagnostic" })
vim.keymap.set("n", "]d", vim.diagnostic.goto_next, { desc = "lsp next diagnostic" })
vim.keymap.set("n", "<leader>dl", vim.diagnostic.setloclist, { desc = "lsp diagnostic loclist" })

-- Exit terminal mode in the builtin terminal with a shortcut that is a bit easier
-- for people to discover. Otherwise, you normally need to press <C-\><C-n>, which
-- is not what someone will guess without a bit more experience.
--
-- NOTE: This won't work in all terminal emulators/tmux/etc. Try your own mapping
-- or just use <C-\><C-n> to exit terminal mode
vim.keymap.set("t", "<Esc><Esc>", "<C-\\><C-n>", { desc = "Exit terminal mode" })

vim.keymap.set("n", "<leader>fw", "<cmd>Telescope live_grep<CR>", { desc = "telescope live grep" }) vim.keymap.set("n", "<leader>fb", "<cmd>Telescope buffers<CR>", { desc = "telescope find buffers" })
vim.keymap.set("n", "<leader>fh", "<cmd>Telescope help_tags<CR>", { desc = "telescope help page" })
vim.keymap.set("n", "<leader>ma", "<cmd>Telescope marks<CR>", { desc = "telescope find marks" })
vim.keymap.set("n", "<leader>fo", "<cmd>Telescope oldfiles<CR>", { desc = "telescope find oldfiles" })
vim.keymap.set(
	"n",
	"<leader>fz",
	"<cmd>Telescope current_buffer_fuzzy_find<CR>",
	{ desc = "telescope find in current buffer" }
)
vim.keymap.set("n", "<leader>cm", "<cmd>Telescope git_commits<CR>", { desc = "telescope git commits" })
vim.keymap.set("n", "<leader>gt", "<cmd>Telescope git_status<CR>", { desc = "telescope git status" })
vim.keymap.set("n", "<leader>pt", "<cmd>Telescope terms<CR>", { desc = "telescope pick hidden term" })
vim.keymap.set("n", "<leader>th", "<cmd>Telescope themes<CR>", { desc = "telescope nvchad themes" })
vim.keymap.set("n", "<leader>ff", "<cmd>Telescope find_files<cr>", { desc = "telescope find files" })
vim.keymap.set(
	"n",
	"<leader>fa",
	"<cmd>Telescope find_files follow=true no_ignore=true hidden=true<CR>",
	{ desc = "telescope find all files" }
)

vim.keymap.set("n", "<M-Down>", "<Cmd>resize -2<CR>", { desc = "Resize split up" })
vim.keymap.set("n", "<M-Up>", "<Cmd>resize +2<CR>", { desc = "Resize split down" })
vim.keymap.set("n", "<M-Left>", "<Cmd>vertical resize -2<CR>", { desc = "Resize split left" })
vim.keymap.set("n", "<M-Right>", "<Cmd>vertical resize +2<CR>", { desc = "Resize split right" })

vim.keymap.set("v", "<", "<gv", { desc = "Unindent line" })
vim.keymap.set("v", ">", ">gv", { desc = "Indent line" })
