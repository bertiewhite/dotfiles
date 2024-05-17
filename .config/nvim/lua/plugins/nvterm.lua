return  {
  "NvChad/nvterm",
  config = function()
    require("nvterm").setup({
      terminals = {
        type_opts = {
          float = {
            relative = 'editor',
            row = 0.25,
            col = 0.15,
            width = 0.7,
            height = 0.5,
            border = 'single',
          }
        }
      },
      behavior = {
        autoclose_on_quit = {
          enabled = false,
          confirm = true,
        },
        close_on_exit = true,
          auto_insert = true,
      }
    })
  end
}
