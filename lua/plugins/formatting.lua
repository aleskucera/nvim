return {
  {
    "stevearc/conform.nvim",
    opts = {
      formatters_by_ft = {
        sh = { "shfmt" },
        lua = { "stylua" },
        css = { "prettierd" },
        html = { "prettierd" },
        javascript = { "biome", "prettierd" },
        python = { "black", "reorder-python-imports" },
      },
      formatters = {
        -- For Prettier (used by prettierd)
        prettierd = {
          prepend_args = { "--print-width", "100" }, -- change 100 to your desired width
        },
        -- For Black (Python)
        black = {
          prepend_args = { "--line-length", "100" },
        },
        -- For Stylua (Lua)
        stylua = {
          prepend_args = { "--column-width", "100" },
        },
      },
    },
  },
}
