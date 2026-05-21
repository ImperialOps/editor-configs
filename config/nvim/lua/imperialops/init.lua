-- lua/imperialops/init.lua
require("imperialops.set")
require("imperialops.remap")
require("imperialops.lazy") -- Bootstraps and registers plugins

-- Initialize your custom plugin configurations safely
require("imperialops.plugins.colours")
require("imperialops.plugins.harpoon")
require("imperialops.plugins.lsp")
require("imperialops.plugins.telescope")
require("imperialops.plugins.treesitter")
require("imperialops.plugins.toggleterm")
require("imperialops.plugins.trouble")
require("imperialops.plugins.undotree")
require("imperialops.plugins.zenmode")
