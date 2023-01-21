vim.g.mapleader = " " -- Defines leader as space (ease of access)

local map = vim.keymap
local opts = { noremap = true, silent = true }

-- General Mappings
-- map.set("n", "x", "_x") -- Avoid sticking deleted *characters* into the register
-- map.set("n", "<leader>+", "<C-a>", opts) -- Increment number
-- map.set("n", "<leader>-", "<C-x>", opts) -- Decrement number

-- Tabs
map.set("n", "L", ":tabn<CR>", opts) -- Next tab
map.set("n", "H", ":tabp<CR>", opts) -- Previous Tab

-- Plugins
-- map.set("n", "<leader>/", "gcc<CR>") -- Commenter
-- map.set("v", "<leader>/", "gc<CR>") -- Commenter

-- LSP
map.set("n", "gf", "<cmd>Lspsaga lsp_finder<CR>", opts) -- show definition, references
map.set("n", "gD", "<Cmd>lua vim.lsp.buf.declaration()<CR>", opts) -- got to declaration
map.set("n", "gd", "<cmd>Lspsaga peek_definition<CR>", opts) -- see definition and make edits in window
map.set("n", "gi", "<cmd>lua vim.lsp.buf.implementation()<CR>", opts) -- go to implementation
map.set("n", "[d", "<cmd>Lspsaga diagnostic_jump_prev<CR>", opts) -- jump to previous diagnostic in buffer
map.set("n", "]d", "<cmd>Lspsaga diagnostic_jump_next<CR>", opts) -- jump to next diagnostic in buffer
map.set("n", "K", "<cmd>Lspsaga hover_doc<CR>", opts) -- show documentation for what is under cursor
