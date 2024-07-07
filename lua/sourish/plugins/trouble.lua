return {
	"folke/trouble.nvim",
	dependencies = { "DaikyXendo/nvim-material-icon", "folke/todo-comments.nvim" },
	opts = {}, -- for default options, refer to the configuration section for custom setup.
	cmd = "Trouble",
	keys = {
		{
			"<leader>td",
			"<cmd>Trouble diagnostics toggle focus=true<cr>",
			desc = "Diagnostics (Trouble)",
		},
		{
			"<leader>tb",
			"<cmd>Trouble diagnostics toggle filter.buf=0<cr>",
			desc = "Buffer Diagnostics (Trouble)",
		},
		{
			"<leader>ts",
			"<cmd>Trouble symbols toggle focus=true<cr>",
			desc = "Symbols (Trouble)",
		},
		{
			"<leader>tl",
			"<cmd>Trouble lsp toggle focus=true win.position=right<cr>",
			desc = "LSP Definitions / references / ... (Trouble)",
		},
		{
			"<leader>to",
			"<cmd>Trouble loclist toggle<cr>",
			desc = "Location List (Trouble)",
		},

		{
			"<leader>tq",
			"<cmd>Trouble qflist toggle<cr>",
			desc = "Quickfix List (Trouble)",
		},
		{ "<leader>tm", "<cmd>Trouble<cr>", desc = "Trouble menu" },
	},
}
