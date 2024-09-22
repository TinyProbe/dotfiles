return {
  "neovim/nvim-lspconfig",
  event = {
    "BufReadPre", "BufNewFile",
  },
  dependencies = {
    "hrsh7th/cmp-nvim-lsp",
    { "antosha417/nvim-lsp-file-operations", config = true, },
  },
  config = function()
    local lspconfig = require("lspconfig")
    local cmp_nvim_lsp = require("cmp_nvim_lsp")
    local keymap = vim.keymap
    local opts = { noremap = true, silent = true, }
    local on_attach = function(client, bufnr)
      opts.buffer = bufnr
      opts.desc = "Show LSP references"
      keymap.set("n", "<leader>gR", "<cmd>Telescope lsp_references<cr>", opts)
      opts.desc = "Go to declaration"
      keymap.set("n", "<leader>gD", vim.lsp.buf.declaration, opts)
      opts.desc = "Go to LSP definitions"
      keymap.set("n", "<leader>gd", "<cmd>Telescope lsp_definitions<cr>", opts)
      opts.desc = "Go to LSP implementations"
      keymap.set("n", "<leader>gi", "<cmd>Telescope lsp_implementations<cr>", opts)
      opts.desc = "Go to LSP type definitions"
      keymap.set("n", "<leader>gt", "<cmd>Telescope lsp_type_definitions<cr>", opts)
      opts.desc = "Go to available code actions"
      keymap.set({ "n", "v" }, "<leader>gc", vim.lsp.buf.code_action, opts)
      opts.desc = "Smart rename"
      keymap.set("n", "<leader>rn", vim.lsp.buf.rename, opts)
      opts.desc = "Go to buffer diagnostics"
      keymap.set("n", "<leader>D", "<cmd>Telescope diagnostics bufnr=0<cr>", opts)
      opts.desc = "Go to line diagnostics"
      keymap.set("n", "<leader>d", vim.diagnostic.open_float, opts)
      opts.desc = "Go to previous diagnostic"
      keymap.set("n", "[d", vim.diagnostic.goto_prev, opts)
      opts.desc = "Go to next diagnostic"
      keymap.set("n", "]d", vim.diagnostic.goto_next, opts)
      opts.desc = "Go to documentation"
      keymap.set("n", "K", vim.lsp.buf.hover, opts)
      opts.desc = "Restart LSP"
      keymap.set("n", "<leader>rs", "<cmd>LspRestart<cr>", opts)
    end

    local capabilities = cmp_nvim_lsp.default_capabilities()
    local signs = { Error = " ", Warn = " ", Info = " ", Hint = "", }
    for type,icon in pairs(signs) do
      local hl = "DiagnosticSign" .. type
      vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = "", })
    end

    lspconfig["ts_ls"].setup({
      capabilities = capabilities,
      on_attach = on_attach,
    })
    lspconfig["html"].setup({
      capabilities = capabilities,
      on_attach = on_attach,
    })
    lspconfig["cssls"].setup({
      capabilities = capabilities,
      on_attach = on_attach,
    })
    lspconfig["tailwindcss"].setup({
      capabilities = capabilities,
      on_attach = on_attach,
    })
    lspconfig["svelte"].setup({
      capabilities = capabilities,
      on_attach = on_attach,
    })
    lspconfig["lua_ls"].setup({
      capabilities = capabilities,
      on_attach = on_attach,
      settings = {
        Lua = {
          diagnostics = {
            globals = { "vim", },
          },
          workspace = {
            library = {
              [vim.fn.expand("$VIMRUNTIME/lua")] = true,
              [vim.fn.stdpath("config") .. "/lua"] = true,
            },
          },
        },
      },
    })
    lspconfig["graphql"].setup({
      capabilities = capabilities,
      on_attach = on_attach,
    })
    lspconfig["emmet_ls"].setup({
      capabilities = capabilities,
      on_attach = on_attach,
      filetypes = {
        "html", "typescriptreact", "javascriptreact",
        "css", "sass", "scss", "less", "svelte",
      },
    })
    lspconfig["prismals"].setup({
      capabilities = capabilities,
      on_attach = on_attach,
    })
    lspconfig["pyright"].setup({
      capabilities = capabilities,
      on_attach = on_attach,
    })
  end,
}