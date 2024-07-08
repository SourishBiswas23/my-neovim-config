return {
	"rcarriga/nvim-notify",
	config = function()
		local notify = require("notify")

		---@diagnostic disable-next-line: missing-fields
		notify.setup({
			background_colour = "#000000",
			icons = {
				ERROR = "",
				WARN = "",
				INFO = "",
				DEBUG = "",
				TRACE = "✎",
			},
		})

		-- Optionally set as default notifier
		vim.notify = notify

		-- Map the dismiss function to a keybinding (e.g., <leader>nd)
		vim.keymap.set("n", "<leader>nd", function()
			notify.dismiss({ pending = false, silent = false })
		end, { desc = "Dismiss notifications" })

		vim.keymap.set("n", "<leader>nh", function()
			notify.history()
		end, { desc = "View notification history" })
	end,
}
