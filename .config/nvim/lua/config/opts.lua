vim.g.mapleader = " " -- Use Space as your leader key

local opt = vim.opt
opt.number = true      -- Line numbers
opt.relativenumber = false 
opt.shiftwidth = 4     -- Tab size
opt.expandtab = false   -- Use spaces instead of tabs
opt.ignorecase = false  -- Search case-insensitive...
opt.smartcase = true   -- ...unless I use a capital letter
opt.termguicolors = true
vim.opt.hlsearch = false
vim.g.mapleader = "\\"
