local opt = vim.opt
local o = vim.o
local g = vim.g

-------------------------------------- globals -----------------------------------------
g.toggle_theme_icon = "   "

-------------------------------------- options ------------------------------------------
o.laststatus = 3
-- o.showmode = true

o.clipboard = "unnamedplus"
o.mouse = "a"

o.cursorline = true
o.cursorlineopt = "line"

-- Indenting
o.expandtab = true
o.shiftwidth = 2
o.smartindent = true
o.tabstop = 2 
o.softtabstop = 2

opt.fillchars = { eob = " " }

o.ignorecase = true
o.smartcase = true

-- Numbers
o.number = true
o.numberwidth = 2
-- o.ruler = false

-- disable nvim intro

o.signcolumn = "yes"
o.splitbelow = true
o.splitright = true
o.timeoutlen = 400
o.undofile = true

-- interval for writing swap file to disk, also used by gitsigns
o.updatetime = 250

-- go to previous/next line with h,l,left arrow and right arrow
-- when cursor reaches end/beginning of line
opt.whichwrap:append "<>[]hl"

-- g.mapleader = " "

