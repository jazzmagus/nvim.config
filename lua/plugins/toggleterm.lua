return {
  "akinsho/toggleterm.nvim",
  version = "*", -- Usa sempre l'ultima versione stabile
  config = function()
    require("toggleterm").setup({
      size = 20,
      open_mapping = [[<C-t>]],
      hide_numbers = true,
      shade_filetypes = {},
      shade_terminals = true,
      shading_factor = 2,
      start_in_insert = true,
      persist_size = true,
      direction = "float", -- Usa finestra flottante
      float_opts = {
        border = "rounded",
        width = 100,
        height = 30,
        winblend = 10,
      },
      on_open = function()
        require("noice").disable() -- Disabilita Noice durante l'apertura del terminale
      end,
      on_close = function()
        require("noice").enable() -- Riabilita Noice dopo la chiusura del terminale
      end,
    })
    -- vim.keymap.set(
    --   "n",
    --   "<leader>ft",
    --   "<cmd>ToggleTerm direction=float<CR>",
    --   { noremap = true, silent = true, desc = "Floating Terminal" }
    -- )
    vim.keymap.set("t", "<Esc>", [[<C-\><C-n>:q<CR>]], { noremap = true, silent = true, desc = "Close Terminal" })
  end,
}

-- return {
--   "voldikss/vim-floaterm",
--   config = function()
--     vim.g.floaterm_keymap_toggle = "<leader>ft" -- Mappa per aprire/chiudere il terminale flottante
--     vim.g.floaterm_width = 0.8 -- Larghezza della finestra flottante (80% della larghezza dello schermo)
--     vim.g.floaterm_height = 0.8 -- Altezza della finestra flottante (80% dell'altezza dello schermo)
--     vim.g.floaterm_wintype = "float" -- Tipo di finestra: flottante
--     vim.g.floaterm_position = "center" -- Posizione della finestra: centrata
--     vim.g.floaterm_borderchars = "─│─│╭╮╯╰" -- Caratteri del bordo della finestra
--   end,
-- }

-- return {
--   "EmilOhlsson/FloatTerm.nvim",
--   config = function()
--     require("FloatTerm").setup({
--       -- Configurazione personalizzata
--       border = "rounded", -- Tipi di bordi: 'rounded', 'single', 'double', etc.
--       width = 0.8, -- Percentuale della larghezza della finestra
--       height = 0.8, -- Percentuale dell'altezza della finestra
--       winblend = 10, -- Trasparenza della finestra
--     })
--
--     -- Keybinding per aprire il terminale
--     vim.keymap.set(
--       "n",
--       "<leader>ft",
--       ":FloatTerm<CR>",
--       { noremap = true, silent = true, desc = "Open Floating Terminal" }
--     )
--   end,
-- }
