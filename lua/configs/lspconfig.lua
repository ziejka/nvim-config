-- load defaults i.e lua_lsp
require("nvchad.configs.lspconfig").defaults()

local util = require "lspconfig.util"
local lspconfig = require "lspconfig"

-- EXAMPLE
local servers = { "html", "cssls", "gopls", "templ", "ruby_lsp", "somesass_ls", "tailwindcss" }
local nvlsp = require "nvchad.configs.lspconfig"

-- lsps with default config
for _, lsp in ipairs(servers) do
  lspconfig[lsp].setup {
    on_attach = nvlsp.on_attach,
    on_init = nvlsp.on_init,
    capabilities = nvlsp.capabilities,
  }
end

-- configuring single server, example: typescript
lspconfig.ts_ls.setup {
  on_attach = nvlsp.on_attach,
  on_init = nvlsp.on_init,
  capabilities = nvlsp.capabilities,
  preferences = {
    experimentalDecorators = true,
  },
  init_options = {
    preferences = {
      experimentalDecorators = true,
    },
    plugins = {
      {
        name = "@vue/typescript-plugin",
        location = "/Users/mattu/.nvm/versions/node/v20.9.0/lib/node_modules/@vue/typescript-plugin",
        languages = { "javascript", "typescript", "vue" },
      },
    },
  },
  root_dir = util.root_pattern("frontend/tsconfig.json", "tsconfig.json", "jsconfig.json", "package.json", ".git"),
  filetypes = {
    "javascript",
    "typescript",
    "vue",
  },
}

lspconfig.eslint.setup {
  on_attach = nvlsp.on_attach,
  on_init = nvlsp.on_init,
  capabilities = nvlsp.capabilities,
  settings = {
    autoFixOnSave = true,

    eslint = {
      autoFixOnSave = true,
    },
  },
}

lspconfig.stylelint_lsp.setup {
  on_attach = nvlsp.on_attach,
  on_init = nvlsp.on_init,
  capabilities = nvlsp.capabilities,
  filetypes = { "css", "scss", "less", "vue" },
  settings = {
    stylelintplus = {
      autoFixOnFormat = true,
      -- autoFixOnSave = true,
    },
  },
}

lspconfig.volar.setup {
  on_attach = nvlsp.on_attach,
  on_init = nvlsp.on_init,
  capabilities = nvlsp.capabilities,
  filetypes = { "vue" },
  init_options = {
    typescript = {
      tsdk = "/Users/mattu/.nvm/versions/node/v20.9.0/lib/node_modules/typescript/lib",
    },
  },
  on_new_config = function(new_config, new_root_dir)
    local lib_path = vim.fs.find("node_modules/typescript/lib", { path = new_root_dir, upward = true })[1]
    local lib_path_frontend =
      vim.fs.find("frontend/node_modules/typescript/lib", { path = new_root_dir, upward = true })[1]
    if lib_path then
      new_config.init_options.typescript.tsdk = lib_path
    elseif lib_path_frontend then
      new_config.init_options.typescript.tsdk = lib_path_frontend
    end
  end,
}
