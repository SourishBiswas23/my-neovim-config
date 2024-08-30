return {
	"romgrk/barbar.nvim",
	dependencies = {
		"lewis6991/gitsigns.nvim",
		"DaikyXendo/nvim-material-icon",
	},
	init = function()
		vim.g.barbar_auto_setup = false
	end,
	opts = function()
		local keymap = vim.keymap
		-- Keybindings to go to specific buffers using Alt + number
		for i = 1, 9 do
			keymap.set(
				"n",
				"<A-" .. i .. ">",
				"<Cmd>BufferGoto " .. i .. "<CR>",
				{ silent = true, desc = "Go to buffer " .. i }
			)
		end

		keymap.set("n", "<A-0>", "<Cmd>BufferLast<CR>", { silent = true, desc = "Go to last buffer" })
		keymap.set("n", "<A-h>", "<Cmd>BufferPrevious<CR>", { silent = true, desc = "Go to previous buffer" })
		keymap.set("n", "<A-l>", "<Cmd>BufferNext<CR>", { silent = true, desc = "Go to next buffer" })

		return {
			tabpages = true,
			icons = {
				-- Configure the base icons on the bufferline.
				-- Valid options to display the buffer index and -number are `true`, 'superscript' and 'subscript'
				buffer_index = false,
				buffer_number = false,
				button = "",
				-- Enables / disables diagnostic symbols
				diagnostics = {
					[vim.diagnostic.severity.ERROR] = { enabled = true, icon = "ﬀ" },
					[vim.diagnostic.severity.WARN] = { enabled = false },
					[vim.diagnostic.severity.INFO] = { enabled = false },
					[vim.diagnostic.severity.HINT] = { enabled = true },
				},
				gitsigns = {
					added = { enabled = true, icon = "+" },
					changed = { enabled = true, icon = "~" },
					deleted = { enabled = true, icon = "-" },
				},
				filetype = {
					-- Sets the icon's highlight group.
					-- If false, will use nvim-web-devicons colors
					custom_colors = false,

					-- Requires `nvim-web-devicons` if `true`
					enabled = true,
				},
				separator = { left = "▎", right = "" },

				-- If true, add an additional separator at the end of the buffer list
				separator_at_end = true,

				-- Configure the icons on the bufferline when modified or pinned.
				-- Supports all the base icon options.
				modified = { button = "●" },
				pinned = { button = "", filename = true },

				-- Use a preconfigured buffer appearance— can be 'default', 'powerline', or 'slanted'
				preset = "default",

				-- Configure the icons on the bufferline based on the visibility of a buffer.
				-- Supports all the base icon options, plus `modified` and `pinned`.
				alternate = { filetype = { enabled = false } },
				current = { buffer_index = true },
				inactive = { button = "×" },
				visible = { modified = { buffer_number = false } },
			},
			sidebar_filetypes = {
				-- Use the default values: {event = 'BufWinLeave', text = '', align = 'left'}
				NvimTree = true,
				-- Or, specify the text used for the offset:
				undotree = {
					text = "undotree",
					align = "center", -- *optionally* specify an alignment (either 'left', 'center', or 'right')
				},
				-- Or, specify the event which the sidebar executes when leaving:
				["neo-tree"] = { event = "BufWipeout" },
				-- Or, specify all three
				Outline = { event = "BufWinLeave", text = "symbols-outline", align = "right" },
			},
		}
	end,
}
