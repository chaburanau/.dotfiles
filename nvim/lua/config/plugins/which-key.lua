return {
	"folke/which-key.nvim",
	event = "VimEnter",
	opts = {
		delay = 0,
		icons = {
			mappings = vim.g.have_nerd_font,
		},
		spec = {
			{ "<leader>c", group = "[c]ode", mode = { "n", "x" } },
			{ "<leader>d", group = "[d]ocument" },
			{ "<leader>r", group = "[r]ename" },
			{ "<leader>s", group = "[s]earch" },
			{ "<leader>w", group = "[w]orkspace" },
			{ "<leader>t", group = "[t]oggle" },
			{ "<leader>h", group = "Git [h]unk", mode = { "n", "v" } },
		},
	},
}
