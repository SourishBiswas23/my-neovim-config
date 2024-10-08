return {
	"mfussenegger/nvim-lint",
	event = { "BufReadPre", "BufNewFile" },
	config = function()
		local lint = require("lint")

		-- Configure eslint_d
		-- lint.linters.eslint_d.args = {
		-- 	"--no-warn-ignored",
		-- 	"--format",
		-- 	"json",
		-- 	"--stdin",
		-- 	"--stdin-filename",
		-- 	function()
		-- 		return vim.api.nvim_buf_get_name(0)
		-- 	end,
		-- }

		lint.linters_by_ft = {
			-- javascript = { "eslint_d" },
			-- typescript = { "eslint_d" },
			-- javascriptreact = { "eslint_d" },
			-- typescriptreact = { "eslint_d" },
			-- svelte = { "eslint_d" },
			-- python = { "pylint" },
			sh = { "shellcheck" },
			bash = { "shellcheck" },
			c = { "cpplint" },
			cpp = { "cpplint" },
			python = { "flake8" },
		}

		local lint_augroup = vim.api.nvim_create_augroup("lint", { clear = true })
		vim.api.nvim_create_autocmd({ "BufEnter", "BufWritePost", "InsertLeave" }, {
			group = lint_augroup,
			callback = function()
				lint.try_lint()
			end,
		})

		vim.keymap.set("n", "<leader>ll", function()
			lint.try_lint()
			-- lsp inspect is used as pneumonic
		end, { desc = "Linting current file (Lsp Inspect)" })
	end,
}
