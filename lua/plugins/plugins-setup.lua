local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
	vim.fn.system({
		"git",
		"clone",
		"--filter=blob:none",
		"https://github.com/folke/lazy.nvim.git",
		"--branch=stable", -- latest stable release
		lazypath,
	})
end
vim.opt.rtp:prepend(lazypath)

local plugins = {
	"folke/tokyonight.nvim", -- 主题
	"nvim-lualine/lualine.nvim", -- 状态栏
	"nvim-tree/nvim-tree.lua", -- 文档树
	"nvim-tree/nvim-web-devicons", -- 文档树图标

	"christoomey/vim-tmux-navigator", -- 用ctl-hjkl来定位窗口
	"nvim-treesitter/nvim-treesitter", -- 语法高亮
	"p00f/nvim-ts-rainbow", -- 配合treesitter，不同括号颜色区分

	{
		"williamboman/mason.nvim",
		"williamboman/mason-lspconfig.nvim", -- 这个相当于mason.nvim和lspconfig的桥梁
		"neovim/nvim-lspconfig",
		"mhartington/formatter.nvim", -- format
	},

	-- 自动补全
	"hrsh7th/nvim-cmp",
	"hrsh7th/cmp-nvim-lsp",
	"L3MON4D3/LuaSnip", -- snippets引擎，不装这个自动补全会出问题
	"saadparwaiz1/cmp_luasnip",
	"rafamadriz/friendly-snippets",
	"hrsh7th/cmp-path", -- 文件路径

	"numToStr/Comment.nvim", -- gcc和gc注释
	"windwp/nvim-autopairs", -- 自动补全括号

	"akinsho/bufferline.nvim", -- buffer分割线
	"lewis6991/gitsigns.nvim", -- 左则git提示

	{
		"nvim-telescope/telescope.nvim", -- 文件检索
		dependencies = { { "nvim-lua/plenary.nvim" } }, -- requires要改为dependencies
	},
	{ "lukas-reineke/indent-blankline.nvim", main = "ibl", opts = {} }, -- indent line
	"voldikss/vim-floaterm", -- float terminal
	-- cmdline
	{
		"folke/noice.nvim",
		event = "VeryLazy",
		opts = {
			-- add any options here
		},
		dependencies = {
			-- if you lazy-load any plugin below, make sure to add proper `module="..."` entries
			"MunifTanjim/nui.nvim",
			-- OPTIONAL:
			--   `nvim-notify` is only needed, if you want to use the notification view.
			--   If not available, we use `mini` as the fallback
			"rcarriga/nvim-notify",
		},
	},
	{ -- dashboard
		"nvimdev/dashboard-nvim",
		event = "VimEnter",
		opts = function()
			local logo = [[
           ██╗      ██╗     ███████╗██╗   ██╗██╗███╗   ███╗          Z
           ██║      ██║     ╚══███╔╝██║   ██║██║████╗ ████║      Z    
           ██║      ██║       ███╔╝ ██║   ██║██║██╔████╔██║   z       
           ██║      ██║      ███╔╝  ╚██╗ ██╔╝██║██║╚██╔╝██║ z         
           ███████╗ ███████╗███████╗ ╚████╔╝ ██║██║ ╚═╝ ██║           
           ╚══════╝ ╚══════╝╚══════╝  ╚═══╝  ╚═╝╚═╝     ╚═╝           
        ]]
			logo = string.rep("\n", 7) .. logo .. "\n\n"

			local opts = {
				theme = "doom",
				hide = {
					-- this is taken care of by lualine
					-- enabling this messes up the actual laststatus setting after loading a file
					statusline = false,
				},
				config = {
					header = vim.split(logo, "\n"),
            -- stylua: ignore
            center = {
                { action = "Telescope find_files",desc = " Find file",icon = " ", key = "f" },
                { action = "ene | startinsert",desc = " New file",icon = " ", key = "n" },
                { action = "Telescope oldfiles",desc = " Recent files",icon = " ", key = "r" },
                { action = "Telescope live_grep",desc = " Find text",icon = " ", key = "g" },
                { action = "Lazy",desc = " Lazy",icon = "󰒲 ", key = "l" },
                { action = "qa",desc = " Quit",icon = " ", key = "q" },
            },
					footer = function()
						local stats = require("lazy").stats()
						local ms = (math.floor(stats.startuptime * 100 + 0.5) / 100)
						return {
							"⚡ Neovim loaded " .. stats.loaded .. "/" .. stats.count .. " plugins in " .. ms .. "ms",
						}
					end,
				},
			}

			for _, button in ipairs(opts.config.center) do
				button.desc = button.desc .. string.rep(" ", 43 - #button.desc)
				button.key_format = "  %s"
			end

			-- close Lazy and re-open when the dashboard is ready
			if vim.o.filetype == "lazy" then
				vim.cmd.close()
				vim.api.nvim_create_autocmd("User", {
					pattern = "DashboardLoaded",
					callback = function()
						require("lazy").show()
					end,
				})
			end

			return opts
		end,
	},
}
require("lazy").setup(plugins, opts)
