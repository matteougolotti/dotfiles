return {
    {
        "nvim-treesitter/nvim-treesitter",
        build = ":TSUpdate",
        -- In the new version, we use 'opts' instead of a manual config function
        -- to let Lazy handle the timing properly.
        opts = {
            ensure_installed = { 
                "lua", "python", "rust", "javascript", 
                "typescript", "html", "css", "bash", "vimdoc" 
            },
            highlight = { 
                enable = true, 
            },
            indent = { 
                enable = true 
            },
        },
        config = function(_, opts)
            -- The new way to initialize is calling the main module
            require("nvim-treesitter").setup(opts)
        end,
    }
}
