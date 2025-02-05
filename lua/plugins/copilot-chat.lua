return {
  {
    "CopilotC-Nvim/CopilotChat.nvim",
    lazy = false,

    branch = "main",
    dependencies = {
      { "zbirenbaum/copilot.lua" }, -- or github/copilot.vim
      { "nvim-lua/plenary.nvim" }, -- for curl, log wrapper
    },
    build = "make tiktoken", -- Only on MacOS or Linux
    opts = {
      model = 'gpt-4',
      enable = false,
      -- See Configuration section for rest
    },
    -- See Commands section for default commands if you want to lazy load on them
  },
}
