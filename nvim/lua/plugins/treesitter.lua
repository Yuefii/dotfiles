return {
	"nvim-treesitter/nvim-treesitter",
	build = ":TSUpdate",
	main = "nvim-treesitter.configs",
	opts = {
		ensure_installed = {
			"lua",
			"python",
			"vue",
			"c",
			"javascript",
			"typescript",
			"sql",
			"php",
			"dockerfile",
			"toml",
			"json",
			"gitignore",
			"yaml",
			"markdown",
			"markdown_inline",
			"tsx",
			"css",
			"html",
			"go",
			"svelte",
		},
		auto_install = true,
		highlight = {
			enable = true,
			additional_vim_regex_highlighting = false, -- opsional
		},
	},
}
