vim.cmd("let g:netrw_liststyle = 3")

local api = vim.api
local opt = vim.opt

opt.relativenumber = true
opt.number = true

-- tabs and indentation
opt.tabstop = 2 -- 2 spaces for tabs
opt.shiftwidth = 2 -- 2 spaces for indent width
opt.expandtab = true -- expand tab to spaces
opt.autoindent = true -- copy indent from current line when starting new one

-- search settings
opt.ignorecase = true -- ignore case while searching
opt.smartcase = true -- assumes you want case sensitive if mixed cases in search

-- backspace
opt.backspace = "indent,eol,start" -- Allow backspacing over indentation, line breaks, and insertion start

-- split windows
opt.splitright = true -- split vertical window to the right
opt.splitbelow = true -- split horizontal window to the bottom

-- Additional settings
opt.scrolloff = 10 -- Keep at least 10 lines above and below the cursor when scrolling
opt.textwidth = 0 -- Disable automatic line wrapping based on text width
opt.wrapmargin = 0 -- Disable automatic line wrapping based on the wrap margin
opt.wrap = true -- Enable line wrapping
opt.linebreak = true -- Wrap lines at word boundaries rather than in the middle of a word
opt.textwidth = 80 -- Set maximum text width for automatic line wrapping to 80 characters
opt.formatoptions = vim.opt.formatoptions + "t" -- Automatically wrap text at 'textwidth' while typing
opt.clipboard = "" -- Use the default system clipboard setting (usually unnamed)
opt.relativenumber = true -- Show line numbers relative to the current line
opt.signcolumn = "yes" -- Display signcolumn so text doesnt shift
opt.cursorline = true -- Highlight the line where cursor is located
-- opt.background = "dark"    -- Colorschemes with dark version will be made dark
opt.termguicolors = true -- Enable 24-bit RGB color in the terminal

-- Restore cursor position when file is opened
api.nvim_create_autocmd("BufReadPost", {
	pattern = "*",
	callback = function()
		local line = vim.fn.line("'\"")
		if
			line > 1
			and line <= vim.fn.line("$")
			and vim.bo.filetype ~= "commit"
			and vim.fn.index({ "xxd", "gitrebase" }, vim.bo.filetype) == -1
		then
			vim.cmd('normal! g`"')
		end
	end,
})

-- Preserve code folds: save and load view (folds) when opening and closing files
api.nvim_create_autocmd("BufWinLeave", {
	pattern = "?*",
	desc = "Save view (folds) when closing file",
	command = "mkview",
})

api.nvim_create_autocmd("BufWinEnter", {
	pattern = "?*",
	desc = "Load view (folds) when opening file",
	command = "silent! loadview",
})
