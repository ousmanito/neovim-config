return {
  "nvim-tree/nvim-tree.lua",
  version = "*",
  lazy = false,
  dependencies = {
    "nvim-tree/nvim-web-devicons",
  },

  keys = {
    { "<leader>f", ":NvimTreeToggle<CR>", desc = "See [F]iles" },
    {"<leader>ft", ":NvimTreeFocus<CR>", desc = "[T]oggle [F]ile Explorer "}
  },

  config = function()
    require("nvim-tree").setup({})
  end,
}
