return {
	"nvim-telescope/telescope.nvim",
	tag = "0.1.8",
	dependencies = { "nvim-lua/plenary.nvim" },
	config = function()
		local builtin = require("telescope.builtin")
		local telescope = require("telescope")
		telescope.setup({
			defaults = {
				file_ignore_patterns = {
					"node_modules",
					"%.git/",
					"venv",
					"%.venv",
					"__pycache__",
					"%.o",
					"%.class",
					"%.lock",
					"%.cache",
					"vendor/",
					"storage/",
					"bootstrap/",
					"public/",
				},
			},
		})
		vim.keymap.set("n", "<leader>ff", builtin.find_files, { desc = "Telescope find files" })
	end,
}
