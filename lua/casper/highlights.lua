local M = {}
local hl = vim.api.nvim_set_hl

function M.apply(colors)
    hl(0, "Normal",   { fg = colors.foreground , bg = colors.background })
    hl(0, "Comment",  { fg = colors.palette[7], italic = true })
    hl(0, "String",   { fg = colors.palette[10]})
    hl(0, "Keyword",  { fg = colors.palette[5] })
    hl(0, "Operator",  { fg = colors.palette[5] })
    hl(0, "Function", { fg = colors.palette[2] })
    hl(0, "Type",     { fg = colors.palette[12] })
    hl(0, "Number",   { fg = colors.palette[4] })
    hl(0, "ErrorMsg",    { fg = colors.palette[1]})
    hl(0, "WarningMsg", { fg = colors.palette[11]})
    hl(0, "Visual",   { bg = colors["selection-background"], fg = colors["selection-foreground"]})
    hl(0, "@constant.builtin", { fg = colors.foreground })
    hl(0, "@type.builtin", { fg = colors.palette[12]})
    hl(0, "@function.builtin", { fg = colors.foreground })
    hl(0, "@variable",       { fg = colors.foreground })
    hl(0, "@string.escape",       { fg = colors.palette[12]})

    hl(0, "@function.call",  { fg = colors.foreground })
    hl(0, "DiagnosticUnderlineError", { undercurl = true, sp = colors.palette[1] })
    hl(0, "DiagnosticUnderlineWarn",  { undercurl = true, sp = colors.palette[11]})
    hl(0, "@constructor", { link = "Normal" })
    hl(0, "Identifier", { link = "Normal" })


end
return M
