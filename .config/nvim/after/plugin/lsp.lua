local lsp = require('lsp-zero').preset({})

lsp.ensure_installed({
    'lua_ls',
    'pyright',
    'gopls',
    'rust_analyzer',
    'yamlls',
    'cssls',
    'html',
    'terraformls',
    'emmet_language_server'
    })

    local cmp = require('cmp')
    local cmp_select = {behavior = cmp.SelectBehavior.Select}
    local cmp_mappings = lsp.defaults.cmp_mappings({
        ['<C-p>'] = cmp.mapping.select_prev_item(cmp_select),
        ['<C-n>'] = cmp.mapping.select_next_item(cmp_select),
        ['<C-y>'] = cmp.mapping.confirm({ select = true }),
        ['<C-Space>'] = cmp.mapping.complete(),
    })

    lsp.set_preferences({
        sign_icons = { }
    })

    lsp.setup_nvim_cmp({
        mapping = cmp_mappings
    })

    lsp.on_attach(function(client, bufnr)
        local opts = {buffer = bufnr, remap = false}

        vim.keymap.set("n", "gd", function() vim.lsp.buf.definition() end, opts)
        vim.keymap.set("n", "K", function() vim.lsp.buf.hover() end, opts)
        vim.keymap.set("n", "<leader>vws", function() vim.lsp.buf.workspace_symbol() end, opts)
        vim.keymap.set("n", "<leader>vd", function() vim.diagnostic.open_float() end, opts)
        vim.keymap.set("n", "[d", function() vim.diagnostic.goto_next() end, opts)
        vim.keymap.set("n", "]d", function() vim.diagnostic.goto_prev() end, opts)
        vim.keymap.set("n", "<leader>vca", function() vim.lsp.buf.code_action() end, opts)
        vim.keymap.set("n", "<leader>vrr", function() vim.lsp.buf.references() end, opts)
        vim.keymap.set("n", "<leader>vrn", function() vim.lsp.buf.rename() end, opts)
        vim.keymap.set("i", "<C-h>", function() vim.lsp.buf.signature_help() end, opts)
    end)

    lsp.configure('pyright', {
        settings = {
            python = {
                analysis = { diagnosticMode = "off", typeCheckingMode = "off" },
            },
        }
    }
    )
    

-- local function setup_diags()
--   vim.lsp.handlers["textDocument/publishDiagnostics"] = vim.lsp.with(
--     vim.lsp.diagnostic.on_publish_diagnostics,
--     {
--       virtual_text = false,
--       signs = true,
--       update_in_insert = false,
--       underline = true,
--     }
--   )
-- end
-- 
-- setup_diags()

vim.cmd([[map <space>e :lua vim.diagnostic.open_float(0, {scope="line"})<CR>]])

for _, method in ipairs({ 'textDocument/diagnostic', 'workspace/diagnostic' }) do
    local default_diagnostic_handler = vim.lsp.handlers[method]
    vim.lsp.handlers[method] = function(err, result, context, config)
        if err ~= nil and err.code == -32802 then
            return
        end
        return default_diagnostic_handler(err, result, context, config)
    end
end

-- emmet
vim.cmd([[map <space>e :lua vim.diagnostic.open_float(0, {scope="line"})<CR>]])
vim.api.nvim_create_autocmd({ "FileType" }, {
  pattern = "css,eruby,html,htmldjango,javascriptreact,less,pug,sass,scss,typescriptreact",
  callback = function()
    vim.lsp.start({
      cmd = { "emmet-language-server", "--stdio" },
      root_dir = vim.fs.dirname(vim.fs.find({ ".git" }, { upward = true })[1]),
      -- Read more about this options in the [vscode docs](https://code.visualstudio.com/docs/editor/emmet#_emmet-configuration).
      -- **Note:** only the options listed in the table are supported.
      init_options = {
        ---@type table<string, string>
        includeLanguages = {},
        --- @type string[]
        excludeLanguages = {},
        --- @type string[]
        extensionsPath = {},
        --- @type table<string, any> [Emmet Docs](https://docs.emmet.io/customization/preferences/)
        preferences = {},
        --- @type boolean Defaults to `true`
        showAbbreviationSuggestions = true,
        --- @type "always" | "never" Defaults to `"always"`
        showExpandedAbbreviation = "always",
        --- @type boolean Defaults to `false`
        showSuggestionsAsSnippets = false,
        --- @type table<string, any> [Emmet Docs](https://docs.emmet.io/customization/syntax-profiles/)
        syntaxProfiles = {},
        --- @type table<string, string> [Emmet Docs](https://docs.emmet.io/customization/snippets/#variables)
        variables = {},
      },
    })
  end,
})

lsp.setup()
