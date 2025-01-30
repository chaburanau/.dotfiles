return {
	"nvim-telescope/telescope.nvim",
	branch = "0.1.x",
	event = "VimEnter",
	dependencies = {
		"nvim-lua/plenary.nvim",
		"nvim-tree/nvim-web-devicons",
		"nvim-telescope/telescope-ui-select.nvim",
		{
			"nvim-telescope/telescope-fzf-native.nvim",
			build = "make",
			cond = function()
				return vim.fn.executable("make") == 1
			end,
		},
	},
	config = function()
		require("telescope").setup({
			extensions = {
				["ui-select"] = {
					require("telescope.themes").get_dropdown(),
				},
			},
		})

		pcall(require("telescope").load_extension, "fzf")
		pcall(require("telescope").load_extension, "ui-select")

		local telescope = require("telescope.builtin")
		vim.keymap.set("n", "<leader>sh", telescope.help_tags, { desc = "[s]earch [h]elp" })
		vim.keymap.set("n", "<leader>sk", telescope.keymaps, { desc = "[s]earch [k]eymaps" })
		vim.keymap.set("n", "<leader>sf", telescope.find_files, { desc = "[s]earch [f]iles" })
		vim.keymap.set("n", "<leader>ss", telescope.builtin, { desc = "[s]earch [s]elect Telescope" })
		vim.keymap.set("n", "<leader>sw", telescope.grep_string, { desc = "[s]earch current [w]ord" })
		vim.keymap.set("n", "<leader>sg", telescope.live_grep, { desc = "[s]earch by [g]rep" })
		vim.keymap.set("n", "<leader>sd", telescope.diagnostics, { desc = "[s]earch [d]iagnostics" })
		vim.keymap.set("n", "<leader>sr", telescope.resume, { desc = "[s]earch [r]esume" })
		vim.keymap.set("n", "<leader>s.", telescope.oldfiles, { desc = '[s]earch Recent Files ("." for repeat)' })
		vim.keymap.set("n", "<leader><leader>", telescope.buffers, { desc = "[ ] Find existing buffers" })

		vim.keymap.set("n", "<leader>s/", function()
			telescope.live_grep({
				grep_open_files = true,
				prompt_title = "Live Grep in Open Files",
			})
		end, { desc = "[s]earch [/] in Open Files" })

		vim.keymap.set("n", "<leader>sn", function()
			telescope.find_files({ cwd = vim.fn.stdpath("config") })
		end, { desc = "[s]earch [n]eovim files" })
	end,
}
