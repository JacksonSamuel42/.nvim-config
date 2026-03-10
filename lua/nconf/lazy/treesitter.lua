return {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    config = function()
    local ts = require("nvim-treesitter")

    ts.setup({
        ensure_installed = { "rust", "lua", "vim", "vimdoc" },
        highlight = {
            enable = true,
            additional_vim_regex_highlighting = false,
        },
    })

    vim.api.nvim_create_autocmd("FileType", {
        pattern = "rust",
        callback = function()
            vim.treesitter.start()
        end,
    })
    end,
}
