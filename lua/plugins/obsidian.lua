return {
  "epwalsh/obsidian.nvim",
  version = "*",
  lazy = true,
  ft = "markdown",
  dependencies = {
    "nvim-lua/plenary.nvim",
    "nvim-telescope/telescope.nvim",
    -- Aggiungi se vuoi supporto per incollare immagini dagli appunti
    "ekickx/clipboard-image.nvim",
  },
  opts = {
    workspaces = {
      {
        name = "2023_obsidian_sync",
        path = "~/Documents/2023_obsidian_sync",
      },
    },
    daily_notes = {
      folder = "30_Life_Log/31_Daily_Log",
      date_format = "%Y-%m-%d",
    },
    templates = {
      subdir = "40_Templater",
      default = "new_note",
      date_format = "%Y-%m-%d",
      time_format = "%H:%M",
    },
    --
    -- Nuova sezione per gli allegati, immagini comprese
    attachments = {
      img_folder = "50_Allegati",
      img_text_func = function(_, path)
        -- 1. Validazione robusta del percorso
        if not path or type(path) ~= "string" or path == "" then
          local fallback_name = "image_" .. os.date("%Y%m%d%H%M%S") .. ".png"
          vim.notify("Usato nome di fallback: " .. fallback_name, vim.log.levels.WARN)
          return string.format("![%s](%s/%s)", fallback_name, "50_Allegati/images", fallback_name)
        end

        -- 2. Estrazione sicura del nome file
        local filename = path:match("[^/\\]+$") or path -- Se il match fallisce, usa l'intero path
        filename = filename:gsub("%s+", "_") -- Sostituisci spazi con underscore

        -- 3. Generazione percorso univoco
        local unique_name = os.date("%Y%m%d%H%M%S") .. "_" .. filename
        local relative_path = "50_Allegati" .. unique_name

        -- 4. Formattazione del link
        return string.format("![%s](%s)", filename, relative_path)
      end,
      prompt_for_filename = false, -- Disabilita il dialogo di conferma
    },
    ui = {
      enable = false,
    },
    overrides = function()
      vim.opt_local.conceallevel = 3
    end,
  },
  config = function(_, opts)
    require("obsidian").setup(opts)

    -- Imposta il binding per il template
    vim.keymap.set("n", "<leader>ot", ":ObsidianTemplate mio-template<CR>", { desc = "Insert [m]y [t]emplate" })

    -- Keymap per incollare immagini dagli appunti (richiede clipboard-image.nvim)
    vim.keymap.set("n", "<leader>pi", function()
      local img_path = require("clipboard-image").paste_image()
      if img_path then
        local note = require("obsidian").get_current_note()
        if note then
          local link = opts.attachments.img_text_func(nil, img_path)
          vim.api.nvim_put({ link }, "", true, true)
        end
      end
    end, { desc = "[P]aste [i]mage" })
  end,
}
