" Originally was
" ==============
" Vim syntax file
" Language:	Sass
" Maintainer:	Tim Pope <vimNOSPAM@tpope.org>
" Filenames:	*.sass
" Last Change:	2010 Aug 09
"=============================================

" Vim syntax file
" Language:	less
" Maintainer:	Alessandro Vioni <jenoma@gmail.com>
" Filenames:	*.less

if exists("b:current_syntax")
  finish
endif

runtime! syntax/css.vim

syn case ignore

syn cluster lessCssProperties contains=cssFontProp,cssFontDescriptorProp,cssColorProp,cssTextProp,cssBoxProp,cssGeneratedContentProp,cssPagingProp,cssUIProp,cssRenderProp,cssAuralProp,cssTableProp
syn cluster lessCssAttributes contains=css.*Attr,lessEndOfLineComment,lessComment,cssValue.*,cssColor,cssURL,lessDefault,cssImportant,cssError,cssStringQ,cssStringQQ,cssFunction,cssUnicodeEscape,cssRenderProp

syn region lessDefinition matchgroup=cssBraces start="{" end="}" contains=TOP,cssTagName,cssDeprecated

syn match lessProperty "\%([{};]\s*\|^\)\@<=\%([[:alnum:]-]\|#{[^{}]*}\)\+\s*:" contains=css.*Prop skipwhite nextgroup=lessCssAttribute contained containedin=lessDefinition
syn match lessProperty "^\s*\zs\s\%(\%([[:alnum:]-]\|#{[^{}]*}\)\+\s*:\|:[[:alnum:]-]\+\)"hs=s+1 contains=css.*Prop skipwhite nextgroup=lessCssAttribute
syn match lessProperty "^\s*\zs\s\%(:\=[[:alnum:]-]\+\s*=\)"hs=s+1 contains=css.*Prop skipwhite nextgroup=lessCssAttribute
syn match lessCssAttribute +\%("\%([^"]\|\\"\)*"\|'\%([^']\|\\'\)*'\|#{[^{}]*}\|[^{};]\)*+ contained contains=@lessCssAttributes,lessVariable,lessFunction,lessInterpolation
syn match lessDefault "!default\>" contained

" syn match lessVariable "!\%(important\>\|default\>\)\@![[:alnum:]_-]\+"

syn match lessVariable "@[[:alnum:]_-]\+" nextgroup=lessCssAttribute skipwhite
syn match lessMedia "@media" nextgroup=lessCssAttribute skipwhite

" syn match lessVariableAssignment ":" nextgroup=lessCssAttribute skipwhite
" syn match lessVariableAssignment "\%([!$][[:alnum:]_-]\+\s*\)\@<=:" nextgroup=lessCssAttribute skipwhite

" syn match lessFunction "\<\%(rgb\|rgba\|red\|green\|blue\|mix\)\>(\@=" contained
" syn match lessFunction "\<\%(hsl\|hsla\|hue\|saturation\|lightness\|adjust-hue\|lighten\|darken\|saturate\|desaturate\|grayscale\|complement\)\>(\@=" contained
" syn match lessFunction "\<\%(alpha\|opacity\|rgba\|opacify\|fade-in\|transparentize\|fade-out\)\>(\@=" contained
" syn match lessFunction "\<\%(unquote\|quote\)\>(\@=" contained
" syn match lessFunction "\<\%(percentage\|round\|ceil\|floor\|abs\)\>(\@=" contained
" syn match lessFunction "\<\%(type-of\|unit\|unitless\|comparable\)\>(\@=" contained

" TODO: FIX behavior with cssTagName and cssDeprecated:
" div { font-size: 10px; } on one line is identified as
" a cssDeprecated element. There i removed font as a deprecated
" element and as a tag name

"Override lessTagNames
" All HTML4 tags
syn keyword lessTagName abbr acronym address applet area a b base
syn keyword lessTagName basefont bdo big blockquote body br button
syn keyword lessTagName caption center cite code col colgroup dd del
syn keyword lessTagName dfn dir div dl dt em fieldset form frame
syn keyword lessTagName frameset h1 h2 h3 h4 h5 h6 head hr html img i
syn keyword lessTagName iframe img input ins isindex kbd label legend li
syn keyword lessTagName link map menu meta noframes noscript ol optgroup
syn keyword lessTagName option p param pre q s samp script select small
syn keyword lessTagName span strike strong style sub sup table tbody td
syn keyword lessTagName textarea tfoot th thead title tr tt ul u var
syn keyword lessTagName object svg

" 34 HTML5 tags
syn keyword lessTagName article aside audio bdi canvas command data
syn keyword lessTagName datalist details dialog embed figcaption figure footer
syn keyword lessTagName header hgroup keygen main mark menuitem meter nav
syn keyword lessTagName output progress rt rp ruby section
syn keyword lessTagName source summary time track video wbr

" Tags not supported in HTML5
syn keyword lessDeprecated acronym applet basefont big center dir
syn keyword lessDeprecated frame frameset noframes strike tt

syn keyword lessFunction escape e % containedin=lessDefinition contained
syn keyword lessFunction unit containedin=lessDefinition contained
syn keyword lessFunction ceil floor percentage round sqrt abs sin asin cos acos tan atan pi pow mod min max containedin=lessDefinition contained
syn keyword lessFunction rgb rgba argb hsl hsla hsv hsva containedin=lessDefinition contained
syn keyword lessFunction hue saturation lightness red green blue alpha luma containedin=lessDefinition contained
syn keyword lessFunction saturate desaturate lighten darken fadein fadeout fade spin mix greyscale contrast containedin=lessDefinition contained
syn keyword lessFunction multiply screen overlay softlight hardlight difference exclusion average negation containedin=lessDefinition contained

" syn region lessInterpolation matchgroup=lessInterpolationDelimiter start="#{" end="}" contains=@lessCssAttributes,lessVariable,lessFunction containedin=cssStringQ,cssStringQQ,cssPseudoClass,lessProperty

" syn match lessMixinName "[[:alnum:]_-]\+" contained nextgroup=lessCssAttribute
" syn match lessMixin  "^="               nextgroup=lessMixinName skipwhite
" syn match lessMixin  "\%([{};]\s*\|^\s*\)\@<=@mixin"   nextgroup=lessMixinName skipwhite
" syn match lessMixing "^\s\+\zs+"        nextgroup=lessMixinName
" syn match lessMixing "\%([{};]\s*\|^\s*\)\@<=@include" nextgroup=lessMixinName skipwhite
" syn match lessExtend "\%([{};]\s*\|^\s*\)\@<=@extend"
" syn match lessPlaceholder "\%([{};]\s*\|^\s*\)\@<=%"   nextgroup=lessMixinName skipwhite
"
" syn match lessFunctionName "[[:alnum:]_-]\+" contained nextgroup=lessCssAttribute
" syn match lessFunctionDecl "\%([{};]\s*\|^\s*\)\@<=@function"   nextgroup=lessFunctionName skipwhite
" syn match lessReturn "\%([{};]\s*\|^\s*\)\@<=@return"

syn match lessEscape     "^\s*\zs\\"
syn match lessIdChar     "#[[:alnum:]_-]\@=" nextgroup=lessId,lessClassIdCall
syn match lessId         "[[:alnum:]_-]\+" contained
syn match lessClassIdCall  "[[:alnum:]_-]\+()" contained

syn match lessClassChar  "\.[[:alnum:]_-]\@=" nextgroup=lessClass,lessClassCall
syn match lessClass      "[[:alnum:]_-]\+" contained
syn match lessClassCall  "[[:alnum:]_-]\+()" contained


syn match lessAmpersand  "&" contains=lessIdChar,lessClassChar

syn region lessInclude start="@import" end=";\|$" contains=lessComment,cssURL,cssUnicodeEscape,cssMediaType,cssStringQ,cssStringQQ

" syn region lessDebugLine end=";\|$" matchgroup=lessDebug start="@debug\>" contains=@lessCssAttributes,lessVariable,lessFunction
" syn region lessWarnLine end=";\|$" matchgroup=lessWarn start="@warn\>" contains=@lessCssAttributes,lessVariable,lessFunction
" syn region lessControlLine matchgroup=lessControl start="@\%(if\|else\%(\s\+if\)\=\|while\|for\|each\)\>" end="[{};]\@=\|$" contains=lessFor,@lessCssAttributes,lessVariable,lessFunction
" syn keyword lessFor from to through in contained

syn keyword lessTodo        FIXME NOTE TODO OPTIMIZE XXX contained
syn region  lessComment     start="^\z(\s*\)//"  end="^\%(\z1 \)\@!" contains=lessTodo,@Spell
syn region  lessCssComment  start="^\z(\s*\)/\*" end="^\%(\z1 \)\@!" contains=lessTodo,@Spell
syn match   lessEndOfLineComment "//.*" contains=lessComment,lessTodo,@Spell

hi def link lessEndOfLineComment        lessComment
hi def link lessCssComment              lessComment
hi def link lessComment                 Comment
hi def link lessDefault                 cssImportant
hi def link lessVariable                Identifier
hi def link lessFunction                PreProc
" hi def link lessMixing                  PreProc
" hi def link lessMixin                   PreProc
" hi def link lessPlaceholder             PreProc
" hi def link lessExtend                  PreProc
" hi def link lessFunctionDecl            PreProc
" hi def link lessReturn                  PreProc
hi def link lessTodo                    Todo
hi def link lessInclude                 Include
" hi def link lessDebug                   lessControl
" hi def link lessWarn                    lessControl
" hi def link lessControl                 PreProc
" hi def link lessFor                     PreProc
hi def link lessEscape                  Special
hi def link lessIdChar                  Special
hi def link lessClassChar               Special
" hi def link lessInterpolationDelimiter  Delimiter
hi def link lessAmpersand               Character
hi def link lessId                      Identifier
hi def link lessClass                   Type
hi def link lessCssAttribute            PreProc

hi def link lessClassCall               Type
hi def link lessClassIdCall             type

hi def link lessTagName                 cssTagName
hi def link lessDeprecated              cssDeprecated

hi def link lessMedia                   cssMedia

let b:current_syntax = "less"

" vim:set sw=2:
