return {
  {
    "echasnovski/mini.icons",
    version = "*", -- Usa la versione stabile
    config = function()
      require("mini.icons").setup({
        -- Scegli tra diversi set di icone predefiniti
        sets = {
          default = true, -- Usa il set predefinito
          devicons = true, -- Abilita le icone di nvim-web-devicons
          codicons = false, -- Puoi attivare anche Codicons se preferisci
        },
      })
    end,
  },
}
