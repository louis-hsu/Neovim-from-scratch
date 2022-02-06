-- cmd([[colorscheme everforest]]) -- Put your favorite colorscheme here

-- Nightfox config
local nightfox = require("nightfox")
nightfox.setup({
  fox = "nordfox",
  transparent = true,
  alt_nc = true,
  styles = {
    comments = "italic",
    keywords = "bold",
    functions = "italic,bold",
  },
  inverse = {
    visual = true,
    search = true,
    match_paren = true,
  },
  colors = {
--    comment = "#878787",
--    magenta = "#81a1c1",
  },
  hlgroups = {
    CursorLineNr = { fg = "#ffd787", style = "bold" },
    CursorLine = { bg = "NONE" },
    CursorColumn = { bg = "#1c1c1c" },
--    Cursor = { fg = "NONE", bg = "NONE" },
--    Normal = { fg = "#d8dde8" },
--    Statement = { fg = "#81a1c1" },
--    Conditional = { fg = "#81a1c1" },
--    Repeat = { fg = "#81a1c1" },
--    Label = { fg = "#81a1c1" },
--    Keyword = { style = "NONE" },
    Comment = { fg = "#878787" },
    Todo = { fg = "#ebcb8b", bg = "NONE", style = "bold" },
  }
})
nightfox.load()
