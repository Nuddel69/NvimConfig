local whichkey_status, which_key = pcall(require, "which-key")
if not whichkey_status then
	return
end

local setup = {
	plugins = {
		marks = false,
		registers = false,

		presets = {
			z = true,
		},
	},
	-- add operators that will trigger motion and text object completion
	-- to enable all native operators, set the preset / operators plugin above
	operators = { gc = "Comments" },
	popup_mappings = {
		scroll_down = "<c-d>", -- binding to scroll down inside the popup
		scroll_up = "<c-u>", -- binding to scroll up inside the popup
	},
	window = {
		border = "none", -- none, single, double, shadow
		position = "bottom", -- bottom, top
		margin = { 1, 0, 1, 0 }, -- extra window margin [top, right, bottom, left]
		padding = { 2, 2, 2, 2 }, -- extra window padding [top, right, bottom, left]
		winblend = 0,
	},
	icons = {
		separator = " ",
	},
	layout = {
		height = { min = 4, max = 25 }, -- min and max height of the columns
		width = { min = 20, max = 50 }, -- min and max width of the columns
		spacing = 3, -- spacing between columns
		align = "left", -- align columns left, center or right
	},
	ignore_missing = false, -- enable this to hide mappings for which you didn't specify a label
	hidden = { "<silent>", "<cmd>", "<Cmd>", "<CR>", "call", "lua", "^:", "^ " }, -- hide mapping boilerplate
	show_help = false, -- show help message on the command line when the popup is visible
	show_keys = false, -- show the currently pressed key and its label as a message in the command line
	triggers = "auto", -- automatically setup triggers
	-- triggers = {"<leader>"} -- or specify a list manually
	triggers_blacklist = {
		-- list of mode / prefixes that should never be hooked by WhichKey
		-- this is mostly relevant for key maps that start with a native binding
		-- most people should not need to change this
		i = { "j", "k" },
		v = { "j", "k" },
	},
	-- disable the WhichKey popup for certain buf types and file types.
	-- Disabled by deafult for Telescope
	disable = {
		buftypes = {},
		filetypes = { "TelescopePrompt" },
	},
}

local mappings = {
	["e"] = { "<cmd>NvimTreeToggle<CR>", "Toggle file explorer" },
	["o"] = { "<cmd>NvimTreeFocus<CR>", "Focus file explorer" },
	["c"] = { "<cmd>tabclose<CR>", "Close current buffer" }, -- I don't need every file at once

	f = {
		name = "Search",
		f = { "<cmd>Telescope find_files<cr>", "Find files" }, -- Find files within current working directory, respects .gitignore
		s = { "<cmd>Telescope live_grep<cr>", "Find string" }, -- Find string in current working directory as you type
		c = { "<cmd>Telescope grep_string<cr>", "Find string under cursor" }, -- Find string under cursor in current working directory
		b = { "<cmd>Telescope buffers<cr>", "List open buffers" }, -- List open buffers in current neovim instance
		h = { "<cmd>Telescope help_tags<cr>", "List available help tags" },
		C = { "<cmd>nohl<CR>", "Clear search highlighting" },
	},

	z = {
		name = "Packer",
		c = { "<cmd>PackerCompile<cr>", "Compile" },
		i = { "<cmd>PackerInstall<cr>", "Install" },
		s = { "<cmd>PackerSync<cr>", "Sync" },
		S = { "<cmd>PackerStatus<cr>", "Status" },
		u = { "<cmd>PackerUpdate<cr>", "Update" },
	},

	s = {
		name = "Split",
		v = { "<C-w>v", "Split vertically" },
		h = { "<C-w>h", "Split horizontally" },
		e = { "<C-w>=", "Equal window size" },
		x = { "<cmd>close<CR>", "Close current split" },
		m = { "<cmd>MaximizerToggle<CR>", "Maximise current split" },
	},

	l = {
		name = "LSP",
		a = { "<cmd>Lspsaga code_action<CR>", "Code actions" }, -- see available code actions
		r = { "<cmd>Lspsaga rename<CR>", "Smart rename" }, -- smart rename
		D = { "<cmd>Lspsaga show_line_diagnostics<CR>", "Line diagnostics" }, -- show  diagnostics for line
		d = { "<cmd>Lspsaga show_cursor_diagnostics<CR>", "Cursor diagnostics" }, -- show diagnostics for cursor
		o = { "<cmd>Lspsaga outline<CR>", "Outline" }, -- see outline on right hand side
	},

	t = {
		name = "Tabs",
		o = { "<cmd>tabnew<CR>", "New tab" }, -- since when did I only work on a single file at a time...?
	},

	g = {
		name = "Git",
		s = { "<cmd>Neogit<CR>", "Status" },
	},
}

local opts = {
	mode = "n", -- Normal mode
	prefix = "<leader>",
	buffer = nil, -- Global mappings. Specify a buffer number for buffer local mappings
	silent = true, -- use `silent` when creating keymaps
	noremap = true, -- use `noremap` when creating keymaps
	nowait = false, -- use `nowait` when creating keymaps
}

which_key.setup(setup)
which_key.register(mappings, opts)
