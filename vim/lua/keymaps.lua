-- Clear highlights on search when pressing <Esc> in normal mode
-- See `:help hlsearch`
vim.keymap.set("n", "<Esc>", "<Cmd>nohlsearch<CR>")

-- Buffer management
vim.keymap.set("n", "<Leader>bn", ":bn<CR>")
vim.keymap.set("n", "<Leader>bp", ":bp<CR>")
vim.keymap.set("n", "<Leader>ba", ":badd ")
vim.keymap.set("n", "<Leader>bd", ":bd<CR>")

-- Netrw
vim.keymap.set("n", "<Leader>nt", ":Lexplore<CR>")

-- Quickfix list
vim.keymap.set("n", "<Leader>qo", ":copen<CR>")
vim.keymap.set("n", "<Leader>qc", ":cclose<CR>")
vim.keymap.set("n", "<Leader>qn", ":cnext<CR>")
vim.keymap.set("n", "<Leader>qp", ":cprev<CR>")

-- Insert Python debug breakpoint
vim.keymap.set("n", "<Leader>di", "i breakpoint()<Esc>==^")

-- Easy save
vim.keymap.set("n", "<Leader>w", ":w<CR>")
