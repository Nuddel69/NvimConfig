local setup, nvimtree = pcall(require, "nvim-tree")
if not setup then
	return
end

vim.g.loaded = 1
vim.g.loaded_netrwPlugin = 1

nvimtree.setup({
	sort_by = "case_sensitive",
	view = {
		adaptive_size = true,
		mappings = {
			list = {
				{ key = "u", action = "dir_up" },
			},
		},
	},
	renderer = {
		group_empty = true,
		add_trailing = true,
	},
	filters = {
		dotfiles = true,
	},

	tab = {
		sync = {
			open = true,
			close = true,
		},
	},
})
