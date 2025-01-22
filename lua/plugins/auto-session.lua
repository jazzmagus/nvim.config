return {
  "rmagatti/auto-session",
  config = function()
    require("auto-session").setup({
      log_level = "info",
      auto_session_enable_last_session = false,
      auto_restore_enabled = false,
    })
  end,
}
