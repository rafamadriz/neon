local colors = require("neon.colors")

local neon = {
    visual = {
        a = {fg = colors.bg0, bg = colors.blue, gui = "bold"},
        b = {fg = colors.cyan, bg = colors.bg3}
    },
    replace = {
        a = {fg = colors.bg0, bg = colors.disabled, gui = "bold"},
        b = {fg = colors.purple, bg = colors.bg3}
    },
    inactive = {
        a = {fg = colors.fg, bg = colors.bg3, gui = "bold"},
        b = {fg = colors.fg, bg = colors.bg3},
        c = {fg = colors.fg, bg = colors.bg3}
    },
    normal = {
        a = {fg = colors.bg0, bg = colors.dark_cyan, gui = "bold"},
        b = {fg = colors.blue, bg = colors.bg3},
        c = {fg = colors.fg, bg = colors.bg3}
    },
    insert = {
        a = {fg = colors.bg0, bg = colors.purple, gui = "bold"},
        b = {fg = colors.green, bg = colors.bg3}
    },
    command = {
        a = {fg = colors.bg0, bg = colors.red, gui = "bold"},
        b = {fg = colors.green, bg = colors.bg3}
    }
}

return neon
