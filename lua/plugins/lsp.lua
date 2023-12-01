require("mason").setup({
	ui = {
		icons = {
			package_installed = "✓",
			package_pending = "➜",
			package_uninstalled = "✗",
		},
	},
})

require("mason-lspconfig").setup({
	-- 确保安装，根据需要填写
	ensure_installed = {
		"lua_ls",
		"clangd",
	},
})

local capabilities = require("cmp_nvim_lsp").default_capabilities()

require("lspconfig").lua_ls.setup({
	capabilities = capabilities,
})

require("lspconfig").clangd.setup({
	cmd = {
		"clangd",
		"--log=verbose",
		"--pretty",
		"--all-scopes-completion",
		"--completion-style=detailed",
		"--cross-file-rename",
		"--header-insertion=never",
		"--background-index",
		"--clang-tidy",
		"--clang-tidy-checks=cppcoreguidelines-*,performance-*,bugprone-*,portability-*,modernize-*,google-*",
		"--fallback-style=LLVM",
		"-j=12",
		"--pch-storage=memory",
		"--function-arg-placeholders=true",
		"--compile-commands-dir=${workspaceFolder}/build",
		"--completion-parse=auto",
	},
	filetypes = { "c", "cpp", "objc", "objcpp", "cuda" },
})

require("lspconfig").cmake.setup({
	buildDirectory = "build",
})

require("lspconfig").pylsp.setup({})
