return {
	"lewis6991/gitsigns.nvim",
	opts = {
		signs = {
			add = { text = "+" },
			change = { text = "~" },
			delete = { text = "_" },
			topdelete = { text = "‾" },
			changedelete = { text = "~" },
		},
	},
	config = function()
		local gitsigns = require("gitsigns")
		gitsigns.setup({})

		vim.keymap.set("n", "<leader>hp", gitsigns.preview_hunk, { desc = "[h]unk [p]review hunk" })
		vim.keymap.set("n", "<leader>hs", gitsigns.stage_hunk, { desc = "[h]unk [s]tage hunk" })
		vim.keymap.set("n", "<leader>hr", gitsigns.reset_hunk, { desc = "[h]unk [r]eset hunk" })
		vim.keymap.set("n", "<leader>hS", gitsigns.stage_buffer, { desc = "[h]unk [S]tage buffer" })
		vim.keymap.set("n", "<leader>hR", gitsigns.reset_buffer, { desc = "[h]unk [R]eset buffer" })
		vim.keymap.set("n", "<leader>hu", gitsigns.undo_stage_hunk, { desc = "[h]unk [u]ndo stage hunk" })
		vim.keymap.set(
			"n",
			"<leader>hb",
			gitsigns.toggle_current_line_blame,
			{ desc = "[h]unk toggle current line [b]lame" }
		)
		vim.keymap.set("n", "<leader>hd", gitsigns.diffthis, { desc = "[h]unk [d]iff this" })
		vim.keymap.set("n", "<leader>hD", function()
			gitsigns.diffthis("~")
		end, { desc = "[h]unk [D]iff whole" })

		local stage_selected = function()
			gitsigns.stage_hunk({ vim.fn.line("."), vim.fn.line("v") })
		end
		local reset_selected = function()
			gitsigns.reset_hunk({ vim.fn.line("."), vim.fn.line("v") })
		end

		vim.keymap.set("v", "<leader>hs", stage_selected, { desc = "[h]unk [s]tage hunk" })
		vim.keymap.set("v", "<leader>hr", reset_selected, { desc = "[h]unk [r]eset hunk" })
	end,
}
