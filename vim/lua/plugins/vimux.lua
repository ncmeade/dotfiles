return {
	"preservim/vimux",
	config = function()
		vim.g.VimuxPromptString = "> "
		vim.g.VimuxOrientation = "v"
		vim.g.VimuxHeight = "40%"

		vim.keymap.set("n", "<Leader>vp", ":VimuxPromptCommand<CR>", { desc = "[V]imux [P]rompt Command" })
		vim.keymap.set("n", "<Leader>vr", ":VimuxRunLastCommand<CR>", { desc = "[V]imux [R]un Last Command" })
		vim.keymap.set("n", "<Leader>vo", ":VimuxOpenRunner<CR>", { desc = "[V]imux [O]pen Runner" })
		vim.keymap.set("n", "<Leader>vq", ":VimuxCloseRunner<CR>", { desc = "[V]imux [Q]uit Runner" })
		vim.keymap.set("n", "<Leader>vl", ":VimuxClearTerminalScreen<CR>", { desc = "[V]imux C[L]ear Screen" })
		vim.keymap.set("n", "<Leader>vi", ":VimuxInterruptRunner<CR>", { desc = "[V]imux [I]nterrupt Runner" })
	end,
}
