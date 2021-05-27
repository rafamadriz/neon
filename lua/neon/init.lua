local c = require("neon.colors")
local utils = require("neon.utils")
local cfg = require("neon.config").styles
local neon = {}

local function set_terminal_colors()
    vim.g.terminal_color_0 = c.bg2
    vim.g.terminal_color_1 = c.cyan
    vim.g.terminal_color_2 = c.green
    vim.g.terminal_color_3 = c.blue
    vim.g.terminal_color_4 = c.yellow
    vim.g.terminal_color_5 = c.purple
    vim.g.terminal_color_6 = c.blue
    vim.g.terminal_color_7 = c.blue
    vim.g.terminal_color_8 = c.yellow
    vim.g.terminal_color_9 = c.red
    vim.g.terminal_color_10 = c.green
    vim.g.terminal_color_11 = c.cyan
    vim.g.terminal_color_12 = c.dark_cyan
    vim.g.terminal_color_13 = c.purple
    vim.g.terminal_color_14 = c.green
    vim.g.terminal_color_15 = c.blue
    vim.g.terminal_color_background = c.bg0
    vim.g.terminal_color_foreground = c.fg
end

local function set_groups()
    local groups = {
        -- Base
        -- Editor highlight groups
        Normal = {fg = c.fg, bg = c.bg0}, -- normal text and background color
        SignColumn = {fg = c.fg, bg = c.bg0},
        EndOfBuffer = {fg = c.disabled}, -- ~ lines at the end of a buffer
        NormalFloat = {fg = c.fg, bg = c.bg2}, -- normal text and background color for floating windows
        ColorColumn = {fg = c.none, bg = c.bg3}, --  used for the columns set with 'colorcolumn'
        Conceal = {fg = c.gray}, -- placeholder characters substituted for concealed text (see 'conceallevel')
        Cursor = {fg = c.cyan, bg = c.none, style = "reverse"}, -- the character under the cursor
        CursorIM = {fg = c.cyan, bg = c.none, style = "reverse"}, -- like Cursor, but used when in IME mode
        Directory = {fg = c.blue, bg = c.none, style = cfg.bold}, -- directory names (and other special names in listings)
        DiffAdd = {fg = c.diff_green, bg = c.none, style = "reverse"}, -- diff mode: Added line
        DiffChange = {fg = c.diff_blue, bg = c.none, style = "reverse"}, --  diff mode: Changed line
        DiffDelete = {fg = c.diff_red, bg = c.none, style = "reverse"}, -- diff mode: Deleted line
        DiffText = {fg = c.fg, bg = c.none, style = "reverse"}, -- diff mode: Changed text within a changed line
        ErrorMsg = {fg = c.red}, -- error messages
        Folded = {fg = c.gray, c.none, style = "italic"},
        FoldColumn = {fg = c.blue},
        IncSearch = {style = "reverse"},
        LineNr = {fg = c.disabled},
        CursorLineNr = {fg = c.cyan},
        MatchParen = {fg = c.red, style = "underline,bold"},
        ModeMsg = {fg = c.cyan, style = cfg.bold},
        MoreMsg = {fg = c.cyan, style = cfg.bold},
        NonText = {fg = c.bg3},
        Pmenu = {fg = c.fg, bg = c.bg4},
        PmenuSel = {fg = c.bg0, bg = c.blue, style = "bold"},
        PmenuSbar = {fg = c.fg, bg = c.bg2},
        PmenuThumb = {fg = c.fg, bg = c.gray},
        Question = {fg = c.green, style = cfg.bold},
        QuickFixLine = {fg = c.blue, bg = c.bg1, style = "bold,italic"},
        qfLineNr = {fg = c.blue, bg = c.bg1},
        Search = {style = "reverse"},
        SpecialKey = {fg = c.bg3},
        SpellBad = {fg = c.red, bg = c.none, style = "italic,undercurl"},
        SpellCap = {fg = c.blue, bg = c.none, style = "italic,undercurl"},
        SpellLocal = {fg = c.cyan, bg = c.none, style = "italic,undercurl"},
        SpellRare = {fg = c.cyan, bg = c.none, style = "italic,undercurl"},
        StatusLine = {fg = c.blue, bg = c.bg0},
        StatusLineNC = {fg = c.gray},
        StatusLineTerm = {fg = c.fg, bg = c.bg3},
        StatusLineTermNC = {fg = c.fg, bg = c.bg3},
        TabLineFill = {fg = c.fg},
        TablineSel = {fg = c.bg0, bg = c.blue},
        Tabline = {fg = c.gray},
        Title = {fg = c.cyan, bg = c.none, style = cfg.bold},
        Visual = {fg = c.none, style = "reverse"},
        VisualNOS = {fg = c.none, style = "reverse"},
        WarningMsg = {fg = c.orange, style = cfg.bold},
        WildMenu = {fg = c.bg0, bg = c.blue, style = "bold"},
        CursorColumn = {fg = c.none, bg = c.fg},
        CursorLine = {fg = c.none, bg = c.bg1},
        ToolbarLine = {fg = c.fg, bg = c.bg1},
        ToolbarButton = {fg = c.fg, bg = c.none, style = "bold"},
        NormalMode = {fg = c.cyan, bg = c.none, style = "reverse"},
        InsertMode = {fg = c.green, bg = c.none, style = "reverse"},
        ReplacelMode = {fg = c.red, bg = c.none, style = "reverse"},
        VisualMode = {fg = c.cyan, bg = c.none, style = "reverse"},
        VertSplit = {fg = c.gray_alt},
        CommandMode = {fg = c.gray, bg = c.none, style = "reverse"},
        Warnings = {fg = c.orange},
        healthError = {fg = c.red},
        healthSuccess = {fg = c.green},
        healthWarning = {fg = c.orange},
        --common
        Type = {fg = c.cyan}, -- int, long, char, etc.
        StorageClass = {fg = c.cyan}, -- static, register, volatile, etc.
        Structure = {fg = c.orange}, -- struct, union, enum, etc.
        Constant = {fg = c.violet}, -- any constant
        Comment = {fg = c.disabled, bg = c.none, style = cfg.italic_comment},
        Conditional = {fg = c.blue, bg = c.none, style = cfg.italic_keyword}, -- italic if, then, else, endif, switch, etc.
        Keyword = {fg = c.blue, bg = c.none, style = cfg.italic_keyword}, -- italic for, do, while, etc.
        Repeat = {fg = c.orange, bg = c.none, style = cfg.italic_keyword}, -- italic any other keyword
        Boolean = {fg = c.blue_alt, bg = c.none, style = cfg.italic_boolean}, -- true , false
        Function = {fg = c.blue, bg = c.none, style = cfg.italic_function .. cfg.bold},
        Identifier = {fg = c.blue, bg = c.none, style = cfg.italic_variable}, -- any variable name
        String = {fg = c.green, bg = c.none}, -- Any string
        Character = {fg = c.orange}, -- any character constant: 'c', '\n'
        Number = {fg = c.red}, -- a number constant: 5
        Float = {fg = c.red}, -- a floating point constant: 2.3e10
        Statement = {fg = c.blue}, -- any statement
        Label = {fg = c.cyan}, -- case, default, etc.
        Operator = {fg = c.blue}, -- sizeof", "+", "*", etc.
        Exception = {fg = c.blue}, -- try, catch, throw
        PreProc = {fg = c.orange}, -- generic Preprocessor
        Include = {fg = c.blue}, -- preprocessor #include
        Define = {fg = c.cyan}, -- preprocessor #define
        Macro = {fg = c.blue}, -- same as Define
        Typedef = {fg = c.cyan}, -- A typedef
        PreCondit = {fg = c.cyan}, -- preprocessor #if, #else, #endif, etc.
        Special = {fg = c.blue, bg = c.none, style = "italic"}, -- any special symbol
        SpecialChar = {fg = c.orange}, -- special character in a constant
        Tag = {fg = c.red}, -- you can use CTRL-] on this
        Delimiter = {fg = c.yellow}, -- character that needs attention like , or .
        SpecialComment = {fg = c.blue}, -- special things inside a comment
        Debug = {fg = c.red}, -- debugging statements
        Underlined = {fg = c.cyan, bg = c.none, style = "underline"}, -- text that stands out, HTML links
        Ignore = {fg = c.gray_alt}, -- left blank, hidden
        Error = {fg = c.red, bg = c.none, style = "bold,underline"}, -- any erroneous construct
        Todo = {fg = c.cyan, bg = c.none, style = "bold,italic"}, -- anything that needs extra attention; mostly the keywords TODO FIXME and XXX
        -- HTML
        htmlArg = {fg = c.orange},
        htmlBold = {fg = c.orange, bg = c.none, style = "bold"},
        htmlEndTag = {fg = c.fg},
        htmlstyle = {fg = c.cyan, bg = c.none, style = "italic"},
        htmlLink = {fg = c.cyan, style = "underline"},
        htmlSpecialChar = {fg = c.orange},
        htmlSpecialTagName = {fg = c.blue, style = cfg.bold},
        htmlTag = {fg = c.fg},
        htmlTagN = {fg = c.blue},
        htmlTagName = {fg = c.blue, cfg.bold},
        htmlTitle = {fg = c.fg},
        htmlH1 = {fg = c.blue, style = "bold"},
        htmlH2 = {fg = c.blue, style = "bold"},
        htmlH3 = {fg = c.blue, style = "bold"},
        htmlH4 = {fg = c.blue, style = "bold"},
        htmlH5 = {fg = c.blue, style = "bold"},
        -- Markdown
        markdownH1 = {fg = c.blue, style = "bold"},
        markdownH2 = {fg = c.blue, style = "bold"},
        markdownH3 = {fg = c.blue, style = "bold"},
        markdownH4 = {fg = c.blue, style = "bold"},
        markdownH5 = {fg = c.blue, style = "bold"},
        markdownH6 = {fg = c.blue, style = "bold"},
        markdownHeadingDelimiter = {fg = c.red},
        markdownHeadingRule = {fg = c.gray},
        markdownId = {fg = c.cyan},
        markdownIdDeclaration = {fg = c.blue},
        markdownIdDelimiter = {fg = c.cyan},
        markdownstyle = {fg = c.cyan, bg = c.none, style = "italic"},
        markdownLinkDelimiter = {fg = c.cyan},
        markdownLinkText = {fg = c.blue},
        markdownListMarker = {fg = c.red},
        markdownOrderedListMarker = {fg = c.red},
        markdownRule = {fg = c.gray},
        markdownUrl = {fg = c.cyan, bg = c.none, style = "underline"},
        markdownBlockquote = {fg = c.gray},
        markdownBold = {fg = c.orange, bg = c.none, style = "bold"},
        markdownCode = {fg = c.purple, bg = c.bg1},
        markdownCodeBlock = {fg = c.green},
        markdownCodeDelimiter = {fg = c.green},
        -- Dashboard
        DashboardShortCut = {fg = c.red},
        DashboardHeader = {fg = c.purple},
        DashboardCenter = {fg = c.blue},
        DashboardFooter = {fg = c.green, style = "italic"},
        -- TreeSitter highlight groups
        TSComment = {fg = c.disabled, bg = c.none, style = cfg.italic_comment}, -- For comment blocks.
        TSConditional = {fg = c.light_blue, style = cfg.italic_keyword}, -- For keywords related to conditionnals.
        TSKeyword = {fg = c.blue, style = cfg.italic_keyword}, -- For keywords that don't fall in previous categories.
        TSAnnotation = {fg = orange}, -- For C++/Dart attributes, annotations that can be attached to the code to denote some kind of meta information.
        TSRepeat = {fg = c.blue, style = cfg.italic_keyword}, -- For keywords related to loops.
        TSAttribute = {fg = cyan}, -- (unstable) TODO: docs
        TSKeywordFunction = {fg = c.blue, style = cfg.italic_keyword}, -- For keywords used to define a fuction.
        TSCharacter = {fg = orange}, -- For characters.
        TSBoolean = {fg = c.orange, bg = c.none, style = cfg.italic_boolean}, -- true or false
        TSFunction = {fg = c.purple, style = cfg.italic_function .. cfg.bold}, -- For fuction (calls and definitions).
        TSMethod = {fg = c.purple, style = cfg.italic_function}, -- For method calls and definitions.
        TSConstructor = {fg = red}, -- For constructor calls and definitions: `= { }` in Lua, and Java constructors.
        TSFuncBuiltin = {fg = c.orange, style = cfg.italic_function}, -- For builtin functions: `table.insert` in Lua.
        TSConstant = {fg = violet}, -- For constants
        TSVariable = {fg = c.light_pink, style = cfg.italic_variable}, -- Any variable name that does not have another highlight.
        TSVariableBuiltin = {fg = c.cyan, style = cfg.italic_variable}, -- Variable names that are defined by the languages, like `this` or `self`.        TSConstBuiltin = {fg = orange}, -- For constant that are built in the language: `nil` in Lua.
        TSConstMacro = {fg = c.cyan}, -- For constants that are defined by macros: `NULL` in C.
        TSError = {fg = c.red}, -- For syntax/parser errors.
        TSException = {fg = c.blue}, -- For exception related keywords.
        TSField = {fg = c.red}, -- For fields.
        TSFloat = {fg = c.red}, -- For floats.
        TSFuncMacro = {fg = c.orange}, -- For macro defined fuctions (calls and definitions): each `macro_rules` in Rust.
        TSInclude = {fg = c.blue}, -- For includes: `#include` in C, `use` or `extern crate` in Rust, or `require` in Lua.
        TSLabel = {fg = c.cyan}, -- For labels: `label:` in C and `:label:` in Lua.
        TSNamespace = {fg = c.cyan}, -- For identifiers referring to modules and namespaces.
        TSNumber = {fg = c.red}, -- For all numbers
        TSOperator = {fg = c.blue}, -- For any operator: `+`, but also `->` and `*` in C.
        TSParameter = {fg = c.violet}, -- For parameters of a function.
        TSParameterReference = {fg = c.fg}, -- For references to parameters of a function.
        TSProperty = {fg = c.violet}, -- Same as `TSField`.
        TSPunctDelimiter = {fg = c.fg}, -- For delimiters ie: `.`
        TSPunctBracket = {fg = c.purple}, -- For brackets and parens.
        TSPunctSpecial = {fg = c.yellow}, -- For special punctutation that does not fall in the catagories before.
        TSString = {fg = c.green}, -- For strings.
        TSStringRegex = {fg = c.blue}, -- For regexes.
        TSStringEscape = {fg = c.orange}, -- For escape characters within a string.
        TSSymbol = {fg = c.orange}, -- For identifiers referring to symbols or atoms.
        TSType = {fg = c.orange}, -- For types.
        TSTypeBuiltin = {fg = c.cyan}, -- For builtin types.
        TSTag = {fg = c.blue}, -- Tags like html tag names.
        TSTagDelimiter = {fg = c.blue}, -- Tag delimiter like `<` `>` `/`
        TSText = {fg = c.violet}, -- For strings considered text in a markup language.
        TSTextReference = {fg = c.orange}, -- FIXME
        TSEmphasis = {fg = c.violet}, -- For text to be represented with emphasis.
        TSUnderline = {fg = c.fg, bg = c.none, style = "underline"}, -- For text to be represented with an underline.
        TSStrike = {}, -- For strikethrough text.
        TSTitle = {fg = c.fg, bg = c.none, style = "bold"}, -- Text that is part of a title.
        TSLiteral = {fg = c.fg}, -- Literal text.
        TSURI = {fg = c.purple}, -- Any URL like a link or email.
        --TSNone =                    { },    -- TODO: docs
        -- Lsp highlight groups
        LspDiagnosticsDefaultError = {fg = c.red}, -- used for "Error" diagnostic virtual text
        LspDiagnosticsSignError = {fg = c.red}, -- used for "Error" diagnostic signs in sign column
        LspDiagnosticsFloatingError = {fg = c.red, style = "bold"}, -- used for "Error" diagnostic messages in the diagnostics float
        LspDiagnosticsVirtualTextError = {fg = c.red, style = cfg.bold}, -- Virtual text "Error"
        LspDiagnosticsUnderlineError = {fg = c.red, style = "undercurl", sp = c.red}, -- used to underline "Error" diagnostics.
        LspDiagnosticsDefaultWarning = {fg = c.orange}, -- used for "Warning" diagnostic signs in sign column
        LspDiagnosticsSignWarning = {fg = c.orange}, -- used for "Warning" diagnostic signs in sign column
        LspDiagnosticsFloatingWarning = {fg = c.orange, style = "bold"}, -- used for "Warning" diagnostic messages in the diagnostics float
        LspDiagnosticsVirtualTextWarning = {fg = c.orange, style = cfg.bold}, -- Virtual text "Warning"
        LspDiagnosticsUnderlineWarning = {fg = c.orange, style = "undercurl", sp = c.orange}, -- used to underline "Warning" diagnostics.
        LspDiagnosticsDefaultInformation = {fg = c.blue}, -- used for "Information" diagnostic virtual text
        LspDiagnosticsSignInformation = {fg = c.blue}, -- used for "Information" diagnostic signs in sign column
        LspDiagnosticsFloatingInformation = {fg = c.blue, style = "bold"}, -- used for "Information" diagnostic messages in the diagnostics float
        LspDiagnosticsVirtualTextInformation = {fg = c.blue, style = cfg.bold}, -- Virtual text "Information"
        LspDiagnosticsUnderlineInformation = {fg = c.blue, style = "undercurl", sp = c.blue}, -- used to underline "Information" diagnostics.
        LspDiagnosticsDefaultHint = {fg = c.cyan}, -- used for "Hint" diagnostic virtual text
        LspDiagnosticsSignHint = {fg = c.cyan}, -- used for "Hint" diagnostic signs in sign column
        LspDiagnosticsFloatingHint = {fg = c.cyan, style = "bold"}, -- used for "Hint" diagnostic messages in the diagnostics float
        LspDiagnosticsVirtualTextHint = {fg = c.cyan, style = cfg.bold}, -- Virtual text "Hint"
        LspDiagnosticsUnderlineHint = {fg = c.cyan, style = "undercurl", sp = c.blue}, -- used to underline "Hint" diagnostics.
        LspReferenceText = {fg = c.fg, bg = c.purple}, -- used for highlighting "text" references
        LspReferenceRead = {fg = c.fg, bg = c.purple}, -- used for highlighting "read" references
        LspReferenceWrite = {fg = c.fg, bg = c.purple}, -- used for highlighting "write" references
        -- Plugins highlight groups
        -- LspTrouble
        LspTroubleText = {fg = c.bg4},
        LspTroubleCount = {fg = c.purple, bg = c.bg3},
        LspTroubleNormal = {fg = c.fg, bg = c.bg0},
        -- Diff
        diffAdded = {fg = c.diff_green},
        diffRemoved = {fg = c.diff_red},
        diffChanged = {fg = c.diff_blue},
        diffOldFile = {fg = c.bg4},
        diffNewFile = {fg = c.fg},
        diffFile = {fg = c.gray},
        diffLine = {fg = c.cyan},
        diffIndexLine = {fg = c.purple},
        -- Neogit
        NeogitBranch = {fg = c.gray_alt},
        NeogitRemote = {fg = c.purple},
        NeogitHunkHeader = {fg = c.fg, bg = c.cyan},
        NeogitHunkHeaderHighlight = {fg = c.blue, bg = c.bg1},
        NeogitDiffContextHighlight = {fg = c.bg4, bg = c.bg1},
        NeogitDiffDeleteHighlight = {fg = c.red},
        NeogitDiffAddHighlight = {fg = c.green},
        -- GitGutter
        GitGutterAdd = {fg = c.diff_green}, -- diff mode: Added line |diff.txt|
        GitGutterChange = {fg = c.diff_blue}, -- diff mode: Changed line |diff.txt|
        GitGutterDelete = {fg = c.diff_red}, -- diff mode: Deleted line |diff.txt|
        -- GitSigns
        GitSignsAdd = {fg = c.diff_green}, -- diff mode: Added line |diff.txt|
        GitSignsAddNr = {fg = c.diff_green}, -- diff mode: Added line |diff.txt|
        GitSignsAddLn = {fg = c.diff_green}, -- diff mode: Added line |diff.txt|
        GitSignsChange = {fg = c.diff_yellow}, -- diff mode: Changed line |diff.txt|
        GitSignsChangeNr = {fg = c.diff_yellow}, -- diff mode: Changed line |diff.txt|
        GitSignsChangeLn = {fg = c.diff_yellow}, -- diff mode: Changed line |diff.txt|
        GitSignsDelete = {fg = c.diff_red}, -- diff mode: Deleted line |diff.txt|
        GitSignsDeleteNr = {fg = c.diff_red}, -- diff mode: Deleted line |diff.txt|
        GitSignsDeleteLn = {fg = c.diff_red}, -- diff mode: Deleted line |diff.txt|
        -- vim-signify
        SignifySignAdd = {fg = c.diff_green},
        SignifySignChange = {fg = c.diff_yellow},
        SignifySignDelete = {fg = c.diff_red},
        -- Syntastic
        SyntasticError = {fg = c.red},
        SyntasticWarning = {fg = c.yellow},
        SyntasticErrorSign = {fg = c.red},
        SyntasticWarningSign = {fg = c.yellow},
        -- Telescope
        TelescopePromptBorder = {fg = c.green},
        TelescopeResultsBorder = {fg = c.blue},
        TelescopePreviewBorder = {fg = c.purple},
        -- Nerdtree
        NERDTreeDir = {fg = c.purple},
        NERDTreeDirSlash = {fg = c.blue},
        NERDTreeOpenable = {fg = c.orange},
        NERDTreeClosable = {fg = c.orange},
        NERDTreeFile = {fg = c.blue},
        NERDTreeExecFile = {fg = c.green},
        NERDTreeUp = {fg = c.gray},
        NERDTreeCWD = {fg = c.green},
        NERDTreeHelp = {fg = c.gray_alt},
        NERDTreeToggleOn = {fg = c.green},
        NERDTreeToggleOff = {fg = c.red},
        -- NvimTree
        NvimTreeRootFolder = {fg = c.cyan, style = "italic"},
        NvimTreeNormal = {fg = c.light_blue, bg = bg0},
        NvimTreeGitDirty = {fg = c.diff_yellow},
        NvimTreeGitNew = {fg = c.green},
        NvimTreeImageFile = {fg = c.purple},
        NvimTreeExecFile = {fg = c.green},
        NvimTreeSpecialFile = {fg = c.yellow, style = "underline"},
        NvimTreeFolderName = {fg = c.purple},
        NvimTreeEmptyFolderName = {fg = c.gray},
        NvimTreeFolderIcon = {fg = c.blue},
        NvimTreeIndentMarker = {fg = c.gray},
        LspDiagnosticsError = {fg = c.red},
        LspDiagnosticsWarning = {fg = c.orange},
        LspDiagnosticsInformation = {fg = c.gray_alt},
        LspDiagnosticsHint = {fg = c.blue},
        -- Ale-vim
        ALEError = {fg = c.red},
        ALEWarning = {fg = c.orange},
        ALEInfo = {fg = c.blue},
        ALEErrorSign = {fg = c.red},
        ALEWarningSign = {fg = c.orange},
        ALEInfoSign = {fg = c.blue},
        ALEVirtualTextError = {fg = c.red},
        ALEVirtualTextWarning = {fg = c.yellow},
        ALEVirtualTextInfo = {fg = c.blue},
        -- WhichKey
        WhichKey = {fg = c.purple, style = "bold"},
        WhichKeyGroup = {fg = c.violet, style = "italic"},
        WhichKeyDesc = {fg = c.blue, style = "bold"},
        WhichKeySeperator = {fg = c.green},
        WhichKeyFloating = {bg = c.bg1},
        WhichKeyFloat = {bg = c.bg1},
        -- LspSaga
        DiagnosticError = {fg = c.red},
        DiagnosticWarning = {fg = c.orange},
        DiagnosticInformation = {fg = c.blue},
        DiagnosticHint = {fg = c.cyan},
        DiagnosticTruncateLine = {fg = c.fg},
        LspFloatWinNormal = {bg = c.bg0},
        LspFloatWinBorder = {fg = c.purple},
        LspSagaBorderTitle = {fg = c.cyan},
        LspSagaHoverBorder = {fg = c.gray_alt},
        LspSagaRenameBorder = {fg = c.green},
        LspSagaDefPreviewBorder = {fg = c.green},
        LspSagaCodeActionBorder = {fg = c.blue},
        LspSagaFinderSelection = {fg = c.green},
        LspSagaCodeActionTitle = {fg = c.gray_alt},
        LspSagaCodeActionContent = {fg = c.purple},
        LspSagaSignatureHelpBorder = {fg = c.purple},
        ReferencesCount = {fg = c.purple},
        DefinitionCount = {fg = c.purple},
        DefinitionIcon = {fg = c.blue},
        ReferencesIcon = {fg = c.blue},
        TargetWord = {fg = c.cyan},
        -- BufferLine
        BufferLineIndicatorSelected = {fg = c.green},
        BufferLineFill = {bg = c.bg3},
        -- Sneak
        Sneak = {fg = c.bg0, bg = c.green},
        SneakScope = {bg = c.bg4},
        -- Indent Blankline
        IndentBlanklineChar = {fg = c.disabled},
        IndentBlanklineContextChar = {fg = c.cyan},
        -- Nvim dap
        DapBreakpoint = {fg = c.red},
        DapStopped = {fg = c.green},
        -- Startify
        StartifyNumber = {fg = c.purple},
        StartifySelect = {fg = c.green},
        StartifyBracket = {fg = c.gray},
        StartifySpecial = {fg = c.cyan},
        StartifyVar = {fg = c.blue},
        StartifyPath = {fg = c.blue},
        StartifyFile = {fg = c.green},
        StartifySlash = {fg = c.violet},
        StartifyHeader = {fg = c.purple},
        StartifySection = {fg = c.red},
        StartifyFooter = {fg = c.green},
        -- EasyMotion
        EasyMotionTarget = {fg = c.red, bg = c.none, style = "bold"},
        EasyMotionTarget2First = {fg = c.red, bg = c.none, style = "bold"},
        EasyMotionTarget2Second = {fg = c.red, bg = c.none, style = "bold"},
        -- CoC
        CocErrorSign = {fg = c.red},
        CocWarningSign = {fg = c.orange},
        CocInfoSign = {fg = c.green},
        CocHintSign = {fg = c.blue},
        CocErrorFloat = {fg = c.red},
        CocWarningFloat = {fg = c.orange},
        CocInfoFloat = {fg = c.green},
        CocHintFloat = {fg = c.blue},
        CocDiagnosticsError = {fg = c.red},
        CocDiagnosticsWarning = {fg = c.orange},
        CocDiagnosticsInfo = {fg = c.green},
        CocDiagnosticsHint = {fg = c.blue},
        CocSelectedText = {fg = c.red},
        CocCodeLens = {fg = c.gray},
        CocErrorHighlight = {fg = c.red},
        CocWarningHighlight = {fg = c.orange},
        CocInfoHighlight = {fg = c.green},
        CocHintHighlight = {fg = c.blue},
        CocExplorerIndentLine = {fg = c.gray},
        CocExplorerBufferRoot = {fg = c.cyan},
        CocExplorerFileRoot = {fg = c.cyan},
        CocExplorerBufferFullPath = {fg = c.gray},
        CocExplorerFileFullPath = {fg = c.gray},
        CocExplorerBufferReadonly = {fg = c.purple},
        CocExplorerBufferModified = {fg = c.purple},
        CocExplorerBufferNameVisible = {fg = c.orange},
        CocExplorerFileReadonly = {fg = c.purple},
        CocExplorerFileModified = {fg = c.purple},
        CocExplorerFileHidden = {fg = c.gray},
        CocExplorerHelpLine = {fg = c.purple}
    }

    local overrides = vim.g.neon_overrides
    if overrides then
        vim.tbl_extend("force", groups, overrides)
    end

    for group, parameters in pairs(groups) do
        utils.highlight(group, parameters)
    end
end

function neon.colorscheme()
    vim.api.nvim_command("hi clear")
    if vim.fn.exists("syntax_on") then
        vim.api.nvim_command("syntax reset")
    end

    vim.o.termguicolors = true
    vim.g.colors_name = "neon"

    c.generate()
    set_terminal_colors()
    set_groups()
end

return neon
