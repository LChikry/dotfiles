local keymap = vim.keymap.set

-- Universal Keybinding that Are Complemented By VS Code Keybinding
------------- Editors & Tabs
keymap({"n", "v"}, "<leader>cp", "<cmd>lua require('vscode').action('workbench.action.showCommands')<CR>")
keymap({"n", "v"}, "<leader>f", "<cmd>lua require('vscode').action('workbench.action.quickOpen')<CR>")
keymap({"n", "v"}, "<leader>.", "<cmd>lua require('vscode').action('workbench.action.showAllEditors')<CR>")
keymap({"n", "v"}, "<leader><Tab>", "<cmd>lua require('vscode').action('workbench.action.quickOpenPreviousRecentlyUsedEditorInGroup')<CR>")
--- space q keymap is in the general keymaps file

-------------- Panes Navigation
keymap({"n", "v"}, "<C-h>", "<cmd>lua require('vscode').action('workbench.action.navigateLeft')<CR>")
keymap({"n", "v"}, "<C-l>", "<cmd>lua require('vscode').action('workbench.action.navigateRight')<CR>")
keymap({"n", "v"}, "<C-k>", "<cmd>lua require('vscode').action('workbench.action.navigateUp')<CR>")
keymap({"n", "v"}, "<C-j>", "<cmd>lua require('vscode').action('workbench.action.navigateDown')<CR>")

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
keymap("n", "<leader>=", "<cmd>lua require('vscode').action('workbench.action.toggleCenteredLayout')<CR>")
keymap("n", "<leader>rp", "<cmd>lua require('vscode').action('code-runner.run')<CR>")
keymap("n", "<S-k>", "<cmd>lua require('vscode').action('editor.action.quickFix')<CR>")
keymap("n", "gs", "<cmd>lua require('vscode').action('workbench.action.gotoSymbol')<CR>")
keymap("n", "<leader>b", "<cmd>lua require('vscode').action('editor.debug.action.toggleBreakpoint')<CR>")

-- Terminal Keymaps
keymap({"n", "v"}, "<leader>t", "<cmd>lua require('vscode').action('workbench.action.terminal.toggleTerminal')<CR>")


-- -- general keymaps
keymap({"n", "v"}, "<leader>cn", "<cmd>lua require('vscode').action('notifications.clearAll')<CR>")
keymap("n", "<leader><S-F>", "<cmd>lua require('vscode').action('editor.action.indentationToTabs')<CR>")
keymap("n", "<leader>r", "<cmd>lua require('vscode').action('workbench.action.reloadWindow')<CR>")

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
