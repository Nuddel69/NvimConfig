local opt = vim.opt -- I don't wanna type vim.opt every single time

-- Line Numbering
opt.relativenumber = true -- Self-explanatory (kinda handy)
opt.number = true -- Shows current line (Makes it... not useless)

-- Indentations
opt.tabstop = 4 -- To make it look noice
opt.shiftwidth = 4
opt.expandtab = true
opt.autoindent = true

-- Line Wrap
opt.wrap = false -- No line wrap (line wrap kinda dum)

-- Search
opt.ignorecase = true -- I don't wanna match cases
opt.smartcase = true -- But sometimes I do so it's handy if I'm being explicit

-- Cursor Line
opt.cursorline = true -- Highlights the current line to circumvent my blindness

-- Clipboard
opt.clipboard:append("unnamedplus") -- Force nvim to only use system clipboard (since I don't wanna bother with registers - maccy to the rescue)

-- Split
opt.splitbelow = true
opt.splitright = true

-- Appearance
opt.termguicolors = true -- Tha powah of iTerm2
opt.background = "dark" -- To avoid damage to my retinas
opt.signcolumn = "yes"

-- Misc
opt.iskeyword:append("-") -- Makes two words connected by "-" act as one
opt.backspace = "indent,eol,start"
