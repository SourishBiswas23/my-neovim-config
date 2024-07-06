return {
	"nvim-lualine/lualine.nvim",
	dependencies = { "DaikyXendo/nvim-material-icon" },
	config = function()
		local lualine = require("lualine")
		local lazy_status = require("lazy.status")
		lualine.setup({
			options = {
				theme = "nightfly",
				globalstatus = true,
				component_separators = { left = "", right = "" },
			},
			sections = {
				lualine_a = { "mode" },
				lualine_b = {
					"branch",
					{
						"diff",
						cond = function()
							return vim.b.gitsigns_head ~= nil
						end,
					},
					"diagnostics",
				},
				lualine_c = { "searchcount" },
				lualine_x = {
					{
						lazy_status.updates,
						cond = lazy_status.has_updates,
						color = { fg = "#ff9e64" },
					},
					{ "encoding" },
					{ "fileformat" },
					{ "filetype" },
				},
				lualine_y = { "progress" },
				lualine_z = { "location" },
			},
		})
	end,
}
