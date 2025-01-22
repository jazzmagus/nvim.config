return {
  "goolord/alpha-nvim",
  dependencies = { "nvim-tree/nvim-web-devicons" },
  opts = function(_, opts)
    local dashboard = require("alpha.themes.dashboard")

    -- Funzione per generare una citazione casuale
    local quotes = {
      "Code is like humor. When you have to explain it, it’s bad.",
      "Any fool can write code that a computer can understand. Good programmers write code that humans can understand.",
      "First, solve the problem. Then, write the code.",
      "Experience is the name everyone gives to their mistakes.",
      "In order to be irreplaceable, one must always be different.",
      "Java is to JavaScript what car is to Carpet.",
      "Knowledge is power.",
      "Simplicity is the soul of efficiency.",
      "Fix the cause, not the symptom.",
    }

    -- Funzione per ottenere una citazione casuale
    local function get_random_quote()
      math.randomseed(os.time())
      return quotes[math.random(#quotes)]
    end

    -- Funzione per calcolare il tempo di avvio
    local function get_startup_time()
      local start_time = vim.g.start_time or vim.loop.hrtime()
      local elapsed_ms = (vim.loop.hrtime() - start_time) / 1e6
      return string.format("%.2fms", elapsed_ms)
    end

    -- Imposta il nuovo header
    dashboard.section.header.val = {
      [[██╗      ███╗   ███╗ █████╗  ██████╗ ██╗   ██╗███████╗██╗]],
      [[╚██╗     ████╗ ████║██╔══██╗██╔════╝ ██║   ██║██╔════╝██║]],
      [[ ╚██╗    ██╔████╔██║███████║██║  ███╗██║   ██║███████╗██║]],
      [[ ██╔╝    ██║╚██╔╝██║██╔══██║██║   ██║██║   ██║╚════██║╚═╝]],
      [[██╔╝     ██║ ╚═╝ ██║██║  ██║╚██████╔╝╚██████╔╝███████║██╗]],
      [[╚═╝      ╚═╝     ╚═╝╚═╝  ╚═╝ ╚═════╝  ╚═════╝ ╚══════╝╚═╝]],
      [[                                                          ]],
    }

    -- Imposta i comandi con Devicons
    dashboard.section.buttons.val = {
      dashboard.button("f", "  Find File", ":Telescope find_files<CR>"),
      dashboard.button("n", "  New File", ":ene <BAR> startinsert <CR>"),
      dashboard.button("r", "  Recent Files", ":Telescope oldfiles<CR>"),
      dashboard.button("g", "  Find Text", ":Telescope live_grep<CR>"),
      dashboard.button("c", "  Config", ":e $MYVIMRC<CR>"),
      -- dashboard.button("s", "󰍉  Restore Session", ":RestoreSession<CR>"),
      dashboard.button("s", "󰍉  Restore Session", ":Telescope persisted<CR>"),
      dashboard.button("x", "  Lazy Extras", ":Lazy extras<CR>"),
      dashboard.button("l", "󰒲  Lazy", ":Lazy<CR>"),
      dashboard.button("q", "  Quit", ":qa<CR>"),
    }

    -- Calcola il numero di plugin caricati
    local stats = require("lazy").stats()
    local footer_message =
        string.format("󰛕 Neovim loaded %d/%d plugins in %s", stats.loaded, stats.count, get_startup_time())

    -- Imposta il footer con una citazione casuale
    dashboard.section.footer.val = {
      footer_message,
      "", -- Linea vuota per separare
      "  " .. get_random_quote(), -- Aggiunge la citazione casuale
    }
    dashboard.section.footer.opts.hl = "AlphaFooter"

    -- Configura il layout
    opts.layout = {
      { type = "padding", val = 6 },
      dashboard.section.header,
      { type = "padding", val = 2 },
      dashboard.section.buttons,
      { type = "padding", val = 1 },
      dashboard.section.footer,
    }

    return opts
  end,
}
