return {
    {
        "neovim/nvim-lspconfig",
        dependencies = {
            "williamboman/mason.nvim",
            "williamboman/mason-lspconfig.nvim",
            "hrsh7th/nvim-cmp",
            "hrsh7th/cmp-nvim-lsp",
        },
        config = function()
            -- 1. Setup Mason
            require("mason").setup()
            require("mason-lspconfig").setup({
                ensure_installed = { "pyright", "rust_analyzer", "ts_ls", "html", "cssls" }
            })

            -- 2. Setup Capabilities (Standard for Autocompletion)
            local capabilities = require("cmp_nvim_lsp").default_capabilities()

            -- 3. THE FIX: Use the new 0.11 vim.lsp.config instead of require('lspconfig')
            -- This sets default capabilities for ALL servers configured via the new API
            vim.lsp.config("*", {
                capabilities = capabilities,
            })

            -- List of servers to enable
            local servers = { "pyright", "rust_analyzer", "ts_ls", "html", "cssls" }

            -- Enable them using the NEW 0.11 syntax
            for _, server in ipairs(servers) do
                vim.lsp.enable(server)
            end

	    -- 1. Configure how errors/warnings are displayed
	    vim.diagnostic.config({
		virtual_text = true, -- Shows error text next to the line
		signs = true,        -- Shows icons in the gutter
		update_in_insert = false,
		underline = true,
		severity_sort = true,
		float = { border = "rounded" },
	    })

	    -- 2. Add signs (icons) to the gutter
	    local signs = { Error = " ", Warn = " ", Hint = "󰌵 ", Info = "󰋼 " }
	    for type, icon in pairs(signs) do
		local hl = "DiagnosticSign" .. type
		vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = hl })
	    end

            -- 4. Keybindings (Modern LspAttach pattern)
            vim.api.nvim_create_autocmd('LspAttach', {
                callback = function(args)
                    local opts = { buffer = args.buf }
                    vim.keymap.set('n', 'gd', vim.lsp.buf.definition, opts)
		    vim.keymap.set('n', 'gr', vim.lsp.buf.references, opts)
                    vim.keymap.set('n', 'K', vim.lsp.buf.hover, opts)
                    vim.keymap.set('n', '<leader>rn', vim.lsp.buf.rename, opts)
                    vim.keymap.set('n', '<leader>ca', vim.lsp.buf.code_action, opts)
                end,
            })
        end,
    },
}
