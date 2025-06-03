require "keymaps.general"

if vim.g.vscode then
	require "keymaps.vscode"
else
	require("keymaps.neovim")
end