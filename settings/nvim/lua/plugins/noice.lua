return {
	"folke/noice.nvim",
	event = "VeryLazy",
	dependencies = {
		"MunifTanjim/nui.nvim",
		"rcarriga/nvim-notify",
	},
	config = function()
		local noice = require("noice")

		local function myMiniView(pattern, kind)
			kind = kind or ""
			return {
				view = "mini",
				filter = {
					event = "msg_show",
					kind = kind,
					find = pattern,
				},
			}
		end
		noice.setup({
			cmdline = {
				format = {
					-- search iconの文字化け対策
					search_down = { kind = "search", pattern = "^/", icon = " ", lang = "regex" },
					search_up = { kind = "search", pattern = "^%?", icon = " ", lang = "regex" },
				},
			},

			lsp = {
				override = {
					["vim.lsp.util.convert_input_to_markdown_lines"] = true,
					["vim.lsp.util.stylize_markdown"] = true,
					["cmp.entry.get_documentation"] = true,
				},
			},
			-- you can enable a preset for easier configuration
			presets = {
				bottom_search = false, -- use a classic bottom cmdline for search
				command_palette = true, -- position the cmdline and popupmenu together
				long_message_to_split = true, -- long messages will be sent to a split
				inc_rename = false, -- enables an input dialog for inc-rename.nvim
				lsp_doc_border = false, -- add a border to hover docs and signature help
			},
			messages = {
				view_search = "mini",
			},
			routes = {
				{
					view = "notify",
					filter = { event = "msg_showmode" },
				},
				{
					filter = {
						event = "msg_show",
						kind = "search_count",
					},
					opts = { skip = true },
				},
				{
					filter = {
						event = "msg_show",
						kind = "",
						find = "lines",
					},
					opts = { skip = true, stop = true },
				},
				{
					filter = {
						event = "msg_show",
						kind = "",
						find = "Modified",
					},
					opts = { skip = true, stop = true },
				},
				{
					filter = {
						event = "msg_show",
						kind = "",
						find = "search hit .*, continuing at",
					},
					opts = { skip = true, stop = true },
				},
				{
					filter = {
						event = "notify",
						warning = true,
						find = "failed to run generator.*is not executable",
					},
					opts = { skip = true },
				},
				myMiniView("NvimTree"),
				myMiniView("Already at .* change"),
				myMiniView("written"),
				myMiniView("yanked"),
				myMiniView("more lines?"),
				myMiniView("fewer lines?"),
				myMiniView("fewer lines?", "lua_error"),
				myMiniView("change; before"),
				myMiniView("change; after"),
				myMiniView("line less"),
				myMiniView("lines indented"),
				myMiniView("No lines in buffer"),
				myMiniView("E486: ", "emsg"),
			},
		})
	end,
}
