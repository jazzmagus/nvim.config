return {
  {
    "williamboman/mason.nvim",
    opts = {}, -- Mantieni le tue opzioni esistenti se le hai
  },
  {
    "williamboman/mason-lspconfig.nvim",
    dependencies = {
      "neovim/nvim-lspconfig",
      "saghen/blink.cmp", -- Importante: mantieni la tua dipendenza esistente
    },
    opts = {
      automatic_installation = true,
      ensure_installed = { "lua_ls" }, -- Aggiungi altri LSP qui se necessario
    },
  },
  {
    "neovim/nvim-lspconfig",
    dependencies = {
      "folke/lazydev.nvim",
      "nvim-lua/plenary.nvim",
    },
    config = function()
      local capabilities = require("blink.cmp").get_lsp_capabilities()

      -- Configurazione specifica per lua_ls (mantieni la tua versione personalizzata)
      require("lspconfig").lua_ls.setup({
        capabilities = capabilities,
        settings = {
          Lua = {
            runtime = { version = "LuaJIT" },
            diagnostics = { globals = { "vim" } },
            workspace = {
              library = vim.api.nvim_get_runtime_file("", true),
              checkThirdParty = false,
            },
            telemetry = { enable = false },
          },
        },
        on_attach = function(client, bufnr)
          -- Le tue mappature esistenti qui
          vim.api.nvim_create_autocmd("BufWritePre", {
            buffer = bufnr,
            callback = function()
              vim.lsp.buf.format({ async = false })
            end,
          })
        end,
      })

      -- Configurazione generica per altri LSP
      require("mason-lspconfig").setup_handlers({
        function(server_name)
          require("lspconfig")[server_name].setup({
            capabilities = capabilities,
            on_attach = function(client, bufnr)
              -- Mappature generiche per tutti gli LSP
              vim.keymap.set("n", "gd", vim.lsp.buf.definition, { buffer = bufnr })
              vim.keymap.set("n", "K", vim.lsp.buf.hover, { buffer = bufnr })
            end,
          })
        end,
      })
    end,
  },
}
