return {
	"rachartier/tiny-inline-diagnostic.nvim",
	event = "VeryLazy",
	config = function()
		require("tiny-inline-diagnostic").setup()
		--Remove the virtual text
		vim.diagnostic.config({ virtual_text = false })
	end,
}
