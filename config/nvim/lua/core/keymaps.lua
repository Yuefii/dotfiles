local map = vim.keymap
local api = vim.api

vim.g.mapleader = " "
vim.g.mapleader = " "
vim.g.maplocalleader = " "

vim.keymap.set("n", "<leader>a", function()
	require("harpoon.mark").add_file()
end, { desc = "Add file to Harpoon" })
vim.keymap.set("n", "<leader>h", function()
	require("harpoon.ui").toggle_quick_menu()
end, { desc = "Toggle Harpoon menu" })
vim.keymap.set("n", "<leader>1", function()
	require("harpoon.ui").nav_file(1)
end)
vim.keymap.set("n", "<leader>2", function()
	require("harpoon.ui").nav_file(2)
end)
vim.keymap.set("n", "<leader>3", function()
	require("harpoon.ui").nav_file(3)
end)
vim.keymap.set("n", "<leader>4", function()
	require("harpoon.ui").nav_file(4)
end)

map.set("n", "<leader>sd", function()
	require("telescope.builtin").diagnostics({ bufnr = 0 })
end)

map.set("n", "<leader>e", ":Ex<CR>")
map.set("n", "<C-s>", "<cmd> w <CR>")
map.set("v", "<A-Up>", ":m '<-2<CR>gv=gv")
map.set("v", "<A-Down>", ":m '>+1<CR>gv=gv")
map.set("n", "<Esc>", ":noh<CR>")
map.set("v", "<C-c>", '"+y')
map.set("v", "<C-x>", '"+d')
map.set("v", "<C-v>", '"+p')
map.set("n", "<C-z>", "u")
map.set("n", "<C-y>", "<C-r>")
map.set("n", "x", '"_x')
map.set("n", "<C-a>", "gg<S-v>G")
map.set("v", "<A-S-Down>", "y`>p`<V")
map.set("n", "<A-S-Down>", "yyp")
map.set("n", "<leader>r", [[:%s/\<<C-r><C-w>\>//g<Left><Left>]])
map.set("n", "<leader>/", "gcc", { remap = true })
map.set("v", "<leader>/", "gc", { remap = true })

api.nvim_set_keymap("n", "<C-d>", "<Plug>(VM-Find-Under)", {})
api.nvim_set_keymap("v", "<C-d>", "<Plug>(VM-Find-Subword-Under)", {})
api.nvim_create_autocmd("filetype", {
	pattern = "netrw",
	callback = function()
		map.set("n", "a", "%", { buffer = true, remap = true })
	end,
})
