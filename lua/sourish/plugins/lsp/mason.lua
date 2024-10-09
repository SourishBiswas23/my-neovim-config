return {
	"williamboman/mason-lspconfig.nvim",
	dependencies = {
		"williamboman/mason.nvim",
		"WhoIsSethDaniel/mason-tool-installer.nvim",
	},
	config = function()
		-- import mason
		local mason = require("mason")

		-- import mason-lspconfig
		local mason_lspconfig = require("mason-lspconfig")
		local mason_tool_installer = require("mason-tool-installer")

		-- enable mason and configure icons
		mason.setup({
			ui = {
				icons = {
					package_installed = "✓",
					package_pending = "➜",
					package_uninstalled = "✗",
				},
			},
		})

		mason_lspconfig.setup({
			-- list of servers for mason to install
			ensure_installed = {
				"ts_ls",
				"html",
				"cssls",
				"tailwindcss",
				"svelte",
				"lua_ls",
				"emmet_ls",
				"prismals",
				"bashls",
				"jsonls",
				"eslint",
				"clangd",
				"volar",
				"pyright",
			},
		})

		mason_tool_installer.setup({
			ensure_installed = {
				"prettierd",
				"stylua",
				-- 'pylint',
				-- "eslint_d",
				-- bash linter and formatter
				"shellcheck",
				"shfmt",
				-- c and cpp linter and formatter
				"cpplint",
				"clang-format",
				-- tailwind formatter
				"rustywind",
				-- python formatter and linter
				"black",
				"flake8",
			},
		})
	end,
}
