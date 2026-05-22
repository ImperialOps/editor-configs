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
    snippet = {
        expand = function(args)
            vim.snippet.expand(args.body)
        end,
    },
    sources = cmp.config.sources({
        { name = 'nvim_lsp' },
        { name = 'path' },
    }, {
        { name = 'buffer' },
    }),
    mapping = cmp_mappings,
})

local lsp_capabilities = vim.lsp.protocol.make_client_capabilities()
local has_cmp, cmp_nvim_lsp = pcall(require, 'cmp_nvim_lsp')
if has_cmp then
    lsp_capabilities = cmp_nvim_lsp.default_capabilities(lsp_capabilities)
end

-- ========================================================================== --
-- 3. LSP KEYMAPS
-- ========================================================================== --
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
-- 4. LSP SERVERS
-- ========================================================================== --
local common = {
    capabilities = lsp_capabilities,
    root_markers = { '.git' },
}

vim.lsp.config('bashls', vim.tbl_deep_extend("force", common, {
    root_markers = { '.git', '.bashrc', '.bash_profile' },
}))
vim.lsp.enable('bashls')

vim.lsp.config('gopls', vim.tbl_deep_extend("force", common, {
    root_markers = { 'go.mod', 'go.work', '.git' },
}))
vim.lsp.enable('gopls')

vim.lsp.config('terraformls', vim.tbl_deep_extend("force", common, {
    root_markers = { '.terraform', '.git' },
}))
vim.lsp.enable('terraformls')

vim.lsp.config('basedpyright', vim.tbl_deep_extend("force", common, {
    cmd = { 'basedpyright-langserver', '--stdio' },
    filetypes = { 'python' },
    root_markers = { 'pyproject.toml', 'uv.lock', 'pyrightconfig.json', '.git' },
    settings = {
        python = {
            pythonPath = '.venv/bin/python',
        },
        basedpyright = {
            analysis = {
                configFilePath = vim.fn.findfile('pyproject.toml', '.;'),
                diagnosticMode = 'openFilesOnly',
                autoImportCompletions = true,
            }
        }
    }
}))
vim.lsp.enable('basedpyright')

vim.lsp.config('ocamllsp', vim.tbl_deep_extend("force", common, {
    root_markers = { 'dune-project', 'dune-workspace', '.ocamlformat', '.git' },
}))
vim.lsp.enable('ocamllsp')

-- ========================================================================== --
-- 5. LUA_LS
-- ========================================================================== --
vim.lsp.config('lua_ls', vim.tbl_deep_extend("force", common, {
    root_markers = { '.luarc.json', '.luarc.jsonc', '.git' },
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
}))
vim.lsp.enable('lua_ls')
