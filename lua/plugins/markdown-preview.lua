return {
  "iamcco/markdown-preview.nvim",
  build = "cd app && npm install", -- Questo assicura che i moduli vengano installati
  keys = {
    {
      "<leader>mp",
      ft = "markdown",
      "<cmd>MarkdownPreviewToggle<cr>",
      desc = "Markdown Preview",
    },
  },
  config = function()
    vim.g.mkdp_auto_start = 0 -- Assicura che l'anteprima non si avvii automaticamente
  end,
}
