require("core.options")
require("core.keymaps")

local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
	local lazyrepo = "https://github.com/folke/lazy.nvim.git"
	local out = vim.fn.system({
		"git",
		"clone",
		"--filter=blob:none",
		"--branch=stable",
		lazyrepo,
		lazypath,
	})
	if vim.v.shell_error ~= 0 then
		error("error clonning lazy.nvim:\n" .. out)
	end
end
vim.opt.rtp:prepend(lazypath)

require("lazy").setup({
	require("plugins.colorscheme"),
	require("plugins.wakatime"),
	require("plugins.neocord"),
	require("plugins.telescope"),
	require("plugins.treesitter"),
	require("plugins.autopairs"),
	require("plugins.cmp"),
	require("plugins.colorizer"),
	require("plugins.lsp"),
	require("plugins.formatter"),
	require("plugins.multicursor"),
	require("plugins.lualine"),
	require("plugins.diagnostics"),
	require("plugins.comment"),
	require("plugins.harpon"),
})
