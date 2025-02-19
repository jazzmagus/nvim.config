return {
  "nvim-lualine/lualine.nvim",
  dependencies = { "nvim-tree/nvim-web-devicons" },
  config = function()
    -- Aggiungiamo un autocmd per gestire Goyo
    vim.api.nvim_create_autocmd("User", {
      pattern = "GoyoEnter",
      callback = function()
        require("lualine").hide()
      end,
    })

    vim.api.nvim_create_autocmd("User", {
      pattern = "GoyoLeave",
      callback = function()
        require("lualine").hide({ unhide = true })
      end,
    })

    require("lualine").setup({
      options = {
        theme = "everforest",
        icons_enabled = true,
        component_separators = { left = "", right = "" },
        section_separators = { left = "", right = "" },
      },
    })
  end,
}
