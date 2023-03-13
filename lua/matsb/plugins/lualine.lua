local status, lualine = pcall(require, "lualine")
if not status then
	return
end

local lualine_nightfly = require("lualine.themes.nightfly")

local function arduino_status()
	local ft = vim.api.nvim_buf_get_option(0, "ft")
	if ft ~= "arduino" then
		return ""
	end
	local port = vim.fn["arduino#GetPort"]()
	local line = string.format("[%s]", vim.g.arduino_board)
	if vim.g.arduino_programmer ~= "" then
		line = line .. string.format(" [%s]", vim.g.arduino_programmer)
	end
	if port ~= 0 then
		line = line .. string.format(" (%s:%s)", port, vim.g.arduino_serial_baud)
	end
	return line
end

lualine.setup({
	options = {
		theme = lualine_nightfly,
	},
	sections = {
		lualine_c = { "filename", arduino_status },
	},
})
