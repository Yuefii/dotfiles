return {
	"nvim-lualine/lualine.nvim",
	dependencies = { "nvim-tree/nvim-web-devicons" },
	config = function()
		local colors = {
			nord0 = "#2e3440",
			nord1 = "#3b4252",
			nord2 = "#434c5e",
			nord3 = "#4c566a",
			nord4 = "#d8dee9",
			nord5 = "#e5e9f0",
			nord6 = "#eceff4",
			nord7 = "#8fbcbb",
			nord8 = "#88c0d0",
			nord9 = "#81a1c1",
			nord10 = "#5e81ac",
			nord11 = "#bf616a",
			nord12 = "#d08770",
			nord13 = "#ebcb8b",
			nord14 = "#a3be8c",
			nord15 = "#b48ead",
		}

		-- Custom Nord Bubble Theme
		local bubbles_theme = {
			normal = {
				a = { fg = colors.nord0, bg = colors.nord14, gui = "bold" },
				b = { fg = colors.nord4, bg = colors.nord1 },
				c = { fg = colors.nord4, bg = colors.nord0 },
			},
			insert = {
				a = { fg = colors.nord0, bg = colors.nord9, gui = "bold" },
			},
			visual = {
				a = { fg = colors.nord0, bg = colors.nord15, gui = "bold" },
			},
			replace = {
				a = { fg = colors.nord0, bg = colors.nord11, gui = "bold" },
			},
			inactive = {
				a = { fg = colors.nord4, bg = colors.nord1, gui = "bold" },
				b = { fg = colors.nord4, bg = colors.nord0 },
				c = { fg = colors.nord4, bg = colors.nord0 },
			},
		}

		-- Setup lualine with custom Nord theme
		require("lualine").setup({
			options = {
				icons_enabled = true,
				theme = bubbles_theme,
				component_separators = "",
				section_separators = { left = "", right = "" },
				disabled_filetypes = {
					statusline = {},
					winbar = {},
				},
				ignore_focus = {},
				always_divide_middle = true,
				always_show_tabline = true,
				globalstatus = false,
				refresh = {
					statusline = 1000,
					tabline = 1000,
					winbar = 1000,
					refresh_time = 16,
					events = {
						"WinEnter",
						"BufEnter",
						"BufWritePost",
						"SessionLoadPost",
						"FileChangedShellPost",
						"VimResized",
						"Filetype",
						"CursorMoved",
						"CursorMovedI",
						"ModeChanged",
					},
				},
			},
			sections = {
				lualine_a = { { "mode", separator = { right = "" }, right_padding = 2 } },
				lualine_b = { "filename", "branch" },
				lualine_c = { "%=" },
				lualine_x = {},
				lualine_y = { "filetype", "progress" },
				lualine_z = { { "location", separator = { right = "" }, left_padding = 2 } },
			},
			inactive_sections = {
				lualine_a = { "filename" },
				lualine_b = {},
				lualine_c = {},
				lualine_x = {},
				lualine_y = {},
				lualine_z = { "location" },
			},
			tabline = {},
			extensions = {},
		})
	end,
}
