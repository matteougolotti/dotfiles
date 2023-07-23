-- Reference
-- https://dev.to/slydragonn/how-to-set-up-neovim-for-windows-and-linux-with-lua-and-packer-2391

require("settings")
require("plugins")
require("maps")

local themeStatus, kanagawa = pcall(require, "kanagawa")

if themeStatus then
    vim.cmd("colorscheme kanagawa")
else
    return
end
