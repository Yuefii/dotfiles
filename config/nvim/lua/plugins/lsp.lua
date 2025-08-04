return {
	"neovim/nvim-lspconfig",
	dependencies = {
		{ "williamboman/mason.nvim", config = true },
		"williamboman/mason-lspconfig.nvim",
		"WhoIsSethDaniel/mason-tool-installer.nvim",
		{
			"j-hui/fidget.nvim",
			opts = {},
		},
		"hrsh7th/cmp-nvim-lsp",
	},
	config = function()
		vim.api.nvim_create_autocmd("LspAttach", {
			group = vim.api.nvim_create_augroup("kickstart-lsp-attach", { clear = true }),
			callback = function()
				--
			end,
		})

		vim.diagnostic.config({
			virtual_text = {
				prefix = "●",
				severity = { min = vim.diagnostic.severity.WARN },
			},
			signs = true,
			update_in_insert = false,
			underline = true,
			severity_sort = true,
		})
		vim.keymap.set("n", "[d", vim.diagnostic.goto_prev, { desc = "Previous diagnostic" })
		vim.keymap.set("n", "]d", vim.diagnostic.goto_next, { desc = "Next diagnostic" })
		vim.keymap.set("n", "<leader>d", vim.diagnostic.open_float, { desc = "Show diagnostics in floating window" })
		local capabilities = vim.lsp.protocol.make_client_capabilities()
		capabilities = vim.tbl_deep_extend("force", capabilities, require("cmp_nvim_lsp").default_capabilities())
		local servers = {
			ts_ls = {},
			html = {},
			intelephense = {},
			cssls = {},
			tailwindcss = {},
			sqlls = {},
			jsonls = {},
			yamlls = {},
			emmet_ls = {},
			pyright = {},
			pylsp = {
				settings = {
					pylsp = {
						plugins = {
							pycodestyle = { enabled = false },
							flake8 = { enabled = false },
							pydocstyle = { enabled = false },
							mccabe = { enabled = false },
							yapf = { enabled = false },
							autopep8 = { enabled = false },
							black = { enabled = true },
							ruff = { enabled = true },
							django = { enabled = true },
						},
					},
				},
			},
		}
		require("mason").setup()
		local ensure_installed = vim.tbl_keys(servers or {})
		vim.list_extend(ensure_installed, {
			"pylsp",
			"black",
			"ruff",
		})
		require("mason-tool-installer").setup({ ensure_installed = ensure_installed })
		require("mason-lspconfig").setup({
			handlers = {
				function(server_name)
					local server = servers[server_name] or {}
					server.capabilities = vim.tbl_deep_extend("force", {}, capabilities, server.capabilities or {})
					require("lspconfig")[server_name].setup(server)
				end,
			},
		})
	end,
}
