-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

local latex_templates = require("latex_templates")
vim.keymap.set("n", "<leader>zt", latex_templates.choose_latex_template, { desc = "Scegli un template LaTeX" })

-- -- Mini.files menu
-- vim.keymap.set("n", "<leader>mf", ":MiniFiles<CR>", { desc = "Apri Mini Files" })
--
--
-- vim.keymap.set("n", "<leader>ft", ":FloatTerm<CR>", { noremap = true, silent = true, desc = "Open Floating Terminal" })
-- vim.keymap.set("t", "<Esc>", "<C-\\><C-n>:q<CR>", { noremap = true, silent = true, desc = "Close Floating Terminal" })

-- oil
vim.keymap.set("n", "-", "<CMD>Oil<CR>", { desc = "Open parent directory" })
-- vim.keymap.set("n", "<leader>qa", "<CMD>Alpha<CR>", { desc = "Torna alla schermata iniziale" })

-- vim.api.nvim_set_keymap(
--   "n",
--   "<C-p>",
--   ":lua require'telescope'.extensions.project.project{}<CR>",
--   { noremap = true, silent = true }
-- )
