local opts = vim.opt

-- Tab & indentation
opts.tabstop = 2
opts.shiftwidth = 2
opts.softtabstop = 2
opts.expandtab = true
opts.smartindent = true
opts.wrap = false

-- search
opts.incsearch = true
-- opts.ignorecase = true
opts.smartcase = true
opts.hlsearch = false

-- Appearance
opts.number = true
opts.relativenumber = true
opts.colorcolumn = "130"
-- opts.signcolumn = "yes"
opts.cmdheight = 1
opts.scrolloff = 10

--Behaviour
opts.hidden = true
opts.errorbells = false
opts.swapfile = false
opts.backup = false
opts.undofile = true
opts.backspace = "indent,eol,start"
opts.clipboard:append("unnamedplus")
opts.modifiable = true
