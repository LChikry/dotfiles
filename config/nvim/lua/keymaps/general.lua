vim.g.mapleader = " "

vim.opt.tabstop = 4 -- or whatever your desired tab width is
vim.opt.shiftwidth = 4 -- or whatever your desired shift width is
vim.opt.expandtab = false -- This ensures tabs are used instead of spaces

-- Remapping Keys
vim.keymap.set("v", "p", "P") -- replace word by pasting without yanking it
vim.keymap.set("n", "U", "<C-r>") -- Redo using capital U
vim.keymap.set("n", "<Esc>", ":nohlsearch<cr>")

-- Text Movement
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")
vim.keymap.set("n", "J", "mzJ`z") -- join and bring cursor back

-- Cursor Movement
vim.cmd("nmap j gj") -- skip folds
vim.cmd("nmap k gk")
vim.keymap.set("n", "<C-d>", "<C-d>zz") -- center the cursor
vim.keymap.set("n", "<C-u>", "<C-u>zz")
vim.keymap.set("n", "n", "nzzzv")
vim.keymap.set("n", "N", "Nzzzv")

-- System Clipboard & VIM
vim.keymap.set({"n", "v"}, "<leader>y", [["+y]]) -- yank to system clipboard
vim.keymap.set("n", "<leader>Y", [["+Y]]) -- yanking the line w/out <cr> to SC
vim.keymap.set({"n", "v"}, "<leader>p", [["+p]]) -- pasting from SC af/ cursor
vim.keymap.set({"n", "v"}, "<leader>P", [["+P]]) -- pasting from SC bf/ cursor

-- save and close files
vim.cmd("nmap <leader>w :w<cr>") -- save file
vim.cmd("nmap <leader>q :q<cr>") -- close file

-- better case sensitivity search handling
vim.opt.ignorecase = true
vim.opt.smartcase = true