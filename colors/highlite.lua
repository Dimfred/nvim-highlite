--[[ Highlite, a Neovim colorscheme template.
* Author:     Iron-E (https://github.com/Iron-E)
* Repository: https://github.com/nvim-highlite
Initially forked from vim-rnb, a Vim colorsheme template:
* Author:        Romain Lafourcade (https://github.com/romainl)
* Canonical URL: https://github.com/romainl/vim-rnb
]]
-- Thanks to Romain Lafourcade (https://github.com/romainl) for the original template (romainl/vim-rnb).
--
local vim = vim

vim.g.colors_name = "highlite"
local BG = "bg"
local FG = "fg"
local NONE = {}

--[[ Step 4: highlights
You can define highlight groups like this:
```lua
<highlight group name> = {
    -- The color for the background, `NONE`, `FG` or `BG`
    bg = <color>,
    -- The color for the foreground, `NONE`, `FG` or `BG`
    fg = <color>
    -- The |highlight-blend| value, if one is desired.
    [, blend = <integer>]
    -- Style can be 'bold', 'italic', and more. See |attr-list| for more information.
    -- It can also have a color, and/or multiple <cterm>s.
    [, style = <cterm>|{<cterm> (, <cterm>) [color=<color>]} ]
}
```
You can also link one highlight group to another:
```lua
<highlight group name> = '<highlight group name>'
```
____________________________________________________________________________
Here is an example to define `SpellBad` and then link some new group
`SpellWorse` to it:
```lua
SpellBad = { -- ← name of the highlight group
    bg=NONE, -- background color
    fg=red, -- foureground color
    style={ -- the style
        'undercurl', -- undercurl (squiggly line)
        color=red -- the color of the undercurl
    }
},
SpellWorse = 'SpellBad'
```
If you weren't satisfied with undercurl, and also wanted another effect, you can
add another one below 'undercurl' and it will be applied as well:
```lua
SpellBad = { -- ← name of the highlight group
    bg=NONE, -- background color
    fg=red, -- foureground color
    style={ -- the style
        'undercurl', -- undercurl (squiggly line)
        'standout'
        color=red -- the color of the undercurl
    }
}
```
____________________________________________________________________________
If you want to create a colorscheme that is responsive to the user's
'background' setting, you can specify special `light` and `dark` keys to
define how each group should be highlighted in each case.
```lua
SpellBad = {
    bg=NONE,
    dark={fg=white},
    light={fg=black},
    style={'undercurl', color=red}
}
```
Whenever the user changes their 'background' setting, the settings inside of
whichever key is relevant will be loaded.
____________________________________________________________________________
You can add any custom highlight group to the standard list below but you
shouldn't remove any if you want a working colorscheme. Most of them are
described under |highlight-default|, some from |group-name|, and others from
common syntax groups.  Both help sections are good reads.
____________________________________________________________________________
If you want to inherit a specific attribute of another highlight group, you
can do the following:
```lua
SpellBad = function(self)
    local inherited_style = self.SpellRare.style
    inherited_style.color = red
    return {
        bg=NONE,
        fg=NONE,
        style=inherited_style
    }
end
```
The function will be executed by |highlite| and transformed into the
expected result.
____________________________________________________________________________
NOTE: |Replace-mode| will probably be useful here.
NOTE: /As long as you do not remove any highlight groups or colors/, you can
      safely ignore any highlight groups that are `link`ed to others.
      For example, programming languages almost exclusively link to the 1st
      and 2nd sections, so as long as you define everything there you will
      automatically be defining the rest of the highlights, which is one of
      the benefits of using this template.
]]
local black = {"#0d0d0d", 0, "black"}
local gray = {"#808080", 0, "grey"}
local yellow = {"#FAF607", 0, "yellow"}
local orange = {"#ff8900", 208, "darkyellow"}
local red = {"#df340b", 0, "red"}
local white = {"#ffffff", 231, "white"}

local purple = {"#9C0F61", 0, "purple"}

-- local black         = {'#202020', 235, 'black'}
-- local gray          = {'#808080', 244, 'gray'}
-- local gray_dark     = {'#353535', 236, 'darkgrey'}
-- local gray_darker   = {'#505050', 239, 'gray'}
-- local gray_light    = {'#c0c0c0', 250, 'gray'}
-- local white         = {'#ffffff', 231, 'white'}

-- local tan           = {'#f4c069', 221, 'yellow'}

-- local red_dark      = {'#a80000', 124, 'darkred'}
-- local red           = {'#fc0303', 203, 'red'}
-- local red_light     = {'#f2483f', 205, 'red'}

-- local orange_light  = {'#f0af00', 214, 'darkyellow'}

-- local yellow        = {'#fac32a', 227, 'yellow'}

-- local green_dark    = {'#70d533', 113, 'darkgreen'}
-- local green         = {'#22ff22', 46,  'green'}
-- local green_light   = {'#99ff99', 120, 'green'}
-- local turqoise      = {'#2bff99', 48,  'green'}

-- local blue          = {'#7766ff', 63,  'darkblue'}
-- local cyan          = {'#33dbc3', 80,  'cyan'}
-- local ice           = {'#95c5ff', 111, 'cyan'}
-- local teal          = {'#60afff', 75,  'blue'}

-- local magenta      = {'#d5508f', 168, 'magenta'}
-- local magenta_dark = {'#bb0099', 126, 'darkmagenta'}
-- local pink         = {'#ffa6ff', 219, 'magenta'}
-- local pink_light   = {'#ffb7b7', 217, 'white'}
-- local purple       = {'#cf55f0', 171, 'magenta'}
-- local purple_light = {'#af60af', 133, 'darkmagenta'}

local highlight_group_normal = {fg = white, bg = NONE}

local highlight_groups = {
  --[[ 4.1. Text Analysis ]]
  Normal = {fg = white},
  NormalFloat = "Normal",
  NormalNC = "NormalFloat",
  Comment = {fg = gray},
  NonText = {fg = gray},
  EndOfBuffer = "NonText",
  Whitespace = "NonText",
  --[[ 4.1.1. Literals]]
  Constant = {fg = red},
  String = {fg = orange, style = "bold"},
  Character = {fg = red},
  Number = {fg = orange},
  Boolean = {fg = orange},
  Float = "Number",
  --[[ 4.1.2. Identifiers]]
  Identifier = {fg = orange},
  Function = {fg = white},
  --[[ 4.1.3. Syntax]]
  Statement = {fg = red},
  Conditional = {fg = red},
  Repeat = {fg = red},
  Label = {fg = red, style = "bold"},
  Operator = {fg = red, style = "bold"},
  Keyword = {fg = red},
  Exception = {fg = red, style = "bold"},
  Noise = "Delimiter",
  --[[ 4.1.4. Metatextual Information]]
  PreProc = {fg = red},
  Include = {fg = red, style = "nocombine"},
  Define = {fg = red, style = "nocombine"},
  Macro = {fg = red},
  PreCondit = {fg = red},
  --[[ 4.1.5. Semantics]]
  Type = {fg = yellow},
  StorageClass = {fg = yellow, style = "bold"},
  Structure = {fg = red, style = "bold"},
  Typedef = {fg = purple},
  --[[ 4.1.6. Edge Cases]]
  Special = {fg = magenta, style = "bold"},
  SpecialChar = {fg = red_light},
  SpecialKey = "Character",
  Tag = "Underlined",
  Delimiter = {fg = white},
  SpecialComment = {fg = gray, style = {"bold", "nocombine"}},
  Debug = "WarningMsg",
  --[[ 4.1.7. Help Syntax]]
  Underlined = {fg = turqoise, style = "underline"},
  Ignore = {fg = gray},
  Error = {fg = white, bg = red_dark, style = "bold"},
  Todo = {fg = black, bg = yellow, style = "bold"},
  Hint = {fg = black, bg = magenta, style = "bold"},
  Info = {fg = black, bg = pink_light, style = "bold"},
  Warning = {fg = black, bg = orange, style = "bold"},
  --[[ 4.2... Editor UI  ]]
  --[[ 4.2.1. Status Line]]
  StatusLine = {fg = green_light, bg = gray_darker},
  StatusLineNC = function(self)
    return {fg = gray, bg = self.StatusLine.bg}
  end,
  StatusLineTerm = "StatusLine",
  StatusLineTermNC = "StatusLineNC",
  --[[ 4.2.2. Separators]]
  FloatBorder = {fg = gray},
  TabLine = {fg = red, bg = black},
  TabLineFill = {fg = black, bg = black},
  TabLineSel = {fg = black, bg = red},
  TabLineSeparatorActive = {fg = black},
  TabLineSeparatorInactive = {fg = red},
  TabLineIconActive = {fg = black},
  TabLineIconInactive = {fg = red},
  Title = {style = "bold"},
  VertSplit = {fg = red},
  --[[ 4.2.3. Conditional Line Highlighting]]
  Conceal = "NonText",
  CursorLine = {bg = gray_dark},
  CursorLineNr = function(self)
    return {fg = pink, bg = self.LineNr.bg}
  end,
  debugBreakpoint = "ErrorMsg",
  debugPC = "ColorColumn",
  LineNr = {fg = gray},
  QuickFixLine = function(self)
    return {bg = self.StatusLine.bg}
  end,
  Visual = {style = "inverse"},
  VisualNOS = {bg = gray_darker},
  --[[ 4.2.4. Popup Menu]]
  Pmenu = {fg = red, bg = black},
  PmenuSbar = {bg = black},
  PmenuSel = {fg = black, bg = red},
  PmenuThumb = {bg = red},
  WildMenu = "PmenuSel",
  --[[ 4.2.5. Folds]]
  FoldColumn = {fg = red, style = "bold"},
  Folded = {fg = red, style = "bold"},
  --[[ 4.2.6. Diffs]]
  DiffAdd = {fg = black, bg = green_dark},
  DiffChange = NONE,
  DiffDelete = function(self)
    return {fg = self.DiffAdd.fg, bg = red}
  end,
  DiffText = function(self)
    return {fg = self.DiffAdd.fg, bg = yellow}
  end,
  --[[ 4.2.7. Searching]]
  MatchParen = {fg = green, style = {"bold", "underline"}},
  Search = {fg = black, bg = red, style = "bold"},
  IncSearch = "Search",
  --[[ 4.2.8. Spelling]]
  SpellBad = {style = {"undercurl", color = red}},
  SpellCap = {style = {"undercurl", color = yellow}},
  SpellLocal = {style = {"undercurl", color = gray}},
  SpellRare = {style = {"undercurl", color = orange}},
  --[[ 4.2.9. Conditional Column Highlighting]]
  ColorColumn = {style = "inverse"},
  SignColumn = NONE,
  --[[ 4.2.10. Messages]]
  ErrorMsg = {fg = red, style = "bold"},
  HintMsg = {fg = purple},
  InfoMsg = {fg = purple},
  ModeMsg = {fg = yellow},
  WarningMsg = {fg = orange, style = "bold"},
  Question = {fg = orange, style = "underline"},
  --[[ 4.2.11. LSP / Diagnostics ]]
  DiagnosticError = "Error",
  DiagnosticFloatingError = "ErrorMsg",
  DiagnosticSignError = "DiagnosticFloatingError",
  DiagnosticWarn = "Warning",
  DiagnosticFloatingWarn = "WarningMsg",
  DiagnosticSignWarn = "DiagnosticFloatingWarn",
  DiagnosticHint = "Hint",
  DiagnosticFloatingHint = "HintMsg",
  DiagnosticSignHint = "DiagnosticFloatingHint",
  DiagnosticInfo = "Info",
  DiagnosticFloatingInfo = "InfoMsg",
  DiagnosticSignInfo = "DiagnosticFloatingInfo",
  DiagnosticUnderlineError = {style = {"undercurl", color = red}},
  DiagnosticUnderlineHint = {style = {"undercurl", color = purple}},
  DiagnosticUnderlineInfo = {style = {"undercurl", color = purple}},
  DiagnosticUnderlineWarn = {style = {"undercurl", color = orange}},
  LspDiagnosticsDefaultError = "DiagnosticError",
  LspDiagnosticsFloatingError = "DiagnosticFloatingError",
  LspDiagnosticsSignError = "DiagnosticSignError",
  LspDiagnosticsDefaultWarning = "DiagnosticWarn",
  LspDiagnosticsFloatingWarning = "DiagnosticFloatingWarn",
  LspDiagnosticsSignWarning = "DiagnosticSignWarn",
  LspDiagnosticsDefaultHint = "DiagnosticHint",
  LspDiagnosticsFloatingHint = "DiagnosticFloatingHint",
  LspDiagnosticsSignHint = "DiagnosticSignHint",
  LspDiagnosticsDefaultInformation = "DiagnosticInfo",
  LspDiagnosticsFloatingInformation = "DiagnosticFloatingInfo",
  LspDiagnosticsSignInformation = "DiagnosticSignInfo",
  LspDiagnosticsUnderlineError = "DiagnosticUnderlineError",
  LspDiagnosticsUnderlineHint = "DiagnosticUnderlineHint",
  LspDiagnosticsUnderlineInfo = "DiagnosticUnderlineInfo",
  LspDiagnosticsUnderlineWarning = "DiagnosticUnderlineWarn",
  --[[ 4.2.12. Cursor ]]
  Cursor = {style = "inverse"},
  CursorIM = "Cursor",
  CursorColumn = {bg = gray_dark},
  --[[ 4.2.13. Misc ]]
  Directory = {fg = ice, style = "bold"},
  --[[ 4.3. Programming Languages
    Everything in this section is OPTIONAL. Feel free to remove everything
    here if you don't want to define it, or add more if there's something
    missing.
]]
  --[[ 4.3.1. C ]]
  cType = red,
  cConstant = "Constant",
  cCustomClass = "Type",
  cFunction = white,
  --[[ 4.3.2. C++ ]]
  cCustomTemplate = orange,
  cCustomClassName = orange,
  cppStatement = red,
  cppStructure = red,
  cppSTLexception = "Exception",
  cppSTLnamespace = "String",
  --[[ 4.3.3 C# ]]
  csBraces = "Delimiter",
  csClass = "Structure",
  csClassType = "Type",
  csContextualStatement = "Conditional",
  csEndColon = "Delimiter",
  csGeneric = "Typedef",
  csInterpolation = "Include",
  csInterpolationDelimiter = "SpecialChar",
  csLogicSymbols = "Operator",
  csModifier = "Keyword",
  csNew = "Operator",
  csNewType = "Type",
  csParens = "Delimiter",
  csPreCondit = "PreProc",
  csQuote = "Delimiter",
  csRepeat = "Repeat",
  csStorage = "StorageClass",
  csUnspecifiedStatement = "Statement",
  csXmlTag = "Define",
  csXmlTagName = "Define",
  razorCode = "PreProc",
  razorcsLHSMemberAccessOperator = "Noise",
  razorcsRHSMemberAccessOperator = "razorcsLHSMemberAccessOperator",
  razorcsStringDelimiter = "razorhtmlValueDelimiter",
  razorcsTypeNullable = "Special",
  razorcsUnaryOperatorKeyword = "Operator",
  razorDelimiter = "Delimiter",
  razorEventAttribute = "PreCondit",
  razorFor = "razorIf",
  razorhtmlAttribute = "htmlArg",
  razorhtmlAttributeOperator = "Operator",
  razorhtmlTag = "htmlTag",
  razorhtmlValueDelimiter = "Delimiter",
  razorIf = "PreCondit",
  razorImplicitExpression = "PreProc",
  razorLine = "Constant",
  razorUsing = "Include",
  --[[ 4.3.4. CSS ]]
  cssAtRule = "PreCondit",
  cssAttr = "Keyword",
  cssAttrComma = "Noise",
  cssAttrRegion = "Keyword",
  cssBraces = "Delimiter",
  cssClassName = "Identifier",
  cssClassNameDot = "Noise",
  cssFlexibleBoxAttr = "cssAttr",
  cssFunctionComma = "Noise",
  cssImportant = "Exception",
  cssNoise = "Noise",
  cssProp = "Label",
  cssPseudoClass = "Special",
  cssPseudoClassId = "cssSelectorOp",
  cssSelectorOp = "Operator",
  cssTagName = "Structure",
  cssUnitDecorators = "Type",
  scssAmpersand = "Special",
  scssAttribute = "Noise",
  scssBoolean = "Boolean",
  scssDefault = "Keyword",
  scssElse = "scssIf",
  scssMixinName = function(self)
    local super = self.cssClassName
    return {bg = super.bg, fg = super.fg}
  end,
  scssIf = "PreCondit",
  scssInclude = "Include",
  scssSelectorChar = "Delimiter",
  scssDefinition = "PreProc",
  scssSelectorName = "Identifier",
  scssVariable = "Define",
  scssVariableAssignment = "Operator",
  --[[ 4.3.5. Dart ]]
  dartLibrary = "Statement",
  --[[ 4.3.6. dot ]]
  dotKeyChar = "Character",
  dotType = "Type",
  --[[ 4.3.7. Go ]]
  goBlock = "Delimiter",
  goBoolean = "Boolean",
  goBuiltins = "Operator",
  goField = "Identifier",
  goFloat = "Float",
  goFormatSpecifier = "Character",
  goFunction = "Function",
  goFunctionCall = "goFunction",
  goFunctionReturn = NONE,
  goMethodCall = "goFunctionCall",
  goParamType = "goReceiverType",
  goPointerOperator = "SpecialChar",
  goPredefinedIdentifiers = "Constant",
  goReceiver = "goBlock",
  goReceiverType = "goTypeName",
  goSimpleParams = "goBlock",
  goType = "Type",
  goTypeConstructor = "goFunction",
  goTypeName = "Type",
  goVarAssign = "Identifier",
  goVarDefs = "goVarAssign",
  --[[ 4.3.8. HTML ]]
  htmlArg = "Label",
  htmlBold = {fg = highlight_group_normal.fg, style = "bold"},
  htmlTitle = "htmlBold",
  htmlEndTag = "htmlTag",
  htmlH1 = "markdownH1",
  htmlH2 = "markdownH2",
  htmlH3 = "markdownH3",
  htmlH4 = "markdownH4",
  htmlH5 = "markdownH5",
  htmlH6 = "markdownH6",
  htmlItalic = {style = "italic"},
  htmlSpecialTagName = "Keyword",
  htmlTag = "Special",
  htmlTagN = "Typedef",
  htmlTagName = "Type",
  --[[ 4.3.9. Java ]]
  javaClassDecl = "Structure",
  --[[ 4.3.10. JavaScript ]]
  jsFuncBlock = "Function",
  jsObjectKey = "Type",
  jsReturn = "Keyword",
  jsVariableDef = "Identifier",
  --[[ 4.3.11. JSON ]]
  jsonBraces = "luaBraces",
  jsonEscape = "SpecialChar",
  jsonKeywordMatch = "Operator",
  jsonNull = "Constant",
  jsonQuote = "Delimiter",
  jsonString = "String",
  jsonStringSQError = "Exception",
  --[[ 4.3.12. Lua ]]
  luaBraces = "Structure",
  luaBrackets = "Delimiter",
  luaBuiltin = "Keyword",
  luaComma = "Delimiter",
  luaFuncArgName = "Identifier",
  luaFuncCall = "Function",
  luaFuncId = "luaNoise",
  luaFuncKeyword = "Type",
  luaFuncName = "Function",
  luaFuncParens = "Delimiter",
  luaFuncTable = "Structure",
  luaIn = "luaRepeat",
  luaLocal = "Type",
  luaNoise = "Delimiter",
  luaParens = "Delimiter",
  luaSpecialTable = "Structure",
  luaSpecialValue = "Function",
  luaStringLongTag = function(self)
    local delimiter = self.Delimiter
    return {bg = delimiter.bg, fg = delimiter.fg}
  end,
  --[[ 4.3.12. Make ]]
  makeCommands = "Statment",
  makeSpecTarget = "Type",
  --[[ 4.3.13. Markdown ]]
  markdownCode = "mkdCode",
  markdownCodeDelimiter = "mkdCodeDelimiter",
  markdownH1 = {fg = red, style = "bold"},
  markdownH2 = {fg = red, style = "bold"},
  markdownH3 = {fg = red, style = "bold"},
  markdownH4 = {fg = red, style = "bold"},
  markdownH5 = {fg = red, style = "bold"},
  markdownH6 = {fg = red, style = "bold"},
  markdownLinkDelimiter = "Delimiter",
  markdownLinkTextDelimiter = "markdownLinkDelimiter",
  markdownUrl = "Underlined",
  mkdBold = "Ignore",
  mkdBoldItalic = "mkdBold",
  mkdCode = "Keyword",
  mkdCodeDelimiter = "mkdBold",
  mkdCodeEnd = "mkdCodeStart",
  mkdCodeStart = "mkdCodeDelimiter",
  mkdHeading = "Delimiter",
  mkdItalic = "mkdBold",
  mkdLineBreak = "NonText",
  mkdListItem = "Special",
  mkdRule = function(self)
    return {fg = self.Ignore.fg, style = {"underline", color = self.Delimiter.fg}}
  end,
  --[[ 4.3.20. Python ]]
  pythonBrackets = orange,
  pythonBuiltinFunc = {fg = yellow, style = "bold"},
  pythonBuiltinObj = red,
  pythonBuiltinType = red,
  pythonClass = red,
  pythonClassParameters = white,
  pythonDecorator = orange,
  pythonDottedName = "Identifier",
  pythonError = red,
  pythonException = "Exception",
  pythonInclude = "Include",
  pythonIndentError = "pythonError",
  pythonLambdaExpr = "pythonOperator",
  pythonOperator = "Operator",
  pythonParam = "Identifier",
  pythonParameters = "Delimiter",
  pythonSelf = "Statement",
  pythonSpaceError = "pythonError",
  pythonStatement = "Statement",
  --[[ 4.3.21. Ruby ]]
  rubyClass = "Structure",
  rubyDefine = "Define",
  rubyInterpolationDelimiter = "Delimiter",
  --[[ 4.3.23. Scala ]]
  scalaKeyword = "Keyword",
  scalaNameDefinition = "Identifier",
  --[[ 4.3.24. shell ]]
  shDerefSimple = "SpecialChar",
  shFunctionKey = "Function",
  shLoop = "Repeat",
  shParen = "Delimiter",
  shQuote = "Delimiter",
  shSet = "Statement",
  shTestOpr = "Debug",
  --[[ 4.3.25. Solidity ]]
  solBuiltinType = "Type",
  solContract = "Typedef",
  solContractName = "Function",
  --[[ 4.3.26. TOML ]]
  tomlComment = "Comment",
  tomlDate = "Special",
  tomlFloat = "Float",
  tomlKey = "Label",
  tomlTable = "Structure",
  --[[ 4.3.27. VimScript ]]
  vimCmdSep = "Delimiter",
  vimFunction = "Function",
  vimFgBgAttrib = "Constant",
  vimHiCterm = "Label",
  vimHiCtermFgBg = "vimHiCterm",
  vimHiGroup = "Typedef",
  vimHiGui = "vimHiCterm",
  vimHiGuiFgBg = "vimHiGui",
  vimHiKeyList = "Operator",
  vimIsCommand = "Identifier",
  vimOption = "Keyword",
  vimScriptDelim = "Ignore",
  vimSet = "String",
  vimSetEqual = "Operator",
  vimSetSep = "Delimiter",
  vimUserFunc = "vimFunction",
  --[[ 4.3.28. XML ]]
  xmlAttrib = "htmlArg",
  xmlEndTag = "xmlTag",
  xmlEqual = "Operator",
  xmlTag = "htmlTag",
  xmlTagName = "htmlTagName",
  --[[ 4.3.29. SQL ]]
  sqlKeyword = "Keyword",
  sqlParen = "Delimiter",
  sqlSpecial = "Constant",
  sqlStatement = "Statement",
  sqlParenFunc = "Function",
  --[[ 4.3.30. dos INI ]]
  dosiniHeader = "Title",
  dosiniLabel = "Label",
  --[[ 4.3.31. Crontab ]]
  crontabDay = "StorageClass",
  crontabDow = "String",
  crontabHr = "Number",
  crontabMin = "Float",
  crontabMnth = "Structure",
  --[[ 4.3.32. PlantUML ]]
  plantumlArrowLR = "Statement",
  plantumlColonLine = NONE,
  plantumlMindmap = "Label",
  plantumlMindmap2 = "Label",
  --[[ 4.3.33. YAML ]]
  yamlKey = "Label",
  --[[ 4.3.34. Git ]]
  diffAdded = "DiffAdd",
  diffRemoved = "DiffDelete",
  gitcommitHeader = "SpecialComment",
  gitcommitDiscardedFile = "gitcommitSelectedFile",
  gitcommitOverFlow = "Error",
  gitcommitSelectedFile = "Directory",
  gitcommitSummary = "Title",
  gitcommitUntrackedFile = "gitcommitSelectedFile",
  gitconfigAssignment = "String",
  gitconfigEscape = "SpecialChar",
  gitconfigNone = "Operator",
  gitconfigSection = "Structure",
  gitconfigVariable = "Label",
  gitrebaseBreak = "Keyword",
  gitrebaseCommit = "Tag",
  gitrebaseDrop = "Exception",
  gitrebaseEdit = "Define",
  gitrebaseExec = "PreProc",
  gitrebaseFixup = "gitrebaseSquash",
  gitrebaseMerge = "PreProc",
  gitrebasePick = "Include",
  gitrebaseReset = "gitrebaseLabel",
  gitrebaseReword = "gitrebasePick",
  gitrebaseSquash = "Macro",
  gitrebaseSummary = "Title",
  --[[ 4.3.35. Vimtex ]]
  texMathRegion = "Number",
  texMathSub = "Number",
  texMathSuper = "Number",
  texMathRegionX = "Number",
  texMathRegionXX = "Number",
  --[[ 4.3.37 Help ]]
  helpHeader = "Label",
  helpOption = "Keyword",
  helpHeadline = "Title",
  helpSectionDelim = "Delimiter",
  helpHyperTextJump = "Underlined",
  --[[ 4.3.38 Man ]]
  -- manBold = function(self) return vim.tbl_extend('force', self.mkdCode, {style='nocombine'}) end,
  manOptionDesc = "Special",
  manReference = "Tag",
  manUnderline = "Label",
  --[[ 4.3.39 Rust ]]
  rustIdentifier = "Identifier",
  --[[ 4.3.40 XXD ]]
  xxdAddress = "Label",
  xxdAscii = "Character",
  xxdDot = "Ignore",
  xxdSep = "Delimiter",
  --[[ 4.4. Plugins
    Everything in this section is OPTIONAL. Feel free to remove everything
    here if you don't want to define it, or add more if there's something
    missing.
]]
  --[[ 4.4.2. vim-jumpmotion / vim-easymotion ]]
  EasyMotion = "IncSearch",
  JumpMotion = "EasyMotion",
  --[[ 4.4.4. vim-gitgutter / vim-signify / gitsigns.nvim ]]
  GitGutterAdd = {fg = green},
  GitGutterChange = {fg = yellow},
  GitGutterDelete = {fg = red},
  GitGutterChangeDelete = {fg = orange},
  SignifySignAdd = "GitGutterAdd",
  SignifySignChange = "GitGutterChange",
  SignifySignDelete = "GitGutterDelete",
  SignifySignChangeDelete = "GitGutterChangeDelete",
  GitSignsAdd = "GitGutterAdd",
  GitSignsChange = "GitGutterChange",
  GitSignsDelete = "GitGutterDelete",
  --[[ 4.4.5. vim-indent-guides ]]
  IndentGuidesOdd = {bg = gray_darker},
  IndentGuidesEven = {bg = gray},
  --[[ 4.4.8. nvim-treesitter ]]
  TSConstBuiltin = "Constant",
  TSConstructor = "Typedef",
  TSFuncBuiltin = red,
  TSStringEscape = "Character",
  TSStringRegex = "SpecialChar",
  TSURI = "Tag",
  TSVariableBuiltin = red,
  --[[ 4.4.10. vim-sandwhich ]]
  OperatorSandwichChange = "DiffText",
  --[[ 4.4.11. Fern ]]
  FernBranchText = "Directory",
  --[[ 4.4.12. LSPSaga ]]
  DefinitionCount = "Number",
  DefinitionIcon = "Special",
  ReferencesCount = "Number",
  ReferencesIcon = "DefinitionIcon",
  TargetFileName = "Directory",
  TargetWord = "Title",
  --[[ 4.4.13. indent-blankline.nvim ]]
  IndentBlanklineChar = function(self)
    return vim.tbl_extend("force", self.Whitespace, {style = "nocombine"})
  end,
  IndentBlanklineSpaceChar = "IndentBlanklineChar",
  --[[ 4.4.14. trouble.nvim ]]
  TroubleCount = function(self)
    return vim.tbl_extend("force", self.Number, {style = "underline"})
  end,
  --[[ 4.4.15. todo-comments.nvim ]]
  TodoFgFIX = function(self)
    return {fg = self.ErrorMsg.fg}
  end,
  TodoFgHACK = function(self)
    return {fg = self.Todo.bg}
  end,
  TodoFgNOTE = "HintMsg",
  TodoFgPERF = "InfoMsg",
  TodoFgTODO = {fg = cyan},
  TodoFgWARN = function(self)
    return {fg = self.WarningMsg.fg}
  end,
  TodoBgFIX = function(self)
    return {
      fg = black,
      bg = self.ErrorMsg.fg,
      style = {"bold", "italic", "nocombine"}
    }
  end,
  TodoBgHACK = function(self)
    return {fg = black, bg = self.Todo.bg, style = {"bold", "italic", "nocombine"}}
  end,
  TodoBgNOTE = function(self)
    return {fg = black, bg = self.Hint.bg, style = {"bold", "italic", "nocombine"}}
  end,
  TodoBgPERF = function(self)
    return {fg = black, bg = self.Info.bg, style = {"bold", "italic", "nocombine"}}
  end,
  TodoBgTODO = {fg = black, bg = cyan, style = {"bold", "italic", "nocombine"}},
  TodoBgWARN = function(self)
    return {
      fg = black,
      bg = self.Warning.bg,
      style = {"bold", "italic", "nocombine"}
    }
  end,
  TodoSignFIX = "TodoFgFIX",
  TodoSignHACK = "TodoFgHACK",
  TodoSignNOTE = "TodoFgNOTE",
  TodoSignPERF = "TodoFgPERF",
  TodoSignTODO = "TodoFgTODO",
  TodoSignWARN = "TodoFgWARN",
  --[[ 4.4.16. nvim-cmp ]]
  CmpDocumentationBorder = red,
  CmpItemAbbrDefault = "Ignore",
  CmpItemAbbrMatchDefault = "Underlined",
  CmpItemAbbrMatchFuzzyDefault = {
    fg = highlight_group_normal.fg,
    style = {"nocombine", "underline"}
  },
  CmpItemKindDefault = {fg = red},
  CmpItemKindClassDefault = "CmpItemKindDefault",
  CmpItemKindColorDefault = "CmpItemKindDefault",
  CmpItemKindConstantDefault = "CmpItemKindDefault",
  CmpItemKindConstructorDefault = "CmpItemKindDefault",
  CmpItemKindEnumDefault = "CmpItemKindDefault",
  CmpItemKindEnumMemberDefault = "CmpItemKindDefault",
  CmpItemKindEventDefault = "CmpItemKindDefault",
  CmpItemKindFieldDefault = "CmpItemKindDefault",
  CmpItemKindFileDefault = "CmpItemKindDefault",
  CmpItemKindFolderDefault = "CmpItemKindDefault",
  CmpItemKindFunctionDefault = "CmpItemKindDefault",
  CmpItemKindInterfaceDefault = "CmpItemKindDefault",
  CmpItemKindKeywordDefault = "CmpItemKindDefault",
  CmpItemKindMethodDefault = "CmpItemKindDefault",
  CmpItemKindModuleDefault = "CmpItemKindDefault",
  CmpItemKindOperatorDefault = "CmpItemKindDefault",
  CmpItemKindPropertyDefault = "CmpItemKindDefault",
  CmpItemKindReferenceDefault = "CmpItemKindDefault",
  CmpItemKindSnippetDefault = "CmpItemKindDefault",
  CmpItemKindStructDefault = "CmpItemKindDefault",
  CmpItemKindTextDefault = "CmpItemKindDefault",
  CmpItemKindTypeParameterDefault = "CmpItemKindDefault",
  CmpItemKindUnitDefault = "CmpItemKindDefault",
  CmpItemKindValueDefault = "CmpItemKindDefault",
  CmpItemKindVariableDefault = "CmpItemKindDefault",
  CmpWindowScrollThumb = {fg = white, style = "bold"},
  --[[ 4.4.17. packer.nvim ]]
  packerFail = "ErrorMsg",
  packerHash = "Number",
  packerPackageNotLoaded = "Ignore",
  packerStatusFail = "Statement",
  packerStatusSuccess = "packerStatusFail",
  packerSuccess = function(self)
    return {fg = green, style = self.packerFail.style}
  end,
  --[[ 4.4.18. nvim-tree ]]
  NvimTreeGitDeleted = function(self)
    return {fg = self.DiffDelete.bg, bg = NONE}
  end,
  NvimTreeGitDirty = {fg = orange, bg = NONE},
  NvimTreeGitIgnored = "Ignore",
  NvimTreeGitMerge = "NvimTreeGitRenamed",
  NvimTreeGitNew = function(self)
    return {fg = self.DiffAdd.bg, bg = NONE}
  end,
  NvimTreeGitRenamed = function(self)
    return {fg = self.DiffChange.bg, bg = NONE}
  end,
  NvimTreeGitStaged = {fg = cyan, bg = NONE},
  --[[ 4.4.19 telescope.nvim ]]
  TelescopeNormal = {fg = red, bg = black},
  TelescopeBorder = {fg = red, bg = black},
  -- prompt
  TelescopePromptNormal = {fg = red, bg = black},
  TelescopePromptTitle = {fg = red, bg = black},
  -- TelescopePromptBorder = {fg=red},
  -- TelescopePromptPrefix = {}
  -- preview
  TelescopePreviewNormal = {},
  TelescopePreviewTitle = {fg = red, bg = black},
  -- TelescopePreviewBorder = {}
  -- results
  TelescopeResultsTitle = {fg = red, bg = black},
  -- TelescopeSelection = {}
  TelescopeMultiIcon = {fg = red, bg = black},
  -- [[ 4.4.19. nvim-web-devicons ]]
  DevIconLua = {guifg = red},
  LuaDevIcon = {guifg = red},
  IconNameDevicon = {guifg = red}
}

--[[ Step 5: Terminal Colors
Define the color palette used by :terminal when in GUI Vim
or in TUI Vim when 'termguicolors' is enabled. If this list
is empty or if it doesn't contain exactly 16 items, the corresponding
Vim variable won't be set.
The expected values are colors defined in step 3.
Terminal emulators use a basic palette of 16 colors that can be
addressed by CLI and TUI tools via their name or their index, from
0 to 15. The list is not really standardized but it is generally
assumed to look like this:
 | Index  | Name          |
 |:------:|:-------------:|
 | 1      | black         |
 | 2      | darkred       |
 | 3      | darkgreen     |
 | 4      | darkyellow    |
 | 5      | darkblue      |
 | 6      | darkmagenta   |
 | 7      | darkcyan      |
 | 8      | gray          |
 | 9      | darkgray      |
 | 10     | red           |
 | 11     | green         |
 | 12     | yellow        |
 | 13     | blue          |
 | 14     | magenta       |
 | 15     | cyan          |
 | 16     | white         |
While you are certainly free to make colors 0 to 7 shades of blue,
this will inevitably cause usability issues so… be careful.
]]
-- local terminal_colors = {}
local terminal_colors = {
  [1] = black,
  [2] = red_dark,
  [3] = green_dark,
  [4] = orange,
  [5] = blue,
  [6] = magenta_dark,
  [7] = teal,
  [8] = gray,
  [9] = gray_dark,
  [10] = red,
  [11] = green,
  [12] = yellow,
  [13] = turqoise,
  [14] = purple,
  [15] = cyan,
  [16] = gray_light
}

--[[ Step 5: Sourcing
When you wish to load your colorscheme, simply add this folder with a plugin manager
and then use `colorscheme <your colorscheme name>`. For example, in my configuration,
I source highlite by using `colorscheme highlite`.
These online resources can help you design your colorscheme:
1. the xterm palette.
    * http://upload.wikimedia.org/wikipedia/en/1/15/Xterm_256color_chart.svg
2. play with hexadecimal colors right in the address bar (currently down).
    * http://whatcolor.herokuapp.com/
3. similar concept, fuzzier implementation.
    * http://color.hailpixel.com/
4. similar concept, fancier implementation.
    * http://colourco.de/
5. extract a palette from an image.
    * http://www.colr.org/
6. search for 'word', get images and color palettes.
    * http://colores.manugarri.com/
7. user-created palettes.
    * http://www.colourlovers.com/palettes
8. a no-nonsense colorscheme generator.
    * http://www.pluaang.dk/color+scheme/
9. Adobe's fancy colorscheme generator.
    * https://color.adobe.com/
10. The classic 'Color Scheme Designer', rebranded.
    * http://paletton.com/
11. A very smart palette generator.
    * http://vrl.cs.brown.edu/color
12. 'I Made My Own Colour Scheme and You Can Too!'.
    * https://cmcenroe.me/2018/04/03/colour-scheme.html
A few things to note:
* The Windows console (`cmd`) is limited to the 16 so-called 'ANSI' colors but it used to
        have a few of them interverted which makes numbers impractical. Use color names
        instead of numbers: :help cterm-colors
    * The Windows console doesn't do italics, underlines or bolded text;
        it is limited to normal and reverse. Keep that in mind if you want
        your colorscheme to be usable in as many environments as possible by as many
        people as possible.
    * The Windows TERMINAL, however, is capable of more.
* All of the terminal emulators in use these days allow their users to
    change the 16 so-called 'ANSI' colors. It is also possible on some platforms
    to change some or all of the 256 colors in the xterm palette. Don't take
    anything for granted.
* When used against a light background, strong colors work better than muted
    ones. Light or dark doesn't really matters. Also, it is harder to discriminate
    between two similar colors on a light background.
* Both strong and muted colors work well against a dark background. It is also
    easier to work with similar colors, but dark colors don't work at all.
* Use as many text samples as possible. String-heavy languages may look completely
    different than keyword-heavy ones. This can have an impact on the usability
    of your colorscheme.
* Most terminal emulators and terminal multiplexers currently in use on unix-like
    systems support 256 colors but they almost always default to a '$TERM' that tells
    Vim otherwise. Your users will need to make sure their terminal emulator/multiplexer
    is correctly set up if they want to enjoy the best possible experience.
]]
require(vim.g.colors_name)(highlight_group_normal, highlight_groups, terminal_colors)
