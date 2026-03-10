-- ~/.config/nvim/lua/nconf/init.lua

vim.g.mapleader = " "
vim.env.PATH = vim.fn.expand("~/.cargo/bin") .. ":" .. vim.env.PATH

require("nconf.lazy_init")
require("nconf.set")
require("nconf.remap")
