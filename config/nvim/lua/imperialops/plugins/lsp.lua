-- ========================================================================== --
-- 1. DIAGNOSTICS CONFIGURATION
-- ========================================================================== --
vim.diagnostic.config({
    virtual_text = true,
    signs = {
        text = {
            [vim.diagnostic.severity.ERROR] = 'E',
            [vim.diagnostic.severity.WARN]  = 'W',
            [vim.diagnostic.severity.HINT]  = 'H',
            [vim.diagnostic.severity.INFO]  = 'I'
        },
    },
})

-- ========================================================================== --
-- 2. NVIM-CMP SETUP (AUTOCOMPLETION SHORTCUTS)
-- ========================================================================== --
local cmp = require('cmp')
local cmp_select = { behavior = cmp.SelectBehavior.Select }
local cmp_mappings = cmp.mapping.preset.insert({
    ['<C-k>'] = cmp.mapping.select_prev_item(cmp_select),
    ['<C-j>'] = cmp.mapping.select_next_item(cmp_select),
    ['<C-y>'] = cmp.mapping.confirm({ select = true }),
    ["<C-Space>"] = cmp.mapping.complete(),
    ['<C-i>'] = cmp.mapping.scroll_docs(-4),
    ['<C-u>'] = cmp.mapping.scroll_docs(4),
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

-- Advertise cmp capabilities to native LSP client
local lsp_capabilities = vim.lsp.protocol.make_client_capabilities()
local has_cmp, cmp_nvim_lsp = pcall(require, 'cmp_nvim_lsp')
if has_cmp then
    lsp_capabilities = cmp_nvim_lsp.default_capabilities(lsp_capabilities)
end

-- ========================================================================== --
-- 3. GLOBAL KEYMAPS (NATIVE BUILTIN WAY)
-- ========================================================================== --
-- Neovim 0.11 recommendation: Bind keys globally or via LspAttach autocmd.
-- Using LspAttach ensures keymaps only exist where an LSP client is active.
vim.api.nvim_create_autocmd('LspAttach', {
    desc = 'LSP actions',
    callback = function(event)
        local opts = { buffer = event.buf, remap = false }

        local lsp_keymaps = {
            n = {
                ['gd']          = vim.lsp.buf.definition,
                ['K']           = vim.lsp.buf.hover,
                ['<leader>e']   = vim.diagnostic.open_float,
                ['<leader>vws'] = vim.lsp.buf.workspace_symbol,
                ['<leader>vca'] = vim.lsp.buf.code_action,
                ['<leader>vrr'] = vim.lsp.buf.references,
                ['<leader>vrn'] = vim.lsp.buf.rename,
            },
            i = {
                ['<C-h>']       = vim.lsp.buf.signature_help,
            }
        }

        for mode, maps in pairs(lsp_keymaps) do
            for key, func in pairs(maps) do
                vim.keymap.set(mode, key, func, opts)
            end
        end
    end,
})

-- ========================================================================== --
-- 4. LSP SERVER CORES & CONFIGURATION (NEOVIM v0.11+)
-- ========================================================================== --
local base_config = {
    capabilities = lsp_capabilities,
}

local servers = {
    'bashls',
    'gopls',
    'terraformls',
    'pyright',
    'ocamllsp',
}

-- Configure and enable standard servers
for _, server in ipairs(servers) do
    vim.lsp.config(server, base_config)
    vim.lsp.enable(server) 
end

-- ========================================================================== --
-- 5. LUA_LS CUSTOM TARGET SETUP
-- ========================================================================== --
local lua_ls_config = vim.tbl_deep_extend("force", base_config, {
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
})

vim.lsp.config('lua_ls', lua_ls_config)
vim.lsp.enable('lua_ls')
