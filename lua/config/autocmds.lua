-- Autocmds are automatically loaded on the VeryLazy event
-- Default autocmds that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/autocmds.lua
-- Add any additional autocmds here
-- Autocommand per convertire file Markdown in PDF con Pandoc
vim.api.nvim_create_autocmd("BufWritePost", {
  pattern = "*.md",                                                       -- Si applica ai file Markdown
  callback = function()
    local input_file = vim.fn.expand("%")                                 -- File Markdown attuale
    local output_file = vim.fn.expand("%:r") .. ".pdf"                    -- Nome del file PDF
    local cmd = string.format("pandoc %s -o %s", input_file, output_file) -- Comando Pandoc

    -- Esegui il comando sulla shell
    local result = vim.fn.system(cmd)

    -- Notifica all'utente l'esito dell'operazione
    if vim.v.shell_error == 0 then
      vim.notify("PDF generato: " .. output_file, vim.log.levels.INFO)
    else
      vim.notify("Errore nella generazione PDF: " .. result, vim.log.levels.ERROR)
    end
  end,
})

-- Keymap per generare PDF con Pandoc
vim.keymap.set("n", "<leader>mp", function()
  local input_file = vim.fn.expand("%")                                 -- File Markdown attuale
  local output_file = vim.fn.expand("%:r") .. ".pdf"                    -- Nome del file PDF
  local cmd = string.format("pandoc %s -o %s", input_file, output_file) -- Comando Pandoc

  -- Esegui il comando sulla shell
  local result = vim.fn.system(cmd)

  -- Notifica all'utente l'esito dell'operazione
  if vim.v.shell_error == 0 then
    vim.notify("PDF generato: " .. output_file, vim.log.levels.INFO)
  else
    vim.notify("Errore nella generazione PDF: " .. result, vim.log.levels.ERROR)
  end
end, { desc = "Genera PDF con Pandoc", noremap = true, silent = true })
