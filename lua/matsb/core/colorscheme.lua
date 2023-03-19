local scheme = "colorscheme OceanicNext"
local status, _ = pcall(vim.cmd, scheme)

if not status then
	print("You forgot to install the colours, dummy...")
end
