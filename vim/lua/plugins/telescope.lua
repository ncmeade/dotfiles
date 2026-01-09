return {
	{
		"nvim-telescope/telescope.nvim",
		event = "VimEnter",
		dependencies = {
			"nvim-lua/plenary.nvim",
			{ -- If encountering errors, see telescope-fzf-native README for installation instructions
				"nvim-telescope/telescope-fzf-native.nvim",

				-- `build` is used to run some command when the plugin is installed/updated.
				-- This is only run then, not every time Neovim starts up.
				build = "make",

				-- `cond` is a condition used to determine whether this plugin should be
				-- installed and loaded.
				cond = function()
					return vim.fn.executable("make") == 1
				end,
			},
			{ "nvim-telescope/telescope-ui-select.nvim" },

			{ "nvim-tree/nvim-web-devicons", enabled = vim.g.have_nerd_font },
		},
		config = function()
			require("telescope").setup({
				extensions = {
					["ui-select"] = {
						require("telescope.themes").get_dropdown(),
					},
				},
			})

			-- Enable Telescope extensions if they are installed
			pcall(require("telescope").load_extension, "fzf")
			pcall(require("telescope").load_extension, "ui-select")

			local builtin = require("telescope.builtin")
			vim.keymap.set("n", "<Leader>ff", builtin.find_files, { desc = "[F]ind [F]iles" })
			vim.keymap.set("n", "<Leader>fg", builtin.git_files, { desc = "[F]ind [G]it Files" })
			vim.keymap.set("n", "<Leader>fl", builtin.live_grep, { desc = "[F]ind [L]ines by Grep" })
			vim.keymap.set("n", "<Leader>fb", builtin.buffers, { desc = "[F]ind [B]uffers" })
			vim.keymap.set("n", "<Leader>fh", builtin.help_tags, { desc = "[F]ind [H]elp" })
			vim.keymap.set("n", "<Leader>fk", builtin.keymaps, { desc = "[F]ind [K]eymaps" })
			vim.keymap.set("n", "<leader>fd", builtin.diagnostics, { desc = "[F]ind [D]iagnostics" })

			vim.keymap.set("n", "<Leader>f/", function()
				builtin.current_buffer_fuzzy_find(require("telescope.themes").get_dropdown({
					winblend = 10,
					previewer = false,
				}))
			end, { desc = "[F]uzzily [/] find in current buffer" })

			-- Search Neovim configuration files
			vim.keymap.set("n", "<Leader>fc", function()
				builtin.find_files({
					cwd = vim.fn.stdpath("config"),
					prompt_title = "Config Files",
				})
			end, { desc = "[F]ind [C]onfig Files" })

			-- Search personal journal files
			vim.keymap.set("n", "<Leader>fn", function()
				builtin.live_grep({
					cwd = vim.fn.expand("~/rs/note"),
					type_filter = "md",
					prompt_title = "Note Files",
				})
			end, { desc = "[F]ind [N]ote Files" })
		end,
	},
}
