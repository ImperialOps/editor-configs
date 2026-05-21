local mark = require("harpoon.mark")
local ui = require("harpoon.ui")

vim.keymap.set("n", "<leader>pa", mark.add_file)
vim.keymap.set("n", "<leader>ph", ui.toggle_quick_menu)

vim.keymap.set("n", "<leader>pq", function() ui.nav_file(1) end)
vim.keymap.set("n", "<leader>pw", function() ui.nav_file(2) end)
vim.keymap.set("n", "<leader>pe", function() ui.nav_file(3) end)
vim.keymap.set("n", "<leader>pr", function() ui.nav_file(4) end)
