-- cmd([[colorscheme everforest]]) -- Put your favorite colorscheme here

-- Nord configuration in lua
vim.g.nord_contrast = true
vim.g.nord_borders = true
vim.g.nord_disable_background = true
vim.g.nord_italic = false
vim.g.nord_cursorline_transparent = true
-- Load the colorscheme
require('nord').set()
