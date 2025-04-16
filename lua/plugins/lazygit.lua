return {
  "kdheepak/lazygit.nvim",
  enabled = false,
  lazy = true, -- Caricamento lazy (non si apre da solo)
  dependencies = {
    "nvim-lua/plenary.nvim",
    "folke/snacks.nvim", -- Dipendenza esplicita
  },
  config = function()
    -- Solo configurazione SSH (NON impostare vim.g.lazygit_...)
    vim.env.GIT_SSH_COMMAND = "ssh -i ~/.ssh/id_rsa -o IdentitiesOnly=yes"
    vim.env.SSH_AUTH_SOCK = vim.fn.expand("$SSH_AUTH_SOCK") or ""
  end,
}
