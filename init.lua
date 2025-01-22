-- bootstrap lazy.nvim, LazyVim and your plugins
require("config.lazy")
vim.cmd("colorscheme vague")

vim.opt.spell = true
vim.opt.spelllang = { "it", "en" } -- Aggiungi le lingue desiderate

-- text wrapping
vim.opt.wrap = true
vim.opt.linebreak = true
vim.opt.formatoptions:append("t")

vim.api.nvim_create_autocmd("VimEnter", {
  pattern = "*",
  callback = function()
    require("snacks").dashboard.open()
  end,
})
