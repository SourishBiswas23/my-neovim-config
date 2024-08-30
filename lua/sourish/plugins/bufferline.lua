-- disable bufferline
if true then
	return {}
end

return {
	"akinsho/bufferline.nvim",
	event = "VeryLazy",
	dependencies = { "DaikyXendo/nvim-material-icon" },
	version = "*",
	opts = function()
		local keymap = vim.keymap

		-- Keybindings to go to specific buffers using Alt + number
		for i = 1, 9 do
			keymap.set(
				"n",
				"<A-" .. i .. ">",
				"<Cmd>BufferLineGoToBuffer " .. i .. "<CR>",
				{ silent = true, desc = "Go to buffer " .. i }
			)
		end

		-- Keybinding to go to the 10th buffer using Alt + 0
		keymap.set("n", "<A-0>", "<Cmd>BufferLineGoToBuffer 10<CR>", { silent = true, desc = "Go to buffer 10" })

		-- Keybinding to go to the last buffer using Alt + $
		keymap.set("n", "<A-$>", "<Cmd>BufferLineGoToBuffer -1<CR>", { silent = true, desc = "Go to last buffer" })

		keymap.set("n", "<A-h>", "<Cmd>BufferLineCyclePrev<CR>", { silent = true, desc = "Go to previous buffer" })
		keymap.set("n", "<A-l>", "<Cmd>BufferLineCycleNext<CR>", { silent = true, desc = "Go to next buffer" })
		return {
			options = {
				mode = "buffers",
				numbers = "ordinal",
				separator_style = "thick",
				diagnostics = "nvim_lsp",
				offsets = {
					{
						filetype = "NvimTree",
						text = function()
							return vim.fn.getcwd()
						end,
						highlight = "Directory",
						separator = true,
					},
				},
			},
		}
	end,
}
