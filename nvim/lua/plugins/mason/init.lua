return {
  "williamboman/mason.nvim",
  dependencies = {
    "williamboman/mason-lspconfig.nvim",
  },
  config = function()
    require("mason").setup({
      ui = {
        icons = {
          package_installed = "✓",
          package_pending = "➜",
          package_uninstalled = "✗"
        },
      },
    })
    require("mason-lspconfig").setup({
      ensure_installed = {
        "vimls",
        "lua_ls",
        "html",
        "cssls",
        "tailwindcss",
        "ts_ls",
        "clangd",
        "rust_analyzer",
        "gopls",
        "zls",
        "pyright",
        "csharp_ls",
        "jdtls",
        "kotlin_language_server",
        -- "svelte",
        -- "graphql",
        -- "emmet_ls",
        -- "prismals",
      },
      automatic_installation = true,
    })
  end,
}
