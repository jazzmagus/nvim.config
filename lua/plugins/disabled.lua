-- lua/plugins/disabled.lua
return {
  -- Disabilita obsidian.nvim
  {
    "epwalsh/obsidian.nvim",
    enabled = true,
  },
  -- Aggiungi altri plugin da disabilitare
  {
    "nvimdev/dashboard-nvim",
    enabled = false,
  },
  {
    "folke/todo-comments.nvim",
    enabled = false,
  },
  {
    "bullets-vim/bullets.vim",
    enabled = true,
  },
  {
    "MeanderingProgrammer/render-markdown.nvim",
    enabled = false,
  },
  {
    "lukas-reineke/headlines.nvim",
    enabled = false,
  },
  {
    "goolord/alpha-nvim",
    enabled = false,
  },
  {
    "rmagatti/auto-session",
    enabled = false,
  },
  {
    "arnamak/stay-centered.nvim",
    enabled = false,
  },
  {
    "OXY2DEV/markview.nvim",
    enabled = true,
  },
  {
    "zbirenbaum/copilot.nvim",
    enabled = false, -- Questo impedisce il caricamento
  },
}
