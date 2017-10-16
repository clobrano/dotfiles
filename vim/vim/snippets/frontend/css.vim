function! HighlightSnip()
    exec "?${[0-9]:[a-z]*}"
endfunction

iabbr bkg   background: ${1:color} ${2:image} ${3:repeat} ${4:attachment} ${5:position};
iabbr bkgi  background-image: url('${1:image url}');
iabbr brd   border: ${1:width} ${2:style} ${3:color};<esc>:call HighlightSnip()<cr>
iabbr brdt  border-top: ${1:width} ${2:style} ${3:color};
iabbr brdr  border-right: ${1:width} ${2:style} ${3:color};
iabbr brdb  border-bottom: ${1:width} ${2:style} ${3:color};
iabbr brdl  border-left: ${1:width} ${2:style} ${3:color};
iabbr mrg   margin: ${1:top} ${2:right} ${3:bottom} ${4:left};
iabbr pdg   padding: ${1:top} ${2:right} ${3:bottom} ${4:left};
iabbr url   url('${1:url}');
iabbr rgb   rgb('${1:red},${2:green},${3:blue}');
iabbr rgba  rgba('${1:red},${2:green},${3:blue},${4:alpha}');
"
"" css snippets
"" @see http://code.google.com/p/zen-coding/wiki/ZenCSSPropertiesEn
"" @author é—²è€˜ (mail[AT]xianyun.org)
"
iabbr fnt           font:${1:font-style} ${2:font-variant} ${3:font-weight} ${4:font-size} ${5:line-height} ${6:font-family};${7}
iabbr fntf          font-family:${1:Courier,"Courier New"};${2}
iabbr fntvar        font-variant:${1:normal|small-caps};${2}
iabbr fontsize      font-size:${1:xx-small|x-small|small|medium|large|x-large|xx-large|larger|smaller|length};${2}
iabbr fontstyle     font-style:${1:normal|italic|oblique};${2}
iabbr fontweight    font-weight:${1:normal|bold|bolder|lighter};${2}
iabbr txtdec        text-decoration:${1:none|underline|blink|overline|line-through};${2}
iabbr txtund        text-underline-position:${1:below|above};${2}
iabbr txttran       text-transform:${1:none|capitalize|uppercase|lowercase};${2}
"iabbr line-height:${1:normal|length};${2}
"snippet letter-spacing
"iabbr leeter-spacing:${1:normal|length};${2}
"snippet word-spacing
"iabbr word-spacing:${1:normal|length};${2}
"" Text
"snippet text-indent
"iabbr text-indent:${1:length};${2}
"snippet text-overflow
"iabbr text-overflow:${1:clip|ellipsis};${2}
"snippet vertical-align
"iabbr vertical-align:${1:auto|baseline|sub|super|top|text-top|middle|bottom|text-bottom|length};${2}
"snippet valign
"iabbr vertical-align:${1:auto|baseline|sub|super|top|text-top|middle|bottom|text-bottom|length};${2}
"snippet text-align
"iabbr text-align:${1:left|right|center|justify};${2}
"snippet layout-flow
"iabbr layout-flow:${1:horizontal|vertical-ideographic};${2}
"snippet writing-mode
"iabbr writing-mode:${1:lr-tb|tb-rl};${2}
"snippet direction
"iabbr direction:${1:ltr|rtl|inherit};${2}
"snippet unicode-bidi
"iabbr unicode-bidi:${1:normal|bidi-override|embed};${2}
"snippet word-break
"iabbr wrod-break:${1:normal|break-all|keep-all};${2}
"snippet line-break
"iabbr line-break:${1:normal|strict};${2}
"snippet white-space
"iabbr white-space:${1:normal|pre|nowrap};${2}
"snippet word-wrap
"iabbr word-wrap:${1:normal|break-word};${2}
"snippet text-autospace
"iabbr text-autospace:${1:none|ideograph-alpha|ideograph-numeric|ideograph-parenthesis|ideograph-space};${2}
"snippet text-kashida-space
"iabbr text-kashida-space:${1:length|inherit};${2}
"snippet text-justify
"iabbr text-justify:${1:auto|distribute|distribute-all-lines|distribute-center-last|inter-cluster|inter-ideograph|inter-word|kashida|newspaper};${2}
"snippet ruby-align
"iabbr ruby-align:${1:auto|left|center|right|distribute-letter|distribute-space|line-edge};${2}
"snippet ruby-overhang
"iabbr ruby-overhang:${1:auto|whitespace|none};${2}
"snippet ruby-position
"iabbr ruby-position:${1:above|inline};${2}
"snippet ime-mode
"iabbr ime-mode:${1:auot|active|inactive|disabled};${2}
"snippet layout-grid
"iabbr layout-grid:${1:layout-grid-mode} ${2:layout-grid-type} ${3:layout-grid-line} ${4:layout-grid-char};${5}
"snippet layout-grid-char
"iabbr layout-grad-char:${1:none|auto|length};${2}
"snippet layout-grid-line
"iabbr layout-grid-line:${1:none|auto|length};${2}
"snippet layout-grid-mode
"iabbr layout-grid-mode:${1:both|line|char|none};${2}
"snippet layout-grid-fixed
"iabbr layout-grid-fixed:${1:loose|strict|fixed};${2}
"" Background
"snippet background
"iabbr background:${1:transparent} ${2:none} ${3:no-repeat} ${4:scroll};${5}
"snippet bg
"iabbr background:${1:transparent} ${2:none} ${3:no-repeat} ${4:scroll};${5}
"snippet background-att
"iabbr background-attachment:${1:scroll|fixed};${2}
"snippet background-color
"iabbr background-color:${1:transparent};${2}
"snippet bgcolor
"iabbr background-color:${1:transparent};${2}
"snippet background-image
"iabbr background-image:${1:none};${2}
"snippet background-position
"iabbr background-position:${1:top|center|bottom|left|middle|right} ${2:top|center|bottom|left|middle|right};${2}
"snippet background-position-x
"iabbr background-position-x:${1:left|center|right|length};${2}
"snippet background-position-y
"iabbr background-position-y:${1:top|middle|bottom|length};${2}
"snippet background-repeat
"iabbr background-repeat:${1:repeat|no-repeat|repeat-x|repeat-y};${2}
"snippet layer-background-color
"iabbr layer-background-color:${1:transparent};${2}
"snippet layer-background-image
"iabbr layer-background-image:${1:none};${2}
"" Position
"snippet position
"iabbr position:${1:static|absolute|fixed|relative};${2}
"snippet z-index
"iabbr z-index:${1:auto};${2}
"snippet top
"iabbr top:${1:auto};${2}
"snippet right
"iabbr right:${1:auto};${2}
"snippet bottom
"iabbr bottom:${1:auto};${2}
"snippet left
"iabbr left:${1:auto};${2}
"" Dimensions
"snippet height
"iabbr height:${1:auto};${2}
"snippet max-height
"iabbr max-height:${1:none};${2}
"snippet min-height
"iabbr min-height:${1:none};${2}
"snippet width
"iabbr width:${1:auto};${2}
"snippet max-width
"iabbr max-width:${1:auto};${2}
"snippet min-width
"iabbr min-width:${1:auto};${2}
"" Layout
"snippet clear
"iabbr clear:${1:none|left|right|both};${2}
"snippet float
"iabbr float:${1:none|left|right};${2}
"snippet clip
"iabbr clip:${1:auto|rect(number number number number)};${2}
"snippet overflow
"iabbr overflow:${1:visible|auto|hidden|scroll};${2}
"snippet overflow-x
"iabbr overflow-x:${1:visible|auto|hidden|scroll};${2}
"snippet overflow-y
"iabbr overflow-y:${1:visible|auto|hidden|scroll};${2}
"snippet display
"iabbr display:${1:block|none|inline|compact|marker|inline-table|list-item|run-in|table|table-caption|table-cell|table-column|table-column-group|table-footer-group|table-header-group|table-row|table-row-group};${2}
"snippet visiblity
"iabbr visiblity:${1:inherit|visible|collapse|hidden};${2}
"" Margins
"snippet margin
"iabbr margin:${1:auto};${2}
"snippet margin-top
"iabbr margin-top:${1:auto};${2}
"snippet margin-right
"iabbr margin-right:${1:auto};${2}
"snippet margin-bottom
"iabbr margin-bottom:${1:auto};${2}
"snippet margin-left
"iabbr margin-left:${1:auto};${2}
"" Outlines
"snippet outline
"iabbr outline:${1:outline-color} ${2:outline-style} ${3:outline-width};${4}
"snippet outline-color
"iabbr outline-color:${1:invert};${2}
"snippet outline-style
"iabbr outline-style:${1:none|dotted|dashed|solid|double|groove|ridge|inset|outset};${2}
"snippet outline-width
"iabbr outline-width:${1:medium|thin|thick|length};${2}
"" Border
"snippet border
"iabbr border:${1:1px} ${2:solid} ${3:"ccc};${4}
"snippet border-color
"iabbr border-color:${1:"ccc};${2}
"snippet border-style
"iabbr border-style:${1:none|hidden|dotted|dashed|solid|double|groove|ridge|inset|outset};${2}
"snippet border-width
"iabbr border-width:${1:medium|thin|thick|length};${2}
"snippet border-top
"iabbr border-top:${1:1px} ${2:solid} ${3:"ccc};${4}
"snippet border-top-color
"iabbr border-top-color:${1:"ccc};${2}
"snippet border-top-style
"iabbr border-top-style:${1:none|hidden|dotted|dashed|solid|double|groove|ridge|inset|outset};${2}
"snippet border-top-width
"iabbr border-top-width:${1:medium|thin|thick|length};${2}
"snippet border-right
"iabbr border-right:${1:1px} ${2:solid} ${3:"ccc};${4}
"snippet border-right-color
"iabbr border-right-color:${1:"ccc};${2}
"snippet border-right-style
"iabbr border-right-style:${1:none|hidden|dotted|dashed|solid|double|groove|ridge|inset|outset};${2}
"snippet border-right-width
"iabbr border-right-width:${1:medium|thin|thick};${2}
"snippet border-bottom
"iabbr border-bottom:${1:1px} ${2:solid} ${3:"ccc};${2}
"snippet border-bottom-color
"iabbr border-bottom-color:${1:"ccc};${2}
"snippet border-bottom-style
"iabbr border-bottom-style:${1:none|hidden|dotted|dashed|solid|double|groove|ridge|inset|outset};${2}
"snippet border-bottom-width
"iabbr border-bottom-width:${1:medium|thin|thick|length};${2}
"snippet border-left
"iabbr border-left:${1:1px} ${2:solid} "{3:"ccc};${2}
"snippet border-left-color
"iabbr border-left-color:${1:"ccc};${2}
"snippet border-left-style
"iabbr border-left-style:${1:none|hidden|dotted|dashed|solid|double|groove|ridge|inset|outset};${2}
"snippet border-left-width
"iabbr border-left-width:${1:medium|thin|thick|length};${2}
"" Generated Content
"snippet include-source
"iabbr include-source:url(${1:});${2}
"snippet quotes
"iabbr quotes:${1:none|string};${2}
"snippet content
"iabbr content:${1:attr(alt)|counter(name)|counter(name,list-style-type)|counters(name,string)|counters(name,string,list-style-type)|no-close-quote|no-open-quote|close-quote|open-quote|string|url(url)};${2}
"snippet counter-increment
"iabbr counter-increment:${1:none|identifier number};${2}
"snippet counter-reset
"iabbr counter-reset:${1:none|identifier number};${2}
"" Paddings
"snippet padding
"iabbr padding:${1:0};${2}
"snippet padding-top
"iabbr padding-top:${1:0};${2}
"snippet padding-right
"iabbr padding-right:${1:0};${2}
"snippet padding-bottom
"iabbr padding-bottom:${1:0};${2}
"snippet padding-left
"iabbr padding-left:${1:0};${2}
"" Lists
"snippet list-style
"iabbr list-style:${1:none};${2}
"snippet list-style2
"iabbr list-style:${1:disc} ${2:outside} ${3:none};${4}
"snippet list-style-image
"iabbr list-style-image:url(${1:});${2}
"snippet list-style-position
"iabbr list-style-position:${1:outside|inside};${2}
"snippet list-style-type
"iabbr list-style-type:${1:disc|circle|square|decimal|lower-roman|upper-roman|lower-alpha|upper-alpha|none|armenian|cjk-ideographic|georgian|lower-greek|hebrew|hiragana|hiragana-iroha|katakana|katakana-iroha|lower-latin|upper-latin};${2}
"snippet marker-offset
"iabbr marker-offset:${1:auto};${2}
"" Table
"snippet border-collapse
"iabbr border-collapse:${1:collapse};${2}
"snippet border-spacing
"iabbr border-spacing:${1:0};${2}
"snippet caption-side
"iabbr caption-side:${1:top|right|bottom|left};${2}
"snippet empty-cells
"iabbr empty-cells:${1:show|hide};${2}
"snippet table-layout
"iabbr table-layout:${1:auto|fixed};${2}
"snippet speak-header
"iabbr speak-header:${1:once|always};${2}
"" Scrollbar
"snippet scrollbar
"iabbr scrollbar-base-color:${1:"ccc};
"iabbr scrollbar-face-color:${2:"f6f6f6};
"iabbr scrollbar-highlight-color:${3:"fff};
"iabbr scrollbar-shadow-color:${4:"ccc;}
"iabbr scrollbar-3dlight-color:${5:"ccc};
"iabbr scrollbar-arrow-color:${6:"300};
"iabbr scrollbar-track-color:${7:"f6f6f6};
"iabbr scrollbar-darkshadow-color:${8:"fff};${9}
"" Printing
"snippet page
"iabbr page:${1:auto|pagetype};${2}
"snippet page-brake-after
"iabbr page-break-after:${1:auto|always|avoid|left|right|null};${2}
"snippet page-break-before
"iabbr page-break-before:${1:auto|always|avoid|left|right|null};${2}
"snippet page-break-inside
"iabbr page-break-inside:${1:auto|avoid};${2}
"snippet marks
"iabbr marks:${1:none|crop|cross};${2}
"snippet orphans
"iabbr orphans:${1:0};${2}
"snippet size
"iabbr size:${1:auto|portrait|landscape|langth};${2}
"snippet windows
"iabbr windows:${1:0};${2}
"" Aural
"snippet voice-family
"iabbr voice-family:${1:child|female|male|name};${2}
"snippet volume
"iabbr volume:${1:silent|x-soft|soft|medium|x-loud|number};${2}
"snippet elevation
"iabbr elevation:${1:below|level|above|lower|higher|angle};${2}
"snippet azimuth
"iabbr azimuth:${1:left-side|far-left|left|center-left|center|center-right|right|far-right|right-side|leftwards|rightwards|angle};${2}
"snippet stress
"iabbr stress:${1:50};${2}
"snippet richness
"iabbr richness:${1:50};${2}
"snippet speech-rate
"iabbr speech-rate:${1:x-slow|slow|medium|fast|x-fast|slower|faster|number};${2}
"snippet cue
"iabbr cue:${1:cue-before} ${2:cue-after};${3}
"snippet cue-after
"iabbr cue-after:url(${1:none});${2}
"snippet cue-before
"iabbr cue-before:url(${1:none});${2}
"snippet pause
"iabbr pause:${1:1s} ${2:1s};${3}
"snippet pause-after
"iabbr pause-after:${1:1s};${2}
"snippet pause-before
"iabbr pause-before:${1:1s};${2}
"snippet pitch
"iabbr pitch:${1:x-low|low|medium|hight|x-hight|number};${2}
"snippet pitch-range
"iabbr pitch-range:${1:50};${2}
"snippet play-during
"iabbr play-during:${1:url()|mix|repeat|auto|none};${2}
"snippet speak
"iabbr speak:${1:normal|none|spell-out};${2}
"snippet speak-numeral
"iabbr speak-numeral:${1:continuous|digits};${2}
"snippet speak-punctuation
"iabbr speak-punctuation:${1:none|code};${2}
"" Classification
"snippet cursor
"iabbr cursor:${1:auto|all-scroll|col-resize|crosshair|default|hand|move|help|no-drop|not-allowed|pointer|progress|row-resize|text|vertical-text|wait|*-resize|url(url)};${2}
"snippet behavior
"iabbr behavior:url(${1:url|"objID|"default"behaviorName});${2}
"snippet filter
"iabbr filter:${1:filter};${2}
"snippet zoom
"iabbr zoom:${1:normal|number};${2}
"" Common
"snippet @i
"iabbr @import:url(${1});${2}
"snippet a
"iabbr a{${1}}
"iabbr a:link{${2}}
"iabbr a:visited{${3}}
"iabbr a:hover{${4}}
"iabbr a:active{${5}}${6}
"snippet !
"iabbr !important
"snippet wrap
"iabbr white-space:pre-wrap; white-space:-moz-pre-wrap; white-space:-pre-wrap; white-space:-o-pre-wrap; word-wrap:break-word; word-break:normal;${1}
"snippet nowrap
"iabbr white-space:${1:nowrap};${2}
"snippet break
"iabbr wrod-break:${1:break-all};${2}
"snippet border2
"iabbr border-width:${1:0}; border-style:${2:solid}; border-color:${3:"ccc};${4}
"snippet radius
"iabbr -moz-border-radius:${1:4px}; -khtml-border-radius:$1; -webkit-border-radius:$1; border-radius:$1;${2}
"snippet radius4
"iabbr -moz-border-radius:${1:4px} ${2:$1} ${3:$1} ${4:$1};
"iabbr -khtml-border-radius:$1 $2 $3 $4;
"iabbr -webkit-border-top-left-radius:$1; -webkit-border-top-right-radius:$2;
"iabbr -webkit-border-bottom-right-radius:$3; -webkit-border-bottom-left-radius:$4;
"iabbr  border-radius:$1 $2 $3 $4;${5}
"snippet radius44
"iabbr -moz-border-radius-topleft:${1:4px}; -moz-border-radius-topright:${2:$1};
"iabbr -moz-border-radius-bottomright:${3:$1}; -moz-border-radius-bottomleft:${4:$1};
"iabbr -khtml-border-radius:$1 $2 $3 $4;
"iabbr -webkit-border-top-left-radius:$1; -webkit-border-top-right-radius:$2;
"iabbr -webkit-border-bottom-right-radius:$3; -webkit-border-bottom-left-radius:$4;
"iabbr  border-radius:$1 $2 $3 $4;${5}
"snippet opacity
"iabbr -moz-opacity:${1:.5}; opacity:$1; -ms-filter:"alpha(opacity=${2:$1*100})"; filter:alpha(opacity=$2); zoom:1;${3}
"snippet touming
"iabbr opacity
"snippet transform
"iabbr -moz-transform:rotate(${1:180}deg); -webkit-transform:rotate($1deg); -o-transform:rotate($1deg); transform:rotate($1deg);
"snippet transform-origin
"iabbr -moz-transform-origin:${1:50% 20%}; -webkit-transform-origin:$1; -o-transform-origin:$1; transform-origin:$1;
"snippet transition
"iabbr -moz-transition:-moz-${1:transform 0.2s ease-in}; -webkit-transition:-webkit-$1; -o-transition:-o-$1; transition:$1;
"snippet border
"iabbr border-width:${1:1px}; border-style:${2:solid}; border-color:${3:"ccc};
"snippet min-height-hack
"iabbr min-height:${1:8em}; height:auto;
"iabbr ${2}
"iabbr /* for Internet Explorer */
"iabbr /*\*/
"iabbr * html ${3:selector} {
"iabbr     height:${4:$1};
"iabbr }
"iabbr /**/
"iabbr /* min height end */${5}
"snippet clearfix
"iabbr ${1:.clearfix}:after{content:"\0020"; display:block; height:0; clear:both;}
"iabbr $1{zoom:1;}
"
