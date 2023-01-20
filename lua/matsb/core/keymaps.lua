vim.g.mapleader = " " -- Defines leader as space (ease of access)

local map = vim.keymap
local opts = { silent = true }

-- General Mappings
-- map.set("n", "<leader>sC", ":nohl<CR>", opts, { desc = "Clear search highlighting" }) -- Clear search highlighting
-- map.set("n", "x", "_x") -- Avoid sticking deleted *characters* into the register
-- map.set("n", "<leader>+", "<C-a>", opts) -- Increment number
-- map.set("n", "<leader>-", "<C-x>", opts) -- Decrement number

-- Windows Split
-- map.set("n", "<leader>sv", "<C-w>v", opts) -- Split vertically
-- map.set("n", "<leader>sh", "<C-w>h", opts) -- Split horizontally
-- map.set("n", "<leader>se", "<C-w>=", opts) -- Equal window size
-- map.set("n", "<leader>sx", ":close<CR>", opts) -- Close current split

-- Tabs
-- map.set("n", "<leader>tn", ":tabnew<CR>", opts) -- New Tab (since when did I only work on a single file at a time...?)
-- map.set("n", "<leader>c", ":tabclose<CR>", opts) -- Close Tab (I don't need every file at once)
map.set("n", "L", ":tabn<CR>", opts) -- Next tab
map.set("n", "H", ":tabp<CR>", opts) -- Previous Tab

-- Plugins
-- map.set("n", "<leader>sm", ":MaximizerToggle<CR>", opts) -- Toggle split maximiser (cause sometimes I want it *beeg*)
-- map.set("n", "<leader>/", "gcc<CR>") -- Commenter
-- map.set("v", "<leader>/", "gc<CR>") -- Commenter
-- map.set("n", "<leader>ff", "<cmd>Telescope find_files<cr>", opts) -- Find files within current working directory, respects .gitignore
-- map.set("n", "<leader>fs", "<cmd>Telescope live_grep<cr>", opts) -- Find string in current working directory as you type
-- map.set("n", "<leader>fc", "<cmd>Telescope grep_string<cr>", opts) -- Find string under cursor in current working directory
-- map.set("n", "<leader>fb", "<cmd>Telescope buffers<cr>", opts) -- List open buffers in current neovim instance
-- map.set("n", "<leader>fh", "<cmd>Telescope help_tags<cr>", opts) -- List available help tags

-- File Explorer
-- map.set("n", "<leader>e", ":NvimTreeToggle<CR>", opts, { desc = "Toggle file explorer" }) -- Toggle file explorer
-- map.set("n", "<leader>o", ":NvimTreeFocus<CR>", opts) -- Focus file explorer
