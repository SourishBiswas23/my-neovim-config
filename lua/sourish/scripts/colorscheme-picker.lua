local M = {}

local pickers = require("telescope.pickers")
-- to feed input to the pickers
local finders = require("telescope.finders")
-- to filter the results while typing
local sorters = require("telescope.sorters")
local actions = require("telescope.actions")
local action_state = require("telescope.actions.state")
local dropdown = require("telescope.themes").get_dropdown()

local function colorscheme_preview()
	local selected = action_state.get_selected_entry()
	if selected then
		local cmd = "colorscheme " .. selected[1]
		vim.cmd(cmd)
	end
end

local function next_colorscheme_preview(prompt_bufnr)
	actions.move_selection_next(prompt_bufnr)
	colorscheme_preview()
end

local function previous_colorscheme_preview(prompt_bufnr)
	actions.move_selection_previous(prompt_bufnr)
	colorscheme_preview()
end

local function save_colorscheme(prompt_bufnr)
	local selected = action_state.get_selected_entry()
	local colorscheme = selected[1]
	local config_file = vim.fn.stdpath("config") .. "/colorscheme.lua"
	local file = io.open(config_file, "w")

	if file then
		file:write(string.format('vim.cmd("colorscheme %s")', colorscheme))
		file:close()
	end
	actions.close(prompt_bufnr)
end

-- list of all the colorschemes installed in neovim
local colorschemes = vim.fn.getcompletion("", "color")

local opts = {
	finder = finders.new_table(colorschemes),
	sorter = sorters.get_generic_fuzzy_sorter({}),

	attach_mappings = function(prompt_bufnr, map)
		map("i", "<CR>", save_colorscheme)
		map("i", "<C-j>", next_colorscheme_preview)
		map("i", "<Tab>", next_colorscheme_preview)
		map("i", "<C-n>", next_colorscheme_preview)
		map("i", "<C-k>", previous_colorscheme_preview)
		map("i", "<S-Tab>", previous_colorscheme_preview)
		map("i", "<C-p>", previous_colorscheme_preview)
		map("i", "<Down>", next_colorscheme_preview)
		map("i", "<Up>", previous_colorscheme_preview)
		-- for normal mode
		map("n", "<CR>", save_colorscheme)
		map("n", "<C-j>", next_colorscheme_preview)
		map("n", "<Tab>", next_colorscheme_preview)
		map("n", "<C-n>", next_colorscheme_preview)
		map("n", "<C-k>", previous_colorscheme_preview)
		map("n", "<S-Tab>", previous_colorscheme_preview)
		map("n", "<C-p>", previous_colorscheme_preview)
		map("n", "<Down>", next_colorscheme_preview)
		map("n", "<Up>", previous_colorscheme_preview)
		map("n", "<Down>", next_colorscheme_preview)
		map("n", "<Up>", previous_colorscheme_preview)
		map("n", "j", next_colorscheme_preview)
		map("n", "k", previous_colorscheme_preview)

		-- preview on each keystroke
		vim.api.nvim_buf_attach(prompt_bufnr, false, {
			on_lines = function()
				vim.schedule(function()
					colorscheme_preview()
				end)
			end,
		})

		return true
	end,
}

function M.find_background()
	local colors = pickers.new(dropdown, opts)
	colors:find()
end

return M
