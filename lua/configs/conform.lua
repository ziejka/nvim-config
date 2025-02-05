local options = {
  formatters_by_ft = {
    css = { "prettierd" },
    eruby = { "erb_format" },
    html = { "prettierd" },
    js = { "prettierd" },
    lua = { "stylua" },
    ruby = { "rubyfmt" },
    scss = { lsp_format = "first" },
    sql = { "sql_formatter" },
    templ = { "templ" },
    ts = { "prettierd" },
    vue = { "eslint_d", "stylelint_lsp", lsp_format = "first" },
  },

  -- format_on_save = {
  --   -- These options will be passed to conform.format()
  --   timeout_ms = 500,
  --   lsp_fallback = true,
  -- },
}

return options
