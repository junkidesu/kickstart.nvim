return {
  "metalelf0/black-metal-theme-neovim",
  lazy = false,
  priority = 1000,
  config = function()
    require("black-metal").setup({
      -- optional configuration here
      theme = "impaled-nazarene"
    })
    require("black-metal").load()
  end,
}
