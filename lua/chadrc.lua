-- This file needs to have same structure as nvconfig.lua
-- https://github.com/NvChad/ui/blob/v2.5/lua/nvconfig.lua
-- Please read that file to know all available options :(

---@type ChadrcConfig
local M = {}

M.base46 = {
  theme = "sweetpastel",

  -- hl_override = {
  -- 	Comment = { italic = true },
  -- 	["@comment"] = { italic = true },
  -- },
}

M.mason = {
  command = true,
  pkgs = {
    "gopls",
    "templ",
    "tailwindcss-language-server",

    "typescript-language-server",
    "vue-language-server",
    "stylelint-lsp",
    "prettierd",
    "eslint-lsp",

    "ruby-lsp",
  },
}

M.ui = {
  telescope = { style = "bordered" }, -- borderless / bordered
  tabufline = {
    order = { "buffers", "tabs", "btns", "treeOffset" },
  },
}

return M
