local treesitter_status, treesitter = pcall(require, "nvim-treesitter.configs")
if not treesitter_status then
	return
end

treesitter.setup({
	highlights = {
		enable = true,
	},
	indent = {
		enable = true,
	},
	autotag = {
		enable = true,
	},
	ensure_installed = {
		"json",
		"java",
		"javascript",
		"html",
		"css",
		"cmake",
		"cpp",
		"c",
		"python",
		"lua",
		"latex",
	},
	auto_install = true,
})

local opt = vim.opt
opt.foldlevel = 20
opt.foldmethod = "expr"
opt.foldexpr = "nvim_treesitter#foldexpr()"
