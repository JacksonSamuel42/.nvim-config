return {
    {
        "williamboman/mason.nvim",
        dependencies = {
            "williamboman/mason-lspconfig.nvim",
            "neovim/nvim-lspconfig",
            "hrsh7th/cmp-nvim-lsp",
        },
        config = function()
        require("mason").setup()
        require("mason-lspconfig").setup({
            ensure_installed = {
                "lua_ls",
                "pyright",
                "bashls",
                "rust_analyzer",
                "clangd",
                "ts_ls"
            },
        })

        local lspconfig = require("lspconfig")

        -- 1. Create the capabilities object
        -- This tells the LSP servers that nvim-cmp is ready to show suggestions
        local capabilities = require('cmp_nvim_lsp').default_capabilities()

        -- 2. Your reusable on_attach function
        local on_attach = function(client, bufnr)
        -- Standard LSP keymap as a backup
        vim.keymap.set("n", "gD", vim.lsp.buf.declaration, { buffer = bufnr })
        end

        -- 3. Setup servers with BOTH on_attach and capabilities
        local servers = { "lua_ls", "pyright", "bashls", "rust_analyzer", "clangd", "ts_ls" }

        for _, lsp in ipairs(servers) do
            lspconfig[lsp].setup({
                on_attach = on_attach,
                capabilities = capabilities, -- Pass capabilities here
                -- Custom settings for specific servers
                settings = lsp == "lua_ls" and {
                    Lua = {
                        diagnostics = { globals = { "vim" } }
                    }
                } or nil
            })
            end
        end
    }
}
