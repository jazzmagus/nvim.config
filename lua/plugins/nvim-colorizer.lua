return {
  "norcalli/nvim-colorizer.lua",
  config = function()
    -- Configura colorizer per attivarsi su diversi tipi di file, con impostazioni specifiche per alcuni
    require("colorizer").setup({
      "*", -- Attiva il colorizer su tutti i file
      css = { rgb_fn = true }, -- Abilita parsing delle funzioni rgb(...) in CSS
      javascript = {}, -- Usa le opzioni di default per JavaScript
      html = {
        mode = "foreground", -- Mostra i colori nel testo (foreground)
        names = false, -- Disabilita i nomi di colore come "Blue", "Gray", ecc.
      },
      "!vim", -- Escludi i file Vim da colorizer
    }, {
      mode = "foreground", -- Usa la modalità background per tutti gli altri file
    })
  end,
}
