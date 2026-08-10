return {
  "olimorris/codecompanion.nvim",
  dependencies = {
    "nvim-lua/plenary.nvim",
    "nvim-treesitter/nvim-treesitter",
  },
  config = function()
    require("codecompanion").setup({
      adapters = {
        deepseek = function()
          return require("codecompanion.adapters").extend("deepseek", {
            env = {
              api_key = "sk-97ebb86a2e084eeaad29edf1fdd865a7",
            },
          })
        end,
      },
      strategies = {
        chat = { adapter = "deepseek", },
        inline = { adapter = "deepseek" },
        agent = { adapter = "deepseek" },
      },
    })
  end
}
