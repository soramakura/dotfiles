return {
  "echasnovski/mini.icons",
  dependencies = { "nvim-tree/nvim-web-devicons" },
  opts = {
    file = {
      [".keep"] = { glyph = "󰊢", hl = "MiniIconsGrey" },
      ["devcontainer.json"] = { glyph = "", hl = "MiniIconsAzure" },
    },
    filetype = {
      dotenv = { glyph = "", hl = "MiniIocnsYellow" },
    },
  },
  config = function(_, opts)
    require("mini.icons").setup(opts)
  end,
  init = function ()
    package.preload["nvim-web-devicons"] = function ()
      require("mini.icons").mock_nvim_web_devicons()
      return package.loaded["nvim-web-devicons"]
    end
  end,
}
