return {
    -- Search Engine
    {
        'nvim-telescope/telescope.nvim', tag = '0.1.6',
        dependencies = { 'nvim-lua/plenary.nvim' },
        config = function()
            local builtin = require('telescope.builtin')
            vim.keymap.set('n', '<leader>ff', builtin.find_files, {})
            vim.keymap.set('n', '<leader>fg', builtin.live_grep, {})
        end
    },
    -- File Explorer
    {
        "nvim-neo-tree/neo-tree.nvim",
        branch = "v3.x",
        dependencies = { "nvim-lua/plenary.nvim", "nvim-tree/nvim-web-devicons", "MunifTanjim/nui.nvim" },
        config = function()
            vim.keymap.set('n', '<C-n>', ':Neotree toggle<CR>')
        end
    },
    -- VS Code Theme
    {
        "Mofiqul/vscode.nvim",
        lazy = false,
        priority = 1000,
        config = function()
            local vscode = require("vscode")
            vscode.setup({
                -- Optional: Customize the style
                transparent = false,     -- Set to true for a glass look
                italic_comments = true,
                underline_links = true,
                disable_nvimtree_bg = true,
            })
            vscode.load()
        end,
    },
    -- Icon Support (Keep this)
    { "nvim-tree/nvim-web-devicons", lazy = true },
}
