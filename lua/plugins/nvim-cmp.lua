return {
  {
    "hrsh7th/nvim-cmp",
    dependencies = { "hrsh7th/cmp-emoji" },
    opts = function(_, opts)
      local cmp = require("cmp")

      -- Modifica i mapping
      opts.mapping = vim.tbl_deep_extend("force", opts.mapping or {}, {
        -- Disabilita <CR> per accettare i completamenti
        ["<CR>"] = cmp.config.disable,
        -- Conferma il completamento con <C-y>
        ["<C-y>"] = cmp.mapping.confirm({ select = true }),
      })

      -- Imposta le priorità delle sorgenti
      opts.sources = vim.tbl_deep_extend("force", opts.sources or {}, {
        { name = "nvim_lsp", priority = 1000, group_index = 1 },
        { name = "luasnip",  priority = 900,  group_index = 2 },
        { name = "emoji",    priority = 800,  group_index = 3 },
      })

      -- Configura il sistema di ordinamento
      opts.sorting = {
        priority_weight = 2,
        comparators = {
          cmp.config.compare.exact,
          cmp.config.compare.score,
          cmp.config.compare.kind,
          cmp.config.compare.length,
          cmp.config.compare.order,
        },
      }
      -- Configura emoji come sorgente (aggiuntivo)
      -- cmp.setup({
      --   sources = {
      --     { name = "emoji" },
      --   },
      -- })
    end,
  },
}
