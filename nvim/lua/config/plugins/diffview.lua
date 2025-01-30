return {
	"sindrets/diffview.nvim",
	config = function()
		require("diffview").setup({})

		vim.keymap.set("n", "<leader>do", "<cmd>DiffviewOpen<CR>", { desc = "[d]iff [o]pen view" })
		vim.keymap.set("n", "<leader>dc", "<cmd>DiffviewClose<CR>", { desc = "[d]iff [c]close view" })
	end,
}
