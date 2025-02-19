return {
  "preservim/vim-pencil",
  lazy = false, -- Carica il plugin all'avvio
  config = function()
    -- Abilita vim-pencil automaticamente in file Markdown e testi
    vim.cmd([[
      augroup Pencil
        autocmd!
        autocmd FileType markdown,text call pencil#init({'wrap': 'soft', 'textwidth': 80})
      augroup END
    ]])

    -- Opzioni aggiuntive
    vim.g["pencil#wrapModeDefault"] = "soft" -- Wrap morbido
    vim.g["pencil#textwidth"] = 80 -- Larghezza testo 80 caratteri
    vim.g["pencil#conceallevel"] = 2 -- Nasconde caratteri Markdown opzionali
  end,
}
