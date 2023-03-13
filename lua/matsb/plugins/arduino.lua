local arduin_status, arduino = pcall(require, "vim-arduino")
if not arduin_status then
	return
end

arduino.setup()
