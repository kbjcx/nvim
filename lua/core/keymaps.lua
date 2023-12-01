vim.g.mapleader = " "
local keymap = vim.keymap
-- ---------- 插入模式 ---------- ---
keymap.set("i", "jk", "<ESC>")

-- ---------- 视觉模式 ---------- ---
-- 单行或多行移动
keymap.set("v", "J", ":m '>+1<CR>gv=gv")
keymap.set("v", "K", ":m '<-2<CR>gv=gv")

-- ---------- 正常模式 ---------- ---
-- 窗口
keymap.set("n", "<leader>sv", ":vsp<CR>") -- 水平新增窗口
keymap.set("n", "<leader>sh", ":sp<CR>") -- 垂直新增窗口

-- 取消高亮
keymap.set("n", "<leader>nh", ":nohl<CR>")

-- 切换buffer
keymap.set("n", "<S-L>", ":bnext<CR>")
keymap.set("n", "<S-H>", ":bprevious<CR>")

-- open float terminal
keymap.set("n", "<leader>t", ":FloatermNew --autoclose=2<CR>")

-- ---------- 插件 ---------- ---
-- nvim-tree
keymap.set("n", "<leader>e", ":NvimTreeToggle<CR>")
keymap.set("n", "<leader>f", ":NvimTreeFocus<CR>")
-- save file
keymap.set("i", "<C-s>", "<ESC>:w!<CR>")
keymap.set("n", "<C-s>", ":w!<CR>")
-- close current buffer
keymap.set("i", "<C-w>", "<ESC>:w!<CR>:bd %<CR>")
keymap.set("n", "<C-w>", ":bd %<CR>")
-- undo
keymap.set("i", "<C-z>", "<ESC>:undo<CR>")
keymap.set("n", "<C-z>", ":undo<CR>")
-- redo
keymap.set("i", "<C-y>", "<ESC>:redo<CR>")
keymap.set("n", "<C-y>", ":redo<CR>")

keymap.set("n", "]]", "<END>")
keymap.set("n", "[[", "<HOME>")
keymap.set("i", "]]", "<END>")
keymap.set("i", "[[", "<HOME>")
keymap.set("n", "<leader>[", "<PAGEUP>")
keymap.set("n", "<leader>]", "<PAGEDOWN>")
