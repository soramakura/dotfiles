local set_neocodeium_keymaps = function(neocodeium)
  local set_keymap = vim.keymap.set
  local keymap_opts = function(desc)
    return { desc = desc, noremap = true, silent = true }
  end

  set_keymap("i", "<M-n>", function() neocodeium.cycle_or_complete(1) end,
    keymap_opts("Next the Codeium suggestion"))
  set_keymap("i", "<M-p>", function() neocodeium.cycle_or_complete(-1) end,
    keymap_opts("Previous the Codeium suggestion"))
  set_keymap("i", "<M-l>", neocodeium.accept, keymap_opts("Accept the Codeium suggestion"))
  set_keymap("i", "<M-S-l>", neocodeium.accept_line, keymap_opts("Accept the Codeium suggestion"))
  set_keymap("i", "<M-e>", neocodeium.clear, keymap_opts("Clear the current Codeium suggestion"))
  set_keymap("i", "<M-v>", neocodeium.visible, keymap_opts("Show/Hide the Codeium suggestion"))

  vim.api.nvim_create_autocmd("User", {
    pattern = "NeoCodeiumCompletionDisplayed",
    callback = function() require("cmp").abort() end
  })
end
return {
  "monkoose/neocodeium",
  dependencies = {
    "hrsh7th/nvim-cmp",
  },
  event = { "BufReadPre", "BufNewFile" },
  config = function()
    local neocodeium = require("neocodeium")
    neocodeium.setup({
      manual = true,
    })
    set_neocodeium_keymaps(neocodeium)
  end,
}
