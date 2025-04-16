return {
  "iamcco/markdown-preview.nvim",
  ft = "markdown", -- Carica solo per file markdown
  build = "cd app && npm install",
  init = function() -- Configurazione anticipata
    vim.g.mkdp_auto_start = 0
    vim.g.mkdp_auto_close = 1
    vim.g.mkdp_theme = "dark" -- Opzionale: tema scuro
    vim.g.mkdp_refresh_slow = 0 -- Disabilita refresh lento
    vim.g.mkdp_page_title = "${name}" -- Formato titolo pagina
    vim.g.mkdp_filetypes = { "markdown" } -- Solo MD, no file casuali
    vim.g.mkdp_pdf_command = "" -- Disabilita esportazione PDF
    -- vim.g.mkdp_pdf_command = "pandoc" -- Usa solo se pandoc è installato
    vim.g.mkdp_pdf_to_file = 0 -- Non generare automaticamente PDF
  end,
  keys = {
    {
      "<leader>mp",
      function()
        if vim.bo.filetype ~= "markdown" then
          vim.notify("Solo file markdown supportati", vim.log.levels.WARN)
          return
        end
        vim.cmd("MarkdownPreviewToggle")
      end,
      desc = "Markdown Preview",
      mode = { "n", "v" },
    },
  },
  config = function()
    -- Aggiungi qui eventuali impostazioni aggiuntive
  end,
}
