-- ╭──────────────────────────────────────────────────────────╮
-- │ Lazy.nvim Bootstrap                                      │
-- ╰──────────────────────────────────────────────────────────╯
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"

if not (vim.uv or vim.loop).fs_stat(lazypath) then
  local lazyrepo = "https://github.com/folke/lazy.nvim.git"
  local out = vim.fn.system({ "git", "clone", "--filter=blob:none", "--branch=stable", lazyrepo, lazypath })

  if vim.v.shell_error ~= 0 then
    vim.api.nvim_echo({
      { "Failed to clone lazy.nvim:\n", "ErrorMsg" },
      { out,                            "WarningMsg" },
      { "\nPress any key to exit..." },
    }, true, {})
    vim.fn.getchar()
    os.exit(1)
  end
end

vim.opt.rtp:prepend(lazypath)

-- ╭──────────────────────────────────────────────────────────╮
-- │ Configuration Files                                      │
-- ╰──────────────────────────────────────────────────────────╯
require("config.keymaps")
require("config.autocmds")

-- ╭──────────────────────────────────────────────────────────╮
-- │ Plugin Setup                                            │
-- ╰──────────────────────────────────────────────────────────╯
require("lazy").setup({
  spec = {
    -- LazyVim and core plugins
    { "LazyVim/LazyVim",                                    import = "lazyvim.plugins" },

    -- Custom plugin imports
    { import = "plugins" },
    { import = "plugins.colorscheme" },

    -- LazyVim extras
    { import = "lazyvim.plugins.extras.lang.yaml" },
    { import = "lazyvim.plugins.extras.formatting.prettier" },
    { import = "lazyvim.plugins.extras.editor.harpoon2" },
    { import = "lazyvim.plugins.extras.lang.go" },
    { import = "lazyvim.plugins.extras.lang.json" },
    { import = "lazyvim.plugins.extras.lang.markdown" },
    { import = "lazyvim.plugins.extras.lang.python" },
    { import = "lazyvim.plugins.extras.coding.luasnip" },
  },

  -- ╭──────────────────────────────────────────────────────────╮
  -- │ Defaults                                               │
  -- ╰──────────────────────────────────────────────────────────╯
  defaults = {
    lazy = false,    -- Load custom plugins at startup
    version = false, -- Always use the latest commit for plugins
  },

  -- ╭──────────────────────────────────────────────────────────╮
  -- │ Plugin Installation                                    │
  -- ╰──────────────────────────────────────────────────────────╯
  install = { colorscheme = { "vague" } },

  -- ╭──────────────────────────────────────────────────────────╮
  -- │ Plugin Update Checker                                  │
  -- ╰──────────────────────────────────────────────────────────╯
  checker = {
    enabled = true, -- Periodically check for updates
    notify = true,  -- Show notifications on update
  },

  -- ╭──────────────────────────────────────────────────────────╮
  -- │ Performance Optimizations                              │
  -- ╰──────────────────────────────────────────────────────────╯
  performance = {
    rtp = {
      disabled_plugins = {
        "gzip",
        -- "matchit",
        -- "matchparen",
        -- "netrwPlugin",
        "tarPlugin",
        "tohtml",
        "tutor",
        "zipPlugin",
      },
    },
  },
})
