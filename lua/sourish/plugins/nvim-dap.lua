return {
	"mfussenegger/nvim-dap",
	config = function()
		-- debug adapters

		local dap = require("dap")
		dap.adapters.gdb = {
			type = "executable",
			command = "gdb",
			args = { "-i", "dap" },
		}

		dap.configurations.c = {
			{
				name = "Launch",
				type = "gdb",
				request = "launch",
				program = function()
					return vim.fn.input("Path to executable: ", vim.fn.getcwd() .. "/", "file")
				end,
				cwd = "${workspaceFolder}",
				stopAtBeginningOfMainSubprogram = false,
			},
		}

		dap.configurations.cpp = dap.configurations.c
		dap.configurations.rust = dap.configurations.c

		-- keymaps
		vim.keymap.set("n", "<F5>", function()
			require("dap").continue()
		end, { desc = "Start/Continue Debugging" })

		vim.keymap.set("n", "<F10>", function()
			require("dap").step_over()
		end, { desc = "Step Over" })

		vim.keymap.set("n", "<F11>", function()
			require("dap").step_into()
		end, { desc = "Step Into" })

		vim.keymap.set("n", "<F12>", function()
			require("dap").step_out()
		end, { desc = "Step Out" })

		vim.keymap.set("n", "<Leader>bt", function()
			require("dap").toggle_breakpoint()
		end, { desc = "Toggle Breakpoint" })

		vim.keymap.set("n", "<Leader>dt", function()
			require("dap").terminate()
		end, { desc = "Dap Terminate" })

		vim.keymap.set("n", "<Leader>bs", function()
			require("dap").set_breakpoint()
		end, { desc = "Set Breakpoint" })

		vim.keymap.set("n", "<Leader>lp", function()
			require("dap").set_breakpoint(nil, nil, vim.fn.input("Log point message: "))
		end, { desc = "Set Log Point" })

		vim.keymap.set("n", "<Leader>dr", function()
			require("dap").repl.open()
		end, { desc = "Open REPL" })

		vim.keymap.set("n", "<Leader>dl", function()
			require("dap").run_last()
		end, { desc = "Run Last Debugging Session" })

		vim.keymap.set({ "n", "v" }, "<Leader>dh", function()
			require("dap.ui.widgets").hover()
		end, { desc = "DAP Hover" })

		vim.keymap.set({ "n", "v" }, "<Leader>dp", function()
			require("dap.ui.widgets").preview()
		end, { desc = "DAP Preview" })

		vim.keymap.set("n", "<Leader>df", function()
			local widgets = require("dap.ui.widgets")
			widgets.centered_float(widgets.frames)
		end, { desc = "Show Frames" })

		vim.keymap.set("n", "<Leader>ds", function()
			local widgets = require("dap.ui.widgets")
			widgets.centered_float(widgets.scopes)
		end, { desc = "Show Scopes" })
	end,
}
