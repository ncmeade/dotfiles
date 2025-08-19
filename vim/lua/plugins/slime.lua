return {
	"jpalardy/vim-slime",
	init = function()
		-- These need to be set before the plugin loads.
		vim.g.slime_target = "tmux"
		vim.g.slime_no_mappings = true
	end,
	config = function()
		vim.g.slime_bracketed_paste = true

		vim.keymap.set("n", "<Leader>s", "<Plug>SlimeMotionSend", { remap = true, silent = false })
		vim.keymap.set("n", "<Leader>ss", "<Plug>SlimeLineSend", { remap = true, silent = false })
		vim.keymap.set("v", "<Leader>s", "<Plug>SlimeRegionSend", { remap = true, silent = false })
	end,
}
