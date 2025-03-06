vim.g.mapleader = " "
vim.g.maplocalleader = " "

vim.o.tabstop = 4
vim.o.expandtab = true
vim.o.softtabstop = 4
vim.o.shiftwidth = 4

vim.o.termguicolors = false

vim.o.scrolloff = 8

vim.o.relativenumber = true
vim.o.number = true

vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")

require("core.lazy-setup")
require("core.remap")

vim.cmd("colorscheme rose-pine")
vim.cmd("set spell spelllang=en_us spelloptions=camel")
