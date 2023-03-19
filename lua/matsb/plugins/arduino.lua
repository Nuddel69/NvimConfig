local arduin_status, vim_arduino = pcall(require, "vim-arduino")
if not arduin_status then
	return
end

vim_arduino.setup()

-- local status, arduino = pcall(require, "arduino")
-- if not status then
-- 	return
-- end
--
-- arduino.setup({ clangd = require("mason-core.path").bin_prefix("clangd") })
