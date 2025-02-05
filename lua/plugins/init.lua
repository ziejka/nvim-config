return {
  {
    "stevearc/conform.nvim",
    -- event = "BufWritePre", -- uncomment for format on save
    opts = require "configs.conform",
  },

  {
    "neovim/nvim-lspconfig",
    config = function()
      require "configs.lspconfig"
    end,
  },

  {
    "kevinhwang91/nvim-bqf",
    lazy = false,
  },

  {
    "github/copilot.vim",
    lazy = false,
  },

  {
    "kamykn/spelunker.vim",
    lazy = false,
  },
}
