return {
	"nvim-tree/nvim-tree.lua",
	dependencies = "DaikyXendo/nvim-material-icon",
	config = function()
		local nvimtree = require("nvim-tree")

		-- recommended settings from nvim-tree documentation
		-- disable netrw
		vim.g.loaded_netrw = 1
		vim.g.loaded_netrwPlugin = 1

		nvimtree.setup({
			view = {
				width = 35,
				relativenumber = true,
			},
			-- focus currently active file
			update_focused_file = {
				enable = true,
				update_root = {
					enable = true,
				},
			},
			-- change folder arrow icons
			renderer = {
				special_files = { "Cargo.toml", "Makefile", "README.md", "readme.md", ".gitignore" },

				-- Enable indent markers for a similar folder structure appearance
				indent_markers = {
					enable = true,
				},

				-- Highlight settings
				highlight_git = true,
				highlight_diagnostics = "name",
				highlight_modified = "name",

				-- VS Code-like icons configuration
				icons = {
					show = {
						folder = true,
						file = true,
						git = true,
						folder_arrow = true,
					},
					glyphs = {
						default = "", -- VS Code-style icon for files
						symlink = "", -- VS Code-style icon for symlinks
						bookmark = "",
						folder = {
							default = "", -- Closed folder icon
							open = "", -- Open folder icon
							empty = "", -- Empty closed folder icon
							empty_open = "", -- Empty open folder icon
							symlink = "", -- Symlink folder icon
							symlink_open = "",
						},
						git = {
							unstaged = "✗",
							staged = "✓",
							unmerged = "",
							renamed = "➜",
							untracked = "★",
							deleted = "",
							ignored = "◌",
						},
					},
				},
			},

			diagnostics = {
				enable = true,
				show_on_dirs = true, -- Show diagnostics on directories
			},

			modified = {
				enable = true, -- Show modified indicators
			},

			actions = {
				open_file = {
					window_picker = {
						enable = false, -- Disable window picker for better splits management
					},
				},
			},

			filters = {
				custom = { ".DS_Store" }, -- Exclude custom files/directories
			},

			git = {
				ignore = false, -- Show git-ignored files
			},
		})

		-- set keymaps
		local keymap = vim.keymap -- for conciseness

		keymap.set("n", "<leader>e", "<cmd>NvimTreeToggle<CR>", { desc = "Toggle file explorer" }) -- toggle file explorer
		--    keymap.set("n", "<leader>ef", "<cmd>NvimTreeFindFileToggle<CR>", { desc = "Toggle file explorer on current file" }) -- toggle file explorer on current file
		--    keymap.set("n", "<leader>ec", "<cmd>NvimTreeCollapse<CR>", { desc = "Collapse file explorer" }) -- collapse file explorer
		--    keymap.set("n", "<leader>er", "<cmd>NvimTreeRefresh<CR>", { desc = "Refresh file explorer" }) -- refresh file explorer
	end,
}
