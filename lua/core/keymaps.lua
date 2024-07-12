local map = vim.keymap.set

map("x", "p", "pgvy", { desc = "Paste Without Copy" })

map({ "n", "v" }, "j", "v:count == 0 ? 'gj' : 'j'", { expr = true, silent = true, desc = "Move cursor down" })
map({ "n", "v" }, "k", "v:count == 0 ? 'gk' : 'k'", { expr = true, silent = true, desc = "Move cursor up" })

map({ "n" }, "|", "<Cmd>vsplit<CR>", { desc = "Vertical Split" })
map({ "n" }, "-", "<Cmd>split<CR>", { desc = "Horizontal Split" })

map("n", "<Esc>", "<cmd>nohlsearch<CR>", { desc = "Esc and clear highlights" })
map("i", "<Esc>", "<Esc><cmd>noh<CR>", { desc = "general clear highlights" })

map("n", "<C-h>", "<C-w><C-h>", { desc = "Move focus to the left window" })
map("n", "<C-l>", "<C-w><C-l>", { desc = "Move focus to the right window" })
map("n", "<C-j>", "<C-w><C-j>", { desc = "Move focus to the lower window" })
map("n", "<C-k>", "<C-w><C-k>", { desc = "Move focus to the upper window" })

map("n", "<leader>df", vim.diagnostic.open_float, { desc = "lsp floating diagnostics" })
map("n", "[d", vim.diagnostic.goto_prev, { desc = "lsp prev diagnostic" })
map("n", "]d", vim.diagnostic.goto_next, { desc = "lsp next diagnostic" })
map("n", "<leader>dl", vim.diagnostic.setloclist, { desc = "lsp diagnostic loclist" })

-- Exit terminal mode in the builtin terminal with a shortcut that is a bit easier
-- for people to discover. Otherwise, you normally need to press <C-\><C-n>, which
-- is not what someone will guess without a bit more experience.
--
-- NOTE: This won't work in all terminal emulators/tmux/etc. Try your own mapping
-- or just use <C-\><C-n> to exit terminal mode
map("t", "<Esc><Esc>", "<C-\\><C-n>", { desc = "Exit terminal mode" })

map("n", "<leader>fw", "<cmd>Telescope live_grep<CR>", { desc = "telescope live grep" })
map("n", "<leader>fb", "<cmd>Telescope buffers<CR>", { desc = "telescope find buffers" })
map("n", "<leader>fh", "<cmd>Telescope help_tags<CR>", { desc = "telescope help page" })
map("n", "<leader>ma", "<cmd>Telescope marks<CR>", { desc = "telescope find marks" })
map("n", "<leader>fo", "<cmd>Telescope oldfiles<CR>", { desc = "telescope find oldfiles" })
map(
  "n",
  "<leader>fz",
  "<cmd>Telescope current_buffer_fuzzy_find<CR>",
  { desc = "telescope find in current buffer" }
)
map("n", "<leader>cm", "<cmd>Telescope git_commits<CR>", { desc = "telescope git commits" })
map("n", "<leader>gt", "<cmd>Telescope git_status<CR>", { desc = "telescope git status" })
map("n", "<leader>pt", "<cmd>Telescope terms<CR>", { desc = "telescope pick hidden term" })
map("n", "<leader>th", "<cmd>Telescope themes<CR>", { desc = "telescope nvchad themes" })
map("n", "<leader>ff", "<cmd>Telescope find_files<cr>", { desc = "telescope find files" })
map(
  "n",
  "<leader>fa",
  "<cmd>Telescope find_files follow=true no_ignore=true hidden=true<CR>",
  { desc = "telescope find all files" }
)

map("n", "<M-Down>", "<Cmd>resize -2<CR>", { desc = "Resize split up" })
map("n", "<M-Up>", "<Cmd>resize +2<CR>", { desc = "Resize split down" })
map("n", "<M-Left>", "<Cmd>vertical resize -2<CR>", { desc = "Resize split left" })
map("n", "<M-Right>", "<Cmd>vertical resize +2<CR>", { desc = "Resize split right" })

map("v", "<", "<gv", { desc = "Unindent line" })
map("v", ">", ">gv", { desc = "Indent line" })

vim.g.lsp_on_attach = function(client, bufnr)
  local function op(desc)
    return { buffer = bufnr, desc = "LSP " .. desc }
  end

  map("n", "gd", vim.lsp.buf.definition, op "Go to definition")
  map("n", "gD", vim.lsp.buf.declaration, op "Go to declaration")
  map("n", "gy", vim.lsp.buf.type_definition, op "Go to type definition")
  map("n", "gi", vim.lsp.buf.implementation, op "Go to implementation")
  map("n", "gr", vim.lsp.buf.references, op "Show references")
  map("n", "K", vim.lsp.buf.hover, op "hover information")
  map("n", "<C-k>", vim.lsp.buf.signature_help, op "Show signature help")
  map("n", "rn", vim.lsp.buf.rename, op "Rename")
  map("n", "ca", vim.lsp.buf.code_action, op "Code action")
  map("n", "gq", vim.lsp.buf.format, op "Format")
  map("n", "<leader>wa", vim.lsp.buf.add_workspace_folder, op "Add workspace folder")
  map("n", "<leader>wr", vim.lsp.buf.remove_workspace_folder, op "Remove workspace folder")
  map("n", "<leader>wl", function()
    print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
  end, op "List workspace folders")
end
