return {
    'mrcjkb/rustaceanvim',
    version = '^5',
    lazy = false,
    dependencies = {
        'williamboman/mason.nvim',
    },
    config = function()
    vim.g.rustaceanvim = {
        server = {
            on_attach = function(_, bufnr)
            vim.keymap.set("n", "<Leader>k", function() vim.cmd.RustLsp('hoverActions') end, { buffer = bufnr, desc = "Rust Hover" })
            vim.keymap.set("n", "<Leader>a", function() vim.cmd.RustLsp('codeAction') end, { buffer = bufnr, desc = "Rust Code Action" })
            end,
        },
        dap = {
            adapter = function()
            -- This code ONLY runs when you start debugging
            local mason_registry = require("mason-registry")

            -- Check if package exists to avoid the nil error
            if not mason_registry.is_installed("codelldb") then
                vim.notify("codelldb is not installed. Run :MasonInstall codelldb", vim.log.levels.ERROR)
                return
                end

                local codelldb = mason_registry.get_package("codelldb")
                local extension_path = codelldb:get_install_path() .. "/extension/"
                local codelldb_path = extension_path .. "adapter/codelldb"
                local liblldb_path = extension_path .. "lldb/lib/liblldb.so"

                return require('rustaceanvim.config').get_codelldb_adapter(codelldb_path, liblldb_path)
                end,
        },
    }
    end
}
