vim.g.mapleader = " "

local keymap = vim.keymap

keymap.set("i", "jk", "<ESC>", { desc = "Exit insert mode with jk" })
keymap.set("n", "<leader>/", ":nohl<CR>", { desc = "Clear search highlights" })

-- window management
keymap.set("n", "<leader>sv", "<C-w>v", { desc = "Split window vertically" })
keymap.set("n", "<leader>sh", "<C-w>s", { desc = "Split window horizontally" })
keymap.set("n", "<leader>se", "<C-w>=", { desc = "Make splits equal size" })
keymap.set("n", "<leader>sc", "<cmd>close<CR>", { desc = "Close current split" })

-- buffer management see bufferline.lua for more bindings
keymap.set("n", "<leader>x", "<cmd>bd<CR>", { desc = "Close current buffer" })

-- Remap 'j' and 'k' to handle wrapped lines in both normal and visual modes
keymap.set("n", "j", "gj")
keymap.set("n", "k", "gk")
keymap.set("v", "j", "gj")
keymap.set("v", "k", "gk")

-- background picker
keymap.set("n", "<leader>fb", function()
	require("sourish.scripts.colorscheme-picker").find_background()
end, { desc = "Select background" })

-- Save file using Ctrl+S in all modes and go to normal mode after saving in insert mode
keymap.set({ "n", "i", "v" }, "<C-s>", function()
	vim.cmd("write")
	if vim.fn.mode() == "i" then
		vim.cmd("stopinsert")
	end
end, { noremap = true, silent = true })
