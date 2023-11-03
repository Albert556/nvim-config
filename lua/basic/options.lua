-- This file is automatically loaded by plugins.config

vim.opt.termguicolors = true -- True color support
vim.opt.cursorline = true -- Enable highlighting of the current line
vim.opt.updatetime = 300 -- Save swap file and trigger CursorHold

-- Basic setings
vim.opt.encoding = "utf-8"
vim.opt.fileencoding = "utf-8"
vim.opt.backspace = "indent,eol,start"
vim.opt.completeopt = { "menu","menuone","noselect" } -- "menu,menuone,noselect"
vim.opt.history = 100
vim.opt.startofline = true
vim.opt.spelllang = { "en" }

-- File
vim.opt.autowrite = true -- Enable auto write
vim.opt.undofile = true
vim.opt.undolevels = 10000

-- Backup files
vim.opt.backup = false
vim.opt.writebackup = false
vim.opt.swapfile = false -- do not use swap file
vim.opt.undodir = os.getenv("HOME") .. "/.local/state/nvim/undo"
vim.opt.undofile = true

-- Type
vim.opt.clipboard = "unnamedplus" -- Sync with system clipboard
vim.opt.mouse = "a" -- Enable mouse mode
vim.opt.infercase = true

-- Mapping waiting time
vim.opt.timeout = false
vim.opt.ttimeout = true
vim.opt.ttimeoutlen = 100

-- Display
vim.opt.scrolloff = 4 -- Lines of context
vim.opt.sidescrolloff = 8 -- Columns of context
vim.opt.showmatch = true
vim.opt.synmaxcol = 300
vim.opt.laststatus = 2
vim.opt.shortmess:append { W = true, I = true, c = true }
vim.opt.showmode = false -- Dont show mode since we have a statusline

vim.opt.list = false -- do not display white characters
vim.opt.foldenable = true
vim.opt.foldlevel = 99 -- limit folding to 4 levels
vim.opt.foldlevelstart = 99 -- limit folding to 4 levels
vim.opt.foldcolumn = "1"
vim.opt.foldmethod = 'syntax' -- use language syntax to generate folds
vim.opt.wrap = false --do not wrap lines even if very long
vim.opt.eol = false -- show if there's no eol char
vim.opt.showbreak= '↪' -- character to show when line is broken

vim.opt.splitkeep = "screen"
vim.opt.shortmess:append { C = true }

vim.opt.pumheight = 10

-- Sidebar
vim.opt.number = true -- line number on the left
vim.opt.numberwidth = 3 -- always reserve 3 spaces for line number
vim.opt.relativenumber = true -- Relative line numbers
vim.opt.signcolumn = 'yes' -- Always show the signcolumn, otherwise it would shift the text each time
vim.opt.modelines = 0
vim.opt.showcmd = true -- display command in bottom bar

-- Search
vim.opt.incsearch = true -- starts searching as soon as typing, without enter needed
vim.opt.ignorecase = true -- ignore letter case when searching
vim.opt.smartcase = true -- case insentive unless capitals used in search
vim.opt.grepformat = "%f:%l:%c:%m"
vim.opt.grepprg = "rg --vimgrep"

vim.opt.matchtime = 2 -- delay before showing matching paren
vim.opt.mps = vim.o.mps .. ",<:>"

-- White characters
vim.opt.autoindent = true
vim.opt.smartindent = true
vim.opt.breakindent = true
vim.opt.preserveindent = true
vim.opt.tabstop = 2
vim.opt.softtabstop = 2
vim.opt.shiftround = true -- Round indent
vim.opt.shiftwidth = 2 -- indentation rule
vim.opt.formatoptions = 'jcroqlnt' -- q  - comment formatting; n - numbered lists; j - remove comment when joining lines; 1 - don't break after one-letter word
vim.opt.expandtab = true -- expand tab to spaces

-- Commands mode
vim.opt.wildmenu = true -- on TAB, complete options for system command
vim.opt.wildignore = 'deps,.svn,CVS,.git,.hg,*.o,*.a,*.class,*.mo,*.la,*.so,*.obj,*.swp,*.jpg,*.png,*.xpm,*.gif,.DS_Store,*.aux,*.out,*.toc'
vim.opt.wildmode = "longest:full,full" -- Command-line completion mode
vim.opt.winminwidth = 5 -- Minimum window width

-- Fix markdown indentation settings
vim.g.markdown_recommended_style = 0

-- powershell
if vim.fn.has('win32') == 1 then
  local powershell_options = {
    shell = vim.fn.executable "pwsh" == 1 and "pwsh" or "powershell",
    shellcmdflag = "-NoLogo -NoProfile -ExecutionPolicy RemoteSigned -Command [Console]::InputEncoding=[Console]::OutputEncoding=[System.Text.Encoding]::UTF8;",
    shellredir = "-RedirectStandardOutput %s -NoNewWindow -Wait",
    shellpipe = "2>&1 | Out-File -Encoding UTF8 %s; exit $LastExitCode",
    shellquote = "",
    shellxquote = "",
  }

  for option, value in pairs(powershell_options) do
    vim.opt[option] = value
  end
end
