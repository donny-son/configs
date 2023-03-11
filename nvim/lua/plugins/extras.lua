return {
  {
    "kylechui/nvim-surround",
    event = "User AstroFile",
    config = function()
      require('nvim-surround').setup({})
    end
  },
  {
    "declancm/cinnamon.nvim",
    event = "User AstroFile",
    config = function()
      require('cinnamon').setup()
    end
  },
  {
    "iamcco/markdown-preview.nvim",
    build = "cd app && yarn install",
    event = "User AstroFile",
    config = require "plugins.configs.markdown"
  },
}
