return {
	"tpope/vim-fugitive",
	config = function()
		vim.keymap.set("n", "<Leader>gs", ":Git<CR>")
		vim.keymap.set("n", "<Leader>gl", ":Git log<CR>")
	end,
}
