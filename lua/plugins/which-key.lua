return {
  {
    "folke/which-key.nvim",
    event = "VeryLazy",
    config = function()
      local wk = require("which-key")
      local mappings = {
        -- t = {
        --   name = "ChatGPT", -- Nome del gruppo
        --   c = { "<cmd>ChatGPT<CR>", "ChatGPT" },
        --   e = { "<cmd>ChatGPTEditWithInstruction<CR>", "Edit with instruction", mode = { "n", "v" } },
        --   g = { "<cmd>ChatGPTRun grammar_correction<CR>", "Grammar Correction", mode = { "n", "v" } },
        --   t = { "<cmd>ChatGPTRun translate<CR>", "Translate", mode = { "n", "v" } },
        --   k = { "<cmd>ChatGPTRun keywords<CR>", "Keywords", mode = { "n", "v" } },
        --   d = { "<cmd>ChatGPTRun docstring<CR>", "Docstring", mode = { "n", "v" } },
        --   a = { "<cmd>ChatGPTRun add_tests<CR>", "Add Tests", mode = { "n", "v" } },
        --   o = { "<cmd>ChatGPTRun optimize_code<CR>", "Optimize Code", mode = { "n", "v" } },
        --   s = { "<cmd>ChatGPTRun summarize<CR>", "Summarize", mode = { "n", "v" } },
        --   f = { "<cmd>ChatGPTRun fix_bugs<CR>", "Fix Bugs", mode = { "n", "v" } },
        --   x = { "<cmd>ChatGPTRun explain_code<CR>", "Explain Code", mode = { "n", "v" } },
        --   r = { "<cmd>ChatGPTRun roxygen_edit<CR>", "Roxygen Edit", mode = { "n", "v" } },
        --   l = { "<cmd>ChatGPTRun code_readability_analysis<CR>", "Code Readability Analysis", mode = { "n", "v" } },
        -- },
        -- Gruppo per Alpha
        -- q = {
        --   name = "Schermata Iniziale", -- Nome del gruppo
        --   a = { ":Alpha<CR>", "Torna alla schermata iniziale" }, -- Mappatura per Alpha
        -- },
      }

      -- Configura which-key con le impostazioni di base
      wk.setup({
        -- Puoi aggiungere qui eventuali opzioni personalizzate
        -- q = {
        --   name = "Schermata Iniziale", -- Nome del gruppo
        --   e = { ":Alpha<CR>", "Torna alla schermata iniziale" }, -- Mappatura per Alpha
        -- },
      })

      -- Aggiungi i keymaps di Obsidian
      wk.add({
        { "<leader>o", group = " Obsidian", icon = " " }, -- Gruppo per Obsidian
        { "<leader>on", "<cmd>ObsidianNew<cr>", desc = "New Note", mode = "n" },
        { "<leader>od", "<cmd>ObsidianToday<cr>", desc = "Today Daily Note", mode = "n" },
        {
          "<leader>ot",
          function()
            ObsidianTemplateMenu()
          end,
          desc = "New Note From Template",
          mode = "n",
        },
      })
    end,
  },
}
