return {
  {
    "folke/snacks.nvim",
    lazy = false,    -- Questo garantisce che venga caricato all'avvio
    priority = 1000, -- Assegna un'alta priorità di caricamento
    opts = {
      lazygit = {
        theme = {
          selectedLineBgColor = { bg = "CursorLine" },
        },
      },
      notifier = {
        enabled = true,
        top_down = false, -- Notifiche dall'alto verso il basso
        ui = {
          border = "rounded",
          zindex = 100,
          ft = "markdown",
          wo = {
            winblend = 5,
            wrap = false,
            conceallevel = 2,
            colorcolumn = "",
          },
          bo = { filetype = "snacks_notif" },
        },
      },
      dashboard = {
        preset = {
          keys = {
            { icon = " ", key = "f", desc = "Find File", action = ":lua Snacks.dashboard.pick('files')" },
            { icon = " ", key = "n", desc = "New File", action = ":ene | startinsert" },
            { icon = " ", key = "r", desc = "Recent Files", action = ":lua Snacks.dashboard.pick('oldfiles')" },
            { icon = " ", key = "g", desc = "Find Text", action = ":lua Snacks.dashboard.pick('live_grep')" },
            {
              icon = " ",
              key = "c",
              desc = "Config",
              action = ":lua Snacks.dashboard.pick('files', {cwd = vim.fn.stdpath('config')})",
            },
            { icon = " ", key = "s", desc = "Restore Session", action = ":lua require('persistence').load()" },
            { icon = "󰒲 ", key = "l", desc = "Lazy", action = ":Lazy" },
            { icon = " ", key = "<esc>", desc = "Quit", action = ":qa" },
          },
          header = [[
██╗      ███╗   ███╗ █████╗  ██████╗ ██╗   ██╗███████╗██╗
╚██╗     ████╗ ████║██╔══██╗██╔════╝ ██║   ██║██╔════╝██║
 ╚██╗    ██╔████╔██║███████║██║  ███╗██║   ██║███████╗██║
 ██╔╝    ██║╚██╔╝██║██╔══██║██║   ██║██║   ██║╚════██║╚═╝
██╔╝     ██║ ╚═╝ ██║██║  ██║╚██████╔╝╚██████╔╝███████║██╗
╚═╝      ╚═╝     ╚═╝╚═╝  ╚═╝ ╚═════╝  ╚═════╝ ╚══════╝╚═╝
                                                          ]],
        },
        sections = {
          { section = "header" },
          { icon = " ", title = "Keymaps", section = "keys", indent = 2, padding = 1 },
          { icon = " ", title = "Recent Files", section = "recent_files", indent = 2, padding = 1 },
          -- { title = "Sessions", padding = 1 },
          -- { icon = " ", title = "Projects", section = "projects", indent = 2, padding = 1 },
          -- { section = "startup" },
        },
      },
    },
  },
}
