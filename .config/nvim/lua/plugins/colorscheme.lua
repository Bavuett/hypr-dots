return {
  {
    "ankushbhagats/pastel.nvim",
    lazy = false,
    priority = 1000,
    opts = {
      palette = "pastelglow",
      style = {
        transparent = false,
      },
    },
    config = function(_, opts)
      require("pastel").setup(opts)
      vim.cmd.colorscheme("pastelglow")
    end,
  },
}
