local keymap = vim.keymap.set

vim.keymap.set("n", "<leader><S-F>", ":retab<CR>", { desc = "Convert indentation to tabs" })