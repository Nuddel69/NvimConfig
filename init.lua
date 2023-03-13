-- Core
require("matsb.plugins-setup")
require("matsb.core.options")
require("matsb.core.keymaps")
require("matsb.core.colorscheme")

-- Plugins
require("matsb.plugins.comment")
require("matsb.plugins.arduino")
require("matsb.plugins.nvim-tree")
require("matsb.plugins.lualine")
require("matsb.plugins.telescope")
require("matsb.plugins.which-key")
require("matsb.plugins.nvim-cmp")
require("matsb.plugins.autopairs")
require("matsb.plugins.treesitter")
require("matsb.plugins.gitsigns")

-- LSP
require("matsb.plugins.lsp.mason")
require("matsb.plugins.lsp.lspsaga")
require("matsb.plugins.lsp.lspconfig")
require("matsb.plugins.lsp.null-ls")
