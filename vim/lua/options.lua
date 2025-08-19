-- Make line numbers default
vim.o.number = true

-- Enable mouse mode
vim.o.mouse = 'a'

-- Sync clipboard between OS and Neovim.
-- Schedule the setting after `UiEnter` because it can increase startup-time.
-- Remove this option if you want your OS clipboard to remain independent.
-- See `:help 'clipboard'`
vim.schedule(function()
	vim.o.clipboard = 'unnamedplus'
end)

-- Use cursorline to show position in file
vim.o.cursorline = true

-- Set a vertical guide
vim.o.colorcolumn = '88'

-- Use four space tabs
vim.o.tabstop = 4
vim.o.shiftwidth = 4
vim.o.expandtab = true

-- Set Netrw to use 20% of the width
vim.g.netrw_winsize = 20

-- You do not need to save before changing buffers
vim.g.hidden = true

-- Keep signcolumn on by default
vim.o.signcolumn = 'yes'

-- Case-insensitive searching UNLESS \C or one or more capital letters in the search term
vim.o.ignorecase = true
vim.o.smartcase = true

-- Better search
vim.o.hlsearch = true
vim.o.incsearch = true

-- Decrease mapped sequence wait time
vim.o.timeoutlen = 400

-- Use big cursor
vim.o.guicursor = ''

-- Don't use swapfiles
vim.o.swapfile = false

-- Better colours
vim.o.termguicolors = true
