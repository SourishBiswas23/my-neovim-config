return {
	"folke/noice.nvim",
	event = "VeryLazy",
	dependencies = {
		-- if you lazy-load any plugin below, make sure to add proper `module="..."` entries
		"MunifTanjim/nui.nvim",
		-- OPTIONAL:
		--   `nvim-notify` is only needed, if you want to use the notification view.
		--   If not available, we use `mini` as the fallback
		"rcarriga/nvim-notify",
	},

	opts = function()
		local noice = require("noice")
		noice.setup({
			lsp = {
				-- override markdown rendering so that **cmp** and other plugins use **Treesitter**
				override = {
					["vim.lsp.util.convert_input_to_markdown_lines"] = true,
					["vim.lsp.util.stylize_markdown"] = true,
					["cmp.entry.get_documentation"] = true, -- requires hrsh7th/nvim-cmp
				},
				documentation = {
					view = "hover",
					opts = { -- lsp_docs settings
						lang = "markdown",
						replace = true,
						render = "plain",
						format = { "{message}" },
						position = { row = 2, col = 2 },
						size = {
							max_width = 0.8 * vim.api.nvim_win_get_width(0),
							max_height = 15,
						},
						border = {
							style = "rounded",
						},
						win_options = {
							concealcursor = "n",
							conceallevel = 3,
							winhighlight = {
								Normal = "CmpPmenu",
								FloatBorder = "DiagnosticSignInfo",
							},
						},
					},
				},
			},
			-- you can enable a preset for easier configuration
			presets = {
				bottom_search = true, -- use a classic bottom cmdline for search
				command_palette = false, -- position the cmdline and popupmenu together
				long_message_to_split = true, -- long messages will be sent to a split
				inc_rename = false, -- enables an input dialog for inc-rename.nvim
				lsp_doc_border = false, -- add a border to hover docs and signature help
			},
		})

		local notify = require("notify")

		---@diagnostic disable-next-line: missing-fields
		notify.setup({
			background_colour = "#000000",
			icons = {
				ERROR = " ",
				WARN = " ",
				INFO = " ",
				DEBUG = " ",
				TRACE = "✎ ",
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
