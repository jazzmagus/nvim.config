-- Aggiungi il plugin 'junegunn/goyo.vim' tramite Lazy
return {
  "junegunn/goyo.vim",
  config = function()
    -- Qui puoi aggiungere le tue configurazioni personalizzate per Goyo
    vim.g.goyo_width = 100 -- Esempio: imposta la larghezza della finestra a 100 colonne
    vim.g.goyo_height = 40 -- Imposta l'altezza della finestra
    vim.g.goyo_save = 1 -- Salva automaticamente la sessione quando attivi Goyo
  end,
}
