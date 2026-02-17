return {
    "hrsh7th/nvim-cmp",
    dependencies = {
        "hrsh7th/cmp-nvim-lsp",     -- LSP source for nvim-cmp
        "hrsh7th/cmp-buffer",       -- Buffer source for nvim-cmp
        "hrsh7th/cmp-path",         -- Path source for nvim-cmp
        "L3MON4D3/LuaSnip",         -- Snippet engine
        "saadparwaiz1/cmp_luasnip", -- Snippet source for nvim-cmp
        "rafamadriz/friendly-snippets", -- Useful snippets collection
    },
    config = function()
    local cmp = require("cmp")
    require("luasnip.loaders.from_vscode").lazy_load()

    cmp.setup({
        snippet = {
            expand = function(args)
            require('luasnip').lsp_expand(args.body)
            end,
        },
        mapping = cmp.mapping.preset.insert({
            ['<C-b>'] = cmp.mapping.scroll_docs(-4),
                                            ['<C-f>'] = cmp.mapping.scroll_docs(4),
                                            ['<C-o>'] = cmp.mapping.complete(),
                                            ['<C-e>'] = cmp.mapping.abort(),
                                            ['<CR>'] = cmp.mapping.confirm({ select = true }),
        }),
        sources = cmp.config.sources({
            { name = 'nvim_lsp' },
            { name = 'luasnip' },
        }, {
            { name = 'buffer' },
            { name = 'path' },
        }),
    })
    end,
}
