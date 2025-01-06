local harpoon = require "harpoon"
local map = vim.keymap.set
harpoon:setup {
  menu = {
    width = vim.api.nvim_win_get_width(0) - 12,
  },
}

map("n", "<leader>a", function()
  harpoon:list():add()
end)
map("n", "<C-e>", function()
  harpoon.ui:toggle_quick_menu(harpoon:list())
end)

map("n", "<C-p>", function()
  harpoon:list():select(1)
end)
map("n", "<C-s>", function()
  harpoon:list():select(2)
end)

map("n", "<C-t>", function()
  harpoon:list():select(3)
end)

map({ "n" }, "<leader>p", function()
  harpoon:list():prev()
end)

map({ "n" }, "<leader>n", function()
  harpoon:list():next()
end)
