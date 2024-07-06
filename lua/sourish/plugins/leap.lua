return {
	"ggandor/leap.nvim",
	config = function()
		require("leap").create_default_mappings()
		require("leap").init_highlight(true)
		-- vim.api.nvim_set_hl(0, "LeapLabelPrimary", { fg = "#ff00ff", bg = "none", bold = true })
		-- vim.api.nvim_set_hl(0, "LeapLabelSecondary", { fg = "#00ff00", bg = "none", bold = true })
		-- vim.api.nvim_set_hl(0, "LeapBackdrop", { fg = "#555555" })
	end,
}
