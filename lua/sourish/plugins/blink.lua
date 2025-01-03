-- nvim-cmp is being used in favour of these
if true then
	return {}
end

return {
	"saghen/blink.cmp",
	event = { "InsertEnter" },
	-- lazy = false, -- lazy loading handled internally
	-- optional: provides snippets for the snippet source
	dependencies = { "netmute/blink-cmp-ctags", "rafamadriz/friendly-snippets" },

	-- use a release tag to download pre-built binaries
	version = "v0.*",

	---@module 'blink.cmp'
	---@type blink.cmp.Config
	opts = {
		sources = {
			-- add lazydev to your completion providers
			completion = {
				enabled_providers = { "lsp", "path", "snippets", "buffer", "lazydev", "ctags" },
			},
			providers = {
				-- dont show LuaLS require statements when lazydev has items
				lsp = { fallback_for = { "lazydev" } },
				lazydev = { name = "LazyDev", module = "lazydev.integrations.blink" },
				ctags = {
					name = "Ctags",
					module = "blink-cmp-ctags",
					fallback_for = { "lsp" },
				},
			},
		},
		keymap = {
			preset = "default",
			["<C-e>"] = { "hide", "fallback" },
			["<CR>"] = { "accept", "fallback" },
			["<Tab>"] = { "select_next", "snippet_forward", "fallback" },
			["<S-Tab>"] = { "select_prev", "snippet_backward", "fallback" },
		},

		windows = {
			autocomplete = {
				border = "rounded",
				max_height = 15,
			},
			documentation = {
				border = "rounded",
				auto_show = true,
				auto_show_delay_ms = 50,
			},
			signature_help = {
				border = "rounded",
			},
		},

		highlight = {
			-- sets the fallback highlight groups to nvim-cmp's highlight groups
			-- useful for when your theme doesn't support blink.cmp
			-- will be removed in a future release, assuming themes add support
			use_nvim_cmp_as_default = true,
		},
		-- set to 'mono' for 'Nerd Font Mono' or 'normal' for 'Nerd Font'
		-- adjusts spacing to ensure icons are aligned
		nerd_font_variant = "mono",

		-- experimental auto-brackets support
		accept = { auto_brackets = { enabled = true } },

		-- experimental signature help support
		trigger = { signature_help = { enabled = true } },
	},
	-- allows extending the enabled_providers array elsewhere in your config
	-- without having to redefining it
	opts_extend = { "sources.completion.enabled_providers" },
}
