local status, _ = pcall(vim.cmd, "colorscheme nightfly")

if not status then
    print("You forgot to install the colours, dummy...")
end
