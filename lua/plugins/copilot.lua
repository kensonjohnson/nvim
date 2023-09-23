return {
  {
    "zbirenbaum/copilot.lua",
    cmd = "Copilot",
    build = ":Copilot auth",
    event = "InsertEnter",
    config = function()
      require("copilot").setup({
        panel = {
          enabled = true,
          auto_refresh = true,
        },
        suggestion = {
          enabled = true,
          auto_trigger = true,
          accept = false, -- disable built-in keymapping
          -- The Meta key only works in macos terminal.app if you set
          -- "Use Option as Meta key" in your profile settings.
          keymap = {
            accept = "<M-p>",
            accept_word = "<M-n>",
            accept_line = "<M-l>",
            next = "<M-]>",
            prev = "<M-[>",
            dismiss = "<C-]>", -- dismiss current suggestion
          },
        },
      })

      -- -- hide copilot suggestions when cmp menu is open
      -- -- to prevent odd behavior/garbled up suggestions
      -- local cmp_status_ok, cmp = pcall(require, "cmp")
      -- if cmp_status_ok then
      --   cmp.event:on("menu_opened", function()
      --     vim.b.copilot_suggestion_hidden = true
      --   end)
      --
      --   cmp.event:on("menu_closed", function()
      --     vim.b.copilot_suggestion_hidden = false
      --   end)
      -- end
    end,
  },
}
