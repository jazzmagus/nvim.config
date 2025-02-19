return {
  "lukas-reineke/headlines.nvim",
  config = function()
    require("headlines").setup({
      markdown = {
        query = vim.treesitter.query.parse(
          "markdown",
          [[
            (atx_heading [
                (atx_h1_marker)
                (atx_h2_marker)
                (atx_h3_marker)
                (atx_h4_marker)
                (atx_h5_marker)
                (atx_h6_marker)
            ] @headline)

            (thematic_break) @dash

            (fenced_code_block) @codeblock

            (block_quote_marker) @quote
            (block_quote (paragraph (inline (block_continuation) @quote)))
            (block_quote (paragraph (block_continuation) @quote))
            (block_quote (block_continuation) @quote)
          ]]
        ),
        headline_highlights = { "Headline1", "Headline2", "Headline3", "Headline4", "Headline5", "Headline6" },
        bullet_highlights = {
          "@text.title.1.marker.markdown",
          "@text.title.2.marker.markdown",
          "@text.title.3.marker.markdown",
          "@text.title.4.marker.markdown",
          "@text.title.5.marker.markdown",
          "@text.title.6.marker.markdown",
        },
        bullets = { "①", "②", "③", "④", "⑤", "⑥" },
        codeblock_highlight = "CodeBlock",
        dash_highlight = "Dash",
        dash_string = "-",
        quote_highlight = "Quote",
        quote_string = "┃",
        fat_headlines = false,
        fat_headline_upper_string = "▄",
        fat_headline_lower_string = "▀",
      },
      -- rmd = {
      --   query = vim.treesitter.query.parse(
      --     "markdown",
      --     [[
      --       (atx_heading [
      --           (atx_h1_marker)
      --           (atx_h2_marker)
      --           (atx_h3_marker)
      --           (atx_h4_marker)
      --           (atx_h5_marker)
      --           (atx_h6_marker)
      --       ] @headline)
      --
      --       (thematic_break) @dash
      --
      --       (fenced_code_block) @codeblock
      --
      --       (block_quote_marker) @quote
      --       (block_quote (paragraph (inline (block_continuation) @quote)))
      --       (block_quote (paragraph (block_continuation) @quote))
      --       (block_quote (block_continuation) @quote)
      --     ]]
      --   ),
      --   treesitter_language = "markdown",
      --   headline_highlights = { "Headline1", "Headline2", "Headline3", "Headline4", "Headline5", "Headline6" },
      --   bullet_highlights = {
      --     "@text.title.1.marker.markdown",
      --     "@text.title.2.marker.markdown",
      --     "@text.title.3.marker.markdown",
      --     "@text.title.4.marker.markdown",
      --     "@text.title.5.marker.markdown",
      --     "@text.title.6.marker.markdown",
      --   },
      --   bullets = { "◉", "◉", "◉", "◉", "◉", "◉" },
      --   codeblock_highlight = "CodeBlock",
      --   dash_highlight = "Dash",
      --   dash_string = "-",
      --   quote_highlight = "Quote",
      --   quote_string = "┃",
      --   fat_headlines = false,
      --   fat_headline_upper_string = "▄",
      --   fat_headline_lower_string = "▀",
      -- },
      -- org = {
      --   query = vim.treesitter.query.parse(
      --     "org",
      --     [[
      --       (headline (stars) @headline)
      --
      --       (
      --           (expr) @dash
      --           (#match? @dash "^-----+$")
      --       )
      --
      --       (block
      --           name: (expr) @_name
      --           (#match? @_name "(SRC|src)")
      --       ) @codeblock
      --
      --       (paragraph . (expr) @quote
      --           (#eq? @quote ">")
      --       )
      --     ]]
      --   ),
      --   headline_highlights = { "Headline1", "Headline2", "Headline3", "Headline4", "Headline5", "Headline6" },
      --   bullet_highlights = {
      --     "@org.headline.level1",
      --     "@org.headline.level2",
      --     "@org.headline.level3",
      --     "@org.headline.level4",
      --     "@org.headline.level5",
      --     "@org.headline.level6",
      --     "@org.headline.level7",
      --     "@org.headline.level8",
      --   },
      --   bullets = { "◉", "○", "✸", "✿" },
      --   codeblock_highlight = "CodeBlock",
      --   dash_highlight = "Dash",
      --   dash_string = "-",
      --   quote_highlight = "Quote",
      --   quote_string = "┃",
      --   fat_headlines = true,
      --   fat_headline_upper_string = "▄",
      --   fat_headline_lower_string = "▀",
      -- },
    })

    -- Configurazione dei colori per gli heading
    vim.api.nvim_set_hl(0, "Headline1", { fg = "#e06c75", bold = true })
    vim.api.nvim_set_hl(0, "Headline2", { fg = "#e5c07b", bold = true })
    vim.api.nvim_set_hl(0, "Headline3", { fg = "#98c379", bold = true })
    vim.api.nvim_set_hl(0, "Headline4", { fg = "#56b6c2", bold = true })
    vim.api.nvim_set_hl(0, "Headline5", { fg = "#61afef", bold = true })
    vim.api.nvim_set_hl(0, "Headline6", { fg = "#c678dd", bold = true })
  end,
}
