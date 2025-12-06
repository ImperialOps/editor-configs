-- ============================================================================
-- 💡 Simplified Native LSP Setup
-- ============================================================================

-- 1. Setup Keymappings and Diagnostics (on_attach function)
local on_attach = function(client, bufnr)
    local opts = { buffer = bufnr, remap = false }

    -- Simplified keymap definition using a table structure
    local lsp_keymaps = {
        -- Normal Mode (n)
        ['n'] = {
            -- LSP Functions
            ['gd'] = vim.lsp.buf.definition,
            ['K'] = vim.lsp.buf.hover,
            ['<leader>e'] = vim.diagnostic.open_float,
            ['<leader>vws'] = vim.lsp.buf.workspace_symbol,
            ['<leader>vca'] = vim.lsp.buf.code_action,
            ['<leader>vrr'] = vim.lsp.buf.references,
            ['<leader>vrn'] = vim.lsp.buf.rename,
        },
        -- Insert Mode (i)
        ['i'] = {
            ['<C-h>'] = vim.lsp.buf.signature_help,
        }
    }

    -- Set the keymaps efficiently
    for mode, maps in pairs(lsp_keymaps) do
        for key, func in pairs(maps) do
            vim.keymap.set(mode, key, func, opts)
        end
    end
    
    -- Optional: Explicitly enable the LSP client
    vim.lsp.enable(client.name, bufnr)
end

---
-- 2. Setup Diagnostic Icons and Appearance
-- This is cleaner and ensures the signs/icons match your original intent.
vim.diagnostic.config({
    virtual_text = true,
    signs = {
        text = {
            error = 'E',
            warn = 'W',
            hint = 'H',
            info = 'I'
        },
    },
})

---
-- 3. Setup nvim-cmp
local cmp = require('cmp')
local cmp_select = { behavior = cmp.SelectBehavior.Select }
local cmp_mappings = cmp.mapping.preset.insert({
    ['<C-k>'] = cmp.mapping.select_prev_item(cmp_select),
    ['<C-j>'] = cmp.mapping.select_next_item(cmp_select),
    ['<C-y>'] = cmp.mapping.confirm({ select = true }),
    ["<C-Space>"] = cmp.mapping.complete(),
    ['<C-i>'] = cmp.mapping.scroll_docs(-4), -- Original <C-i>
    ['<C-u>'] = cmp.mapping.scroll_docs(4),  -- Original <C-u>
    ['<C-e>'] = cmp.mapping.abort(),
})

cmp.setup({
    sources = cmp.config.sources({
        { name = 'nvim_lsp' },
        { name = 'path' },
    }, {
        { name = 'buffer' },
    }),
    mapping = cmp_mappings,
})

---
-- 4. Define and Configure LSPs (General Setup)
local base_config = {
    on_attach = on_attach,
    -- Add any global settings here if all servers need them
}

local servers = {
    'bashls',
    'gopls',
    'terraformls',
    'jedi_language_server',
    'eslint',
    'astro',
    'rust_analyzer',
    'tailwindcss',
}

-- Single, clean loop to configure and enable all servers
for _, server in ipairs(servers) do
    vim.lsp.config(server, base_config)
    vim.lsp.enable(server) 
end

---
-- 5. Special Configuration for lua_ls
local lua_ls_config = {
    on_attach = on_attach,
    settings = {
        Lua = {
            runtime = { version = 'LuaJIT' },
            diagnostics = { globals = {'vim'} },
            workspace = {
                library = vim.api.nvim_get_runtime_file("", true), 
                checkThirdParty = false,
            },
            telemetry = { enable = false },
        },
    }
}

vim.lsp.config('lua_ls', lua_ls_config)
vim.lsp.enable('lua_ls')

---
-- 6. Special Configuration for terraformls formatting (Autocmd)
vim.api.nvim_create_autocmd({"BufWritePre"}, {
    pattern = {"*.tf", "*.tfvars"},
    callback = function()
        -- Use the simplified/filtered format call
        vim.lsp.buf.format({
            filter = function(client)
                return client.name == 'terraformls'
            end
        })
    end,
})
