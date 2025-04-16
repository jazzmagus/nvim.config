return {
  "kdheepak/lazygit.nvim",
  lazy = false,
  -- enabled = false,  <-- Rimuovi o imposta a true
  dependencies = {
    "nvim-lua/plenary.nvim",
  },
  config = function()
    vim.g.lazygit_floating_window_scaling_factor = 1.0
    -- Aggiungi queste variabili d'ambiente
    vim.env.GIT_SSH_COMMAND = "ssh -i ~/.ssh/id_rsa" -- Percorso alla tua chiave privata
    vim.env.SSH_AUTH_SOCK = vim.fn.expand("$SSH_AUTH_SOCK")
  end,
}
