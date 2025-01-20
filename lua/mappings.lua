require "nvchad.mappings"

-- add yours here

local map = vim.keymap.set

map("n", ";", ":", { desc = "CMD enter command mode" })
map("i", "jk", "<ESC>")
map("n", "<leader>X", function()
  require("nvchad.tabufline").closeAllBufs()
end, { desc = "Close all buffers" })

-- Persistance
map("n", "<leader>qs", function()
  require("persistence").load()
end, { desc = "load the session for the current directory" })

map("n", "<leader>qS", function()
  require("persistence").select()
end, { desc = "select a session to load" })

map("n", "<leader>ql", function()
  require("persistence").load { last = true }
end, { desc = "load the last session" })

map("n", "<leader>qd", function()
  require("persistence").stop()
end, { desc = "stop Persistence => session won't be saved on exit" })

-- New mappings for Telescope actions
map("n", "<leader>fa", function()
  require("telescope").extensions.live_grep_args.live_grep_args()
end, { desc = "stop Persistence => session won't be saved on exit" })

-- Copilot Chat
map("n", "<leader>a", function()
  require("CopilotChat").toggle()
end, { desc = "CopilotChat Toggle" })

map("v", "<leader>ce", ":CopilotChatExplain<CR>", { noremap = true, silent = true })
map("n", "<leader>cf", ":CopilotChatFixDiagnostic<CR>", { noremap = true, silent = true })
map("n", "<leader>cr", ":CopilotChatReview<CR>", { noremap = true, silent = true })
map("n", "<leader>cs", ":CopilotChatSave<CR>", { noremap = true, silent = true })
map("n", "<leader>cl", ":CopilotChatLoad<CR>", { noremap = true, silent = true })

-- Sorting
map("v", "<leader>s", ":sort<CR>", { noremap = true, silent = true })

map("v", "<leader>os", function()
  vim.cmd [[
    '<,'>s/\(},\)\@<!\n/LINEBRAKE/g
    '<,'>sort
    '<,'>s/LINEBRAKE/\r/g
  ]]
end, { noremap = true, silent = true, desc = "Sort lines inside object" })
