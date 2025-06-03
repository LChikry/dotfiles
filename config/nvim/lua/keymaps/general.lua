vim.g.mapleader = " "

-- Remapping Keys
vim.keymap.set("v", "p", "P") -- replace word by pasting without yanking it
vim.keymap.set("n", "U", "<C-r>") -- Redo using capital U
vim.keymap.set("n", "<Esc>", ":nohlsearch<cr>")


vim.keymap.set({"n", "v"}, "<leader>y", [["+y]]) -- yank to system clipboard
vim.keymap.set("n", "<leader>Y", [["+Y]]) -- yanking the line w/out <cr> to SC
vim.keymap.set({"n", "v"}, "<leader>p", [["+p]]) -- pasting from SC af/ cursor
vim.keymap.set({"n", "v"}, "<leader>P", [["+P]]) -- pasting from SC bf/ cursor

vim.cmd("nmap <leader>w :w<cr>") -- save file
vim.cmd("nmap <leader>q :q<cr>") -- close file

-- skip folds
vim.cmd("nmap j gj")
vim.cmd("nmap k gk")

-- better case sensitivity search handling
vim.opt.ignorecase = true
vim.opt.smartcase = true