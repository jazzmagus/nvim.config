return {
  "folke/snacks.nvim",
  event = "VeryLazy",
  keys = {
    -- Git Log
    {
      "<leader>gl",
      function()
        require("snacks.picker").git_log({
          layout = "vertical",
        })
      end,
      desc = "Git Log",
    },
    -- Incomplete Tasks
    {
      "<leader>tt",
      function()
        require("snacks.picker").grep({
          search = "^\\s*- \\[ \\]",
          regex = true,
          dirs = { vim.fn.getcwd() },
          args = { "--no-ignore" },
          on_show = function()
            vim.cmd.stopinsert()
          end,
          layout = "ivy",
        })
      end,
      desc = "[P]Search for incomplete tasks",
    },
    -- Completed Tasks
    {
      "<leader>tc",
      function()
        require("snacks.picker").grep({
          search = "^\\s*- \\[x\\] `done:",
          regex = true,
          dirs = { vim.fn.getcwd() },
          args = { "--no-ignore" },
          on_show = function()
            vim.cmd.stopinsert()
          end,
          layout = "select",
        })
      end,
      desc = "[P]Search for complete tasks",
    },
    -- Branches
    {
      "<M-b>",
      function()
        require("snacks.picker").git_branches()
      end,
      desc = "Branches",
    },
    -- Keymaps
    {
      "<M-k>",
      function()
        require("snacks.picker").keymaps()
      end,
      desc = "Keymaps",
    },
    -- Files
    {
      "<leader><space>",
      function()
        require("snacks.picker").files()
      end,
      desc = "Find Files",
    },
    -- Buffers
    {
      "<leader>tb",
      function()
        require("snacks.picker").buffers({
          on_show = function()
            vim.cmd.stopinsert()
          end,
          layout = "ivy",
        })
      end,
      desc = "[P]Snacks picker buffers",
    },
    -- Dashboard
    {
      "<leader>sd",
      function()
        require("snacks.dashboard").open()
      end,
      desc = "[S]how [D]ashboard",
    },
  },
  opts = {
    -- Configurazione LazyGit
    lazygit = {
      theme = {
        selectedLineBgColor = { bg = "CursorLine" },
      },
      win = {
        style = "dashboard",
        width = 0,
        height = 0,
      },
      setup = function()
        vim.env.GIT_SSH_COMMAND = "ssh -i ~/.ssh/id_rsa -o IdentitiesOnly=yes"
        vim.env.SSH_AUTH_SOCK = vim.fn.expand("$SSH_AUTH_SOCK") or ""
      end,
    },

    -- Configurazione Picker
    picker = {
      transform = function(item)
        if item.file and item.file:match("lazyvim/lua/config/keymaps%.lua") then
          item.score_add = (item.score_add or 0) - 30
        end
        return item
      end,
      debug = { scores = true },
      layout = { preset = "ivy", cycle = false },
      layouts = {
        ivy = {
          layout = {
            box = "vertical",
            backdrop = false,
            row = -1,
            width = 0,
            height = 0.5,
            border = "top",
            title = " {title} {live} {flags}",
            title_pos = "left",
            { win = "input", height = 1, border = "bottom" },
            {
              box = "horizontal",
              { win = "list", border = "none" },
              { win = "preview", title = "{preview}", width = 0.5, border = "left" },
            },
          },
        },
        vertical = {
          layout = {
            backdrop = false,
            width = 0.8,
            min_width = 80,
            height = 0.8,
            min_height = 30,
            box = "vertical",
            border = "rounded",
            title = "{title} {live} {flags}",
            title_pos = "center",
            { win = "input", height = 1, border = "bottom" },
            { win = "list", border = "none" },
            { win = "preview", title = "{preview}", height = 0.4, border = "top" },
          },
        },
      },
      matcher = {
        frecency = true,
      },
      win = {
        input = {
          keys = {
            ["<Esc>"] = { "close", mode = { "n", "i" } },
            ["J"] = { "preview_scroll_down", mode = { "i", "n" } },
            ["K"] = { "preview_scroll_up", mode = { "i", "n" } },
            ["H"] = { "preview_scroll_left", mode = { "i", "n" } },
            ["L"] = { "preview_scroll_right", mode = { "i", "n" } },
          },
        },
      },
    },

    -- Configurazione Formato Immagini
    image = {
      formats = { "png", "jpg", "jpeg", "gif", "webp", "pdf" },
      doc = {
        inline = vim.g.neovim_mode == "skitty",
        float = true,
        max_width = vim.g.neovim_mode == "skitty" and 5 or 60,
        max_height = vim.g.neovim_mode == "skitty" and 2.5 or 30,
      },
      styles = {
        snacks_image = {
          relative = "editor",
          col = -1,
        },
      },
    },

    -- Configurazione Dashboard
    dashboard = {
      preset = {
        keys = {
          { icon = " ", key = "f", desc = "Find File", action = ":lua require('snacks.picker').files()" },
          { icon = " ", key = "n", desc = "New File", action = ":ene | startinsert" },
          { icon = " ", key = "r", desc = "Recent Files", action = ":lua require('snacks.picker').oldfiles()" },
          { icon = " ", key = "g", desc = "Find Text", action = ":lua require('snacks.picker').live_grep()" },
          {
            icon = " ",
            key = "c",
            desc = "Config",
            action = ":lua require('snacks.picker').files({cwd = vim.fn.stdpath('config')})",
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
      },
    },

    -- Notifiche
    notifier = {
      enabled = true,
      top_down = false,
    },
  },
}
