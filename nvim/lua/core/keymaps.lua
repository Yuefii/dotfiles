vim.g.mapleader = " "
vim.g.maplocalleader = " "

local opts = {
  noremap = true,
  silent = true,
}

vim.api.nvim_create_autocmd("filetype", {
  pattern = "netrw",
  callback = function()
    vim.keymap.set("n", "a", "%", { buffer = true, remap = true })
  end,
})

vim.keymap.set("n", "<leader>e", ":Ex<CR>", opts)

vim.keymap.set("n", "<C-s>", "<cmd> w <CR>", opts)

vim.keymap.set("v", "<A-Up>", ":m '<-2<CR>gv=gv", opts)
vim.keymap.set("v", "<A-Down>", ":m '>+1<CR>gv=gv", opts)

vim.keymap.set("n", "<Esc>", ":noh<CR>", opts)
vim.api.nvim_set_keymap("n", "<C-a>", "ggVG", opts)

vim.keymap.set("v", "<C-c>", '"+y', opts)
vim.keymap.set("v", "<C-x>", '"+d', opts)
vim.keymap.set("v", "<C-v>", '"+p', opts)
vim.keymap.set("n", "<C-z>", "u", opts)
vim.keymap.set("n", "<C-y>", "<C-r>", opts)

vim.api.nvim_set_keymap("n", "<C-d>", "<Plug>(VM-Find-Under)", {})
vim.api.nvim_set_keymap("v", "<C-d>", "<Plug>(VM-Find-Subword-Under)", {})
