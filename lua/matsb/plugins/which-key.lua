local M = {}

function M.setup()
	local whichkey = require("which-key")

	local conf = {
		window = {
			border = "single", -- none, single, double, shadow
			position = "bottom", -- bottom, top
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

	local mappings =
		{
			["w"] = { "<cmd>update!<CR>", "Save" },
			["q"] = { "<cmd>q!<CR>", "Quit" },
			["e"] = { "<cmd>NvimTreeToggle<CR>", "Toggle file explorer" },
			["o"] = { "<cmd>NvimTreeFocus<CR>", "Focus file explorer" },
			["c"] = { "<cmd>tabclose<CR>", "Close current buffer" },

			f = {
				name = "Search",
				f = { "<cmd>Telescope find_files<cr>", "Find files within current working directory, respects .gitignore" },
				s = { "<cmd>Telescope live_grep<cr>", "Find string in current working directory as you type" },
				c = { "<cmd>Telescope grep_string<cr>", "Find string under cursor in current working directory" },
				b = { "<cmd>Telescope buffers<cr>", "List open buffers in current neovim instance" },
				h = { "<cmd>Telescope help_tags<cr>", "List available help tags" },
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

			t = {
				name = "Tabs",
				o = { "<cmd>tabnew<CR>", "New tab" },
			},

			g = {
				name = "Git",
				s = { "<cmd>Neogit<CR>", "Status" },
			},
		}, whichkey.setup(conf)
	whichkey.register(mappings, opts)
end

return M
