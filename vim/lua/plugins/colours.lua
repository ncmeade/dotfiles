return {
	"rose-pine/neovim",
	priority = 1000, -- Make sure to load this before all the other start plugins.
	config = function()
		---@diagnostic disable-next-line: missing-fields
		require("rose-pine").setup({
			styles = {
				comments = { italic = false }, -- Disable italics in comments
			},
		})
		-- Load the colorscheme here.
		vim.cmd.colorscheme("rose-pine")
	end,
}
