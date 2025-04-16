-- bootstrap lazy.nvim, LazyVim and your plugins
require("config.lazy")
vim.cmd("colorscheme vague")

vim.opt.spell = true
vim.opt.spelllang = { "it", "en" } -- Aggiungi le lingue desiderate

-- text wrapping
vim.opt.wrap = true
vim.opt.linebreak = true
vim.opt.formatoptions:append("t")

-- vim.api.nvim_create_autocmd("VimEnter", {
--   pattern = "*",
--   callback = function()
--     require("snacks").dashboard.open()
--   end,
-- })
vim.api.nvim_create_autocmd("VimEnter", {
  pattern = "*",
  callback = function()
    -- Apri la dashboard SOLO se Neovim parte senza file specificati
    if vim.fn.argc() == 0 then
      require("snacks").dashboard.open()
    end
  end,
})

vim.keymap.set("n", "<leader>d", function()
  require("snacks").dashboard.open()
end, { desc = "Open Snacks Dashboard" })

-- vim.keymap.set("n", "<leader>mr", function()
--   vim.cmd("!bash /Users/diego/gingerdrops/convert.sh")
-- end, { desc = "Compila con pdfLaTeX" })

-- Correzione per obsidian.nvim (conceallevel per Markdown)
vim.api.nvim_create_autocmd("FileType", {
  pattern = "markdown",
  callback = function()
    vim.opt_local.conceallevel = 3
  end,
})
