return {
	"mbbill/undotree",
	keys = {
		{ "<leader>u", ":UndotreeToggle<CR><cmd>UndotreeFocus<CR>", desc = "Toggle and focus UndoTree" },
		-- { "<leader>uh", ":UndotreeHide<CR>", desc = "Hide UndoTree" },
	},
	config = function()
		local has_persistent_undo = vim.fn.has("persistent_undo")
		if has_persistent_undo == 1 then
			local target_path = vim.fn.expand("~/.undodir")
			-- create the directory if it doesn't exist
			if vim.fn.isdirectory(target_path) == 0 then
				vim.fn.mkdir(target_path, "p", 0700)
			end
			vim.opt.undodir = target_path
			vim.opt.undofile = true
		end
	end,
}
