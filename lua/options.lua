require "nvchad.options"

vim.opt.relativenumber = true
vim.opt.scrolloff = 20

vim.api.nvim_create_autocmd("TextYankPost", {
  callback = function()
    vim.highlight.on_yank { higroup = "IncSearch", timeout = 200 }
  end,
})

-- Start nvim-tree when vim starts
vim.api.nvim_create_autocmd("VimEnter", {
  callback = function()
    vim.defer_fn(function()
      require("persistence").load()
    end, 100) -- delay in milliseconds
  end,
  desc = "Load session on VimEnter with delay",
})

vim.api.nvim_create_autocmd("BufWritePre", {
  pattern = "*.go",
  callback = function()
    local params = vim.lsp.util.make_range_params()
    params.context = {only = {"source.organizeImports"}}
    -- buf_request_sync defaults to a 1000ms timeout. Depending on your
    -- machine and codebase, you may want longer. Add an additional
    -- argument after params if you find that you have to write the file
    -- twice for changes to be saved.
    -- E.g., vim.lsp.buf_request_sync(0, "textDocument/codeAction", params, 3000)
    local result = vim.lsp.buf_request_sync(0, "textDocument/codeAction", params)
    for cid, res in pairs(result or {}) do
      for _, r in pairs(res.result or {}) do
        if r.edit then
          local enc = (vim.lsp.get_client_by_id(cid) or {}).offset_encoding or "utf-16"
          vim.lsp.util.apply_workspace_edit(r.edit, enc)
        end
      end
    end
    vim.lsp.buf.format({async = false})
  end
})
--
-- vim.api.nvim_create_autocmd("User", {
  -- pattern = "PersistenceLoadPost",
  -- callback = function()
  --   require("nvim-tree.api").tree.open()
  -- end
-- })

-- Start nvim-tree when vim starts
-- vim.api.nvim_create_autocmd("VimEnter", {
--   callback = function()
--     -- require("persistence").load()
--     require("nvim-tree.api").tree.open()
--   end,
-- })

-- Optionally, you can also open nvim-tree if no session is restored
-- vim.api.nvim_create_autocmd("VimEnter", {
--   callback = function()
--     if not vim.g.persisting then
--       require("nvim-tree.api").tree.open()
--     end
--   end
-- })
