require("mason").setup({
  ui = {
      icons = {
          package_installed = "✓",
          package_pending = "➜",
          package_uninstalled = "✗"
      }
  }
})

require("mason-lspconfig").setup({
  -- 确保安装，根据需要填写
  ensure_installed = {
    "lua_ls",
  },
})

local capabilities = require('cmp_nvim_lsp').default_capabilities()

require("lspconfig").lua_ls.setup {
  capabilities = capabilities,
}

require("lspconfig").clangd.setup {
    cmd = {
        "clangd",
        "--log=verbose",
        "--pretty",
        "--all-scopes-completion",
        "--completion-style=bundled",
        "--cross-file-rename",
        "--header-insertion-decorators",
        "--background-index",
        "--clang-tidy",
        "--clang-tidy-checks=cppcoreguidelines-*,performance-*,bugprone-*,portability-*,modernize-*,google-*",
        "--fallback-style=Google",
        "-j=12",
        "--pch-storage=memory",
        "--function-arg-placeholders=false",
        "--compile-commands-dir=${workspaceFolder}/build",
        "--completion-parse=auto"
    },
    filetypes = {"c", "cpp", "objc", "objcpp", "cuda"}
}
