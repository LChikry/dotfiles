local keymap = vim.keymap.set

-- Universal Keybinding that Are Complemented By VS Code Keybinding
------------- Command Pallets
keymap({"n", "v"}, "<leader>f", "<cmd>lua require('vscode').action('workbench.action.quickOpen')<CR>")
keymap({"n", "v"}, "<leader>.", "<cmd>lua require('vscode').action('workbench.action.showAllEditors')<CR>")
keymap({"n", "v"}, "<leader>cp", "<cmd>lua require('vscode').action('workbench.action.showCommands')<CR>")

-------------- SideBar Keybindings
keymap({"n", "v"}, "<leader>e", function()
    require('vscode').action('runCommands', {
        args = {
            commands = {
                'workbench.action.toggleSidebarVisibility',
                'workbench.files.action.showActiveFileInExplorer',
            }
        }
    })
end)
keymap({"n", "v"}, "<leader>a", function()
    require('vscode').action('runCommands', {
        args = {
            commands = {
                'workbench.action.toggleSidebarVisibility',
                'workbench.extensions.action.focusExtensionsView'
            }
        }
    })
end)


-- Coding Keymaps
keymap({"n", "v"}, "<leader>=", "<cmd>lua require('vscode').action('workbench.action.toggleCenteredLayout')<CR>")
keymap({"n", "v"}, "<leader>rp", "<cmd>lua require('vscode').action('code-runner.run')<CR>")
keymap({"n", "v"}, "<S-k>", "<cmd>lua require('vscode').action('editor.action.quickFix')<CR>")
keymap({"n", "v"}, "gs", "<cmd>lua require('vscode').action('workbench.action.gotoSymbol')<CR>")
keymap({"n", "v"}, "<leader>b", "<cmd>lua require('vscode').action('editor.debug.action.toggleBreakpoint')<CR>")


-- Terminal Keymaps
keymap({"n", "v"}, "<leader>t", "<cmd>lua require('vscode').action('workbench.action.terminal.toggleTerminal')<CR>")


-- -- general keymaps
keymap({"n", "v"}, "<leader>cn", "<cmd>lua require('vscode').action('notifications.clearAll')<CR>")

-- -- VSCode Harpoon keymaps
keymap({"n", "v"}, "<leader>ha", "<cmd>lua require('vscode').action('vscode-harpoon.addEditor')<CR>")
keymap({"n", "v"}, "<leader>ho", "<cmd>lua require('vscode').action('vscode-harpoon.editorQuickPick')<CR>")
keymap({"n", "v"}, "<leader>he", "<cmd>lua require('vscode').action('vscode-harpoon.editEditors')<CR>")
keymap({"n", "v"}, "<leader>h1", "<cmd>lua require('vscode').action('vscode-harpoon.gotoEditor1')<CR>")
keymap({"n", "v"}, "<leader>h2", "<cmd>lua require('vscode').action('vscode-harpoon.gotoEditor2')<CR>")
keymap({"n", "v"}, "<leader>h3", "<cmd>lua require('vscode').action('vscode-harpoon.gotoEditor3')<CR>")
keymap({"n", "v"}, "<leader>h4", "<cmd>lua require('vscode').action('vscode-harpoon.gotoEditor4')<CR>")
keymap({"n", "v"}, "<leader>h5", "<cmd>lua require('vscode').action('vscode-harpoon.gotoEditor5')<CR>")
keymap({"n", "v"}, "<leader>h6", "<cmd>lua require('vscode').action('vscode-harpoon.gotoEditor6')<CR>")
keymap({"n", "v"}, "<leader>h7", "<cmd>lua require('vscode').action('vscode-harpoon.gotoEditor7')<CR>")
keymap({"n", "v"}, "<leader>h8", "<cmd>lua require('vscode').action('vscode-harpoon.gotoEditor8')<CR>")
keymap({"n", "v"}, "<leader>h9", "<cmd>lua require('vscode').action('vscode-harpoon.gotoEditor9')<CR>")
