# File saved with Nlview 6.8.5  2018-01-30 bk=1.4354 VDI=40 GEI=35 GUI=JA:1.6 TLS
# 
# non-default properties - (restore without -noprops)
property attrcolor #000000
property attrfontsize 8
property autobundle 1
property backgroundcolor #ffffff
property boxcolor0 #000000
property boxcolor1 #000000
property boxcolor2 #000000
property boxinstcolor #000000
property boxpincolor #000000
property buscolor #008000
property closeenough 5
property createnetattrdsp 2048
property decorate 1
property elidetext 40
property fillcolor1 #ffffcc
property fillcolor2 #dfebf8
property fillcolor3 #f0f0f0
property gatecellname 2
property instattrmax 30
property instdrag 15
property instorder 1
property marksize 12
property maxfontsize 12
property maxzoom 5
property netcolor #19b400
property objecthighlight0 #ff00ff
property objecthighlight1 #ffff00
property objecthighlight2 #00ff00
property objecthighlight3 #ff6666
property objecthighlight4 #0000ff
property objecthighlight5 #ffc800
property objecthighlight7 #00ffff
property objecthighlight8 #ff00ff
property objecthighlight9 #ccccff
property objecthighlight10 #0ead00
property objecthighlight11 #cefc00
property objecthighlight12 #9e2dbe
property objecthighlight13 #ba6a29
property objecthighlight14 #fc0188
property objecthighlight15 #02f990
property objecthighlight16 #f1b0fb
property objecthighlight17 #fec004
property objecthighlight18 #149bff
property objecthighlight19 #eb591b
property overlapcolor #19b400
property pbuscolor #000000
property pbusnamecolor #000000
property pinattrmax 20
property pinorder 2
property pinpermute 0
property portcolor #000000
property portnamecolor #000000
property ripindexfontsize 8
property rippercolor #000000
property rubberbandcolor #000000
property rubberbandfontsize 12
property selectattr 0
property selectionappearance 2
property selectioncolor #0000ff
property sheetheight 44
property sheetwidth 68
property showmarks 1
property shownetname 0
property showpagenumbers 1
property showripindex 4
property timelimit 1
#
module new lab1_top work:lab1_top:NOFILE -nosplit
load symbol RTL_INV work INV pinBus I0 input [7:0] pinBus O output [7:0] fillcolor 1
load symbol RTL_MUX2 work MUX pin S input.bot pinBus I0 input.left [7:0] pinBus I1 input.left [7:0] pinBus O output.right [7:0] fillcolor 1
load symbol RTL_MUX work MUX pin S input.bot pinBus I0 input.left [3:0] pinBus I1 input.left [3:0] pinBus O output.right [3:0] fillcolor 1
load symbol seg7_hex work:seg7_hex:NOFILE HIERBOX pinBus digit input.left [3:0] pinBus seg7 output.right [7:0] boxcolor 1 fillcolor 2 minwidth 13%
load symbol OBUF hdi_primitives[15:0] BUF pinBus O output [15:0] pinBus I input [15:0] fillcolor 1 sandwich 3 prop @bundle 16
load symbol IBUF hdi_primitives[15:0] BUF pinBus O output [15:0] pinBus I input [15:0] fillcolor 1 sandwich 3 prop @bundle 16
load port BTNU input -pg 1 -y 130
load port BTNC input -pg 1 -y 340
load port BTND input -pg 1 -y 290
load portBus AN output [7:0] -attr @name AN[7:0] -pg 1 -y 60
load portBus SEG7_CATH output [7:0] -attr @name SEG7_CATH[7:0] -pg 1 -y 280
load portBus LED output [15:0] -attr @name LED[15:0] -pg 1 -y 180
load portBus SW input [15:0] -attr @name SW[15:0] -pg 1 -y 210
load inst SW[15:0]_IBUF_inst IBUF hdi_primitives[15:0] -attr @cell(#000000) IBUF -pg 1 -lvl 1 -y 210
load inst seg7_hex_1 seg7_hex work:seg7_hex:NOFILE -autohide -attr @cell(#000000) seg7_hex -pinBusAttr digit @name digit[3:0] -pinBusAttr seg7 @name seg7[7:0] -pg 1 -lvl 5 -y 270
load inst LED[15:0]_OBUF_inst OBUF hdi_primitives[15:0] -attr @cell(#000000) OBUF -pg 1 -lvl 5 -y 180
load inst AN_i__0 RTL_MUX2 work -attr @cell(#000000) RTL_MUX -pinBusAttr I0 @name I0[7:0] -pinBusAttr I0 @attr V=B\"00001111\",\ S=1'b1 -pinBusAttr I1 @name I1[7:0] -pinBusAttr I1 @attr S=default -pinBusAttr O @name O[7:0] -pg 1 -lvl 4 -y 70
load inst AN_i__1 RTL_MUX2 work -attr @cell(#000000) RTL_MUX -pinBusAttr I0 @name I0[7:0] -pinBusAttr I0 @attr S=1'b1 -pinBusAttr I1 @name I1[7:0] -pinBusAttr I1 @attr S=default -pinBusAttr O @name O[7:0] -pg 1 -lvl 5 -y 60
load inst AN0_i RTL_INV work -attr @cell(#000000) RTL_INV -pinBusAttr I0 @name I0[7:0] -pinBusAttr O @name O[7:0] -pg 1 -lvl 2 -y 240
load inst AN_i RTL_MUX2 work -attr @cell(#000000) RTL_MUX -pinBusAttr I0 @name I0[7:0] -pinBusAttr I0 @attr V=B\"11110000\",\ S=1'b1 -pinBusAttr I1 @name I1[7:0] -pinBusAttr I1 @attr S=default -pinBusAttr O @name O[7:0] -pg 1 -lvl 3 -y 230
load inst digit_i RTL_MUX work -attr @cell(#000000) RTL_MUX -pinBusAttr I0 @name I0[3:0] -pinBusAttr I0 @attr S=1'b0 -pinBusAttr I1 @name I1[3:0] -pinBusAttr I1 @attr S=default -pinBusAttr O @name O[3:0] -pg 1 -lvl 4 -y 280
load net AN[1] -attr @rip O[1] -port AN[1] -pin AN_i__1 O[1]
load net AN_i_n_5 -attr @rip O[2] -pin AN_i O[2] -pin AN_i__0 I1[2]
load net LED[12] -attr @rip 12 -port LED[12] -pin LED[15:0]_OBUF_inst O[12]
load net SEG7_CATH[5] -attr @rip seg7[5] -port SEG7_CATH[5] -pin seg7_hex_1 seg7[5]
load net AN_i_n_6 -attr @rip O[1] -pin AN_i O[1] -pin AN_i__0 I1[1]
load net AN0[1] -attr @rip O[1] -pin AN0_i O[1] -pin AN_i I1[1]
load net SEG7_CATH[0] -attr @rip seg7[0] -port SEG7_CATH[0] -pin seg7_hex_1 seg7[0]
load net LED[3] -attr @rip 3 -port LED[3] -pin LED[15:0]_OBUF_inst O[3]
load net AN_i_n_7 -attr @rip O[0] -pin AN_i O[0] -pin AN_i__0 I1[0]
load net SW_IBUF[1] -attr @rip 1 -pin LED[15:0]_OBUF_inst I[1] -pin SW[15:0]_IBUF_inst O[1] -pin digit_i I0[1]
load net digit[2] -attr @rip O[2] -pin digit_i O[2] -pin seg7_hex_1 digit[2]
load net AN0[7] -attr @rip O[7] -pin AN0_i O[7] -pin AN_i I1[7]
load net SW[1] -attr @rip SW[1] -port SW[1] -pin SW[15:0]_IBUF_inst I[1]
load net SW_IBUF[9] -attr @rip 5 -pin AN0_i I0[5] -pin LED[15:0]_OBUF_inst I[9] -pin SW[15:0]_IBUF_inst O[9]
load net AN[2] -attr @rip O[2] -port AN[2] -pin AN_i__1 O[2]
load net SW[8] -attr @rip SW[8] -port SW[8] -pin SW[15:0]_IBUF_inst I[8]
load net digit[1] -attr @rip O[1] -pin digit_i O[1] -pin seg7_hex_1 digit[1]
load net AN0[2] -attr @rip O[2] -pin AN0_i O[2] -pin AN_i I1[2]
load net SW_IBUF[13] -pin LED[15:0]_OBUF_inst I[13] -pin SW[15:0]_IBUF_inst O[13]
load net LED[15] -attr @rip 15 -port LED[15] -pin LED[15:0]_OBUF_inst O[15]
load net SW[12] -attr @rip SW[12] -port SW[12] -pin SW[15:0]_IBUF_inst I[12]
load net LED[6] -attr @rip 6 -port LED[6] -pin LED[15:0]_OBUF_inst O[6]
load net SW_IBUF[10] -attr @rip 6 -pin AN0_i I0[6] -pin LED[15:0]_OBUF_inst I[10] -pin SW[15:0]_IBUF_inst O[10]
load net <const1> -power -pin AN_i I0[7] -pin AN_i I0[6] -pin AN_i I0[5] -pin AN_i I0[4] -pin AN_i__0 I0[3] -pin AN_i__0 I0[2] -pin AN_i__0 I0[1] -pin AN_i__0 I0[0]
load net SW[9] -attr @rip SW[9] -port SW[9] -pin SW[15:0]_IBUF_inst I[9]
load net LED[14] -attr @rip 14 -port LED[14] -pin LED[15:0]_OBUF_inst O[14]
load net SEG7_CATH[7] -attr @rip seg7[7] -port SEG7_CATH[7] -pin seg7_hex_1 seg7[7]
load net SW[6] -attr @rip SW[6] -port SW[6] -pin SW[15:0]_IBUF_inst I[6]
load net SW_IBUF[3] -attr @rip 3 -pin LED[15:0]_OBUF_inst I[3] -pin SW[15:0]_IBUF_inst O[3] -pin digit_i I0[3]
load net SW_IBUF[7] -attr @rip 3 -pin AN0_i I0[3] -pin LED[15:0]_OBUF_inst I[7] -pin SW[15:0]_IBUF_inst O[7]
load net LED[5] -attr @rip 5 -port LED[5] -pin LED[15:0]_OBUF_inst O[5]
load net LED[0] -attr @rip 0 -port LED[0] -pin LED[15:0]_OBUF_inst O[0]
load net AN[0] -attr @rip O[0] -port AN[0] -pin AN_i__1 O[0]
load net SEG7_CATH[2] -attr @rip seg7[2] -port SEG7_CATH[2] -pin seg7_hex_1 seg7[2]
load net SW[11] -attr @rip SW[11] -port SW[11] -pin SW[15:0]_IBUF_inst I[11]
load net AN0[0] -attr @rip O[0] -pin AN0_i O[0] -pin AN_i I1[0]
load net SW_IBUF[0] -attr @rip 0 -pin LED[15:0]_OBUF_inst I[0] -pin SW[15:0]_IBUF_inst O[0] -pin digit_i I0[0]
load net SEG7_CATH[1] -attr @rip seg7[1] -port SEG7_CATH[1] -pin seg7_hex_1 seg7[1]
load net digit[3] -attr @rip O[3] -pin digit_i O[3] -pin seg7_hex_1 digit[3]
load net SW_IBUF[15] -pin LED[15:0]_OBUF_inst I[15] -pin SW[15:0]_IBUF_inst O[15]
load net SW[7] -attr @rip SW[7] -port SW[7] -pin SW[15:0]_IBUF_inst I[7]
load net BTNC -pin AN_i__1 S -port BTNC -pin digit_i S
netloc BTNC 1 0 5 NJ 340 NJ 340 NJ 340 NJ N 1130
load net SW[14] -attr @rip SW[14] -port SW[14] -pin SW[15:0]_IBUF_inst I[14]
load net SW[4] -attr @rip SW[4] -port SW[4] -pin SW[15:0]_IBUF_inst I[4]
load net SW_IBUF[12] -pin LED[15:0]_OBUF_inst I[12] -pin SW[15:0]_IBUF_inst O[12]
load net LED[8] -attr @rip 8 -port LED[8] -pin LED[15:0]_OBUF_inst O[8]
load net BTND -pin AN_i S -port BTND
netloc BTND 1 0 3 NJ 290 NJ 290 NJ
load net AN[6] -attr @rip O[6] -port AN[6] -pin AN_i__1 O[6]
load net AN[5] -attr @rip O[5] -port AN[5] -pin AN_i__1 O[5]
load net AN0[5] -attr @rip O[5] -pin AN0_i O[5] -pin AN_i I1[5]
load net SEG7_CATH[4] -attr @rip seg7[4] -port SEG7_CATH[4] -pin seg7_hex_1 seg7[4]
load net LED[11] -attr @rip 11 -port LED[11] -pin LED[15:0]_OBUF_inst O[11]
load net SW[13] -attr @rip SW[13] -port SW[13] -pin SW[15:0]_IBUF_inst I[13]
load net SW_IBUF[5] -attr @rip 1 -pin AN0_i I0[1] -pin LED[15:0]_OBUF_inst I[5] -pin SW[15:0]_IBUF_inst O[5]
load net LED[2] -attr @rip 2 -port LED[2] -pin LED[15:0]_OBUF_inst O[2]
load net LED[7] -attr @rip 7 -port LED[7] -pin LED[15:0]_OBUF_inst O[7]
load net SW[5] -attr @rip SW[5] -port SW[5] -pin SW[15:0]_IBUF_inst I[5]
load net SW_IBUF[2] -attr @rip 2 -pin LED[15:0]_OBUF_inst I[2] -pin SW[15:0]_IBUF_inst O[2] -pin digit_i I0[2]
load net LED[10] -attr @rip 10 -port LED[10] -pin LED[15:0]_OBUF_inst O[10]
load net AN0[6] -attr @rip O[6] -pin AN0_i O[6] -pin AN_i I1[6]
load net SW_IBUF[8] -attr @rip 4 -pin AN0_i I0[4] -pin LED[15:0]_OBUF_inst I[8] -pin SW[15:0]_IBUF_inst O[8]
load net SEG7_CATH[3] -attr @rip seg7[3] -port SEG7_CATH[3] -pin seg7_hex_1 seg7[3]
load net LED[1] -attr @rip 1 -port LED[1] -pin LED[15:0]_OBUF_inst O[1]
load net digit[0] -attr @rip O[0] -pin digit_i O[0] -pin seg7_hex_1 digit[0]
load net SW[2] -attr @rip SW[2] -port SW[2] -pin SW[15:0]_IBUF_inst I[2]
load net AN[3] -attr @rip O[3] -port AN[3] -pin AN_i__1 O[3]
load net AN_i__0_n_0 -attr @rip O[7] -pin AN_i__0 O[7] -pin AN_i__1 I1[7]
load net AN_i__0_n_1 -attr @rip O[6] -pin AN_i__0 O[6] -pin AN_i__1 I1[6]
load net AN0[3] -attr @rip O[3] -pin AN0_i O[3] -pin AN_i I1[3]
load net SW_IBUF[14] -pin LED[15:0]_OBUF_inst I[14] -pin SW[15:0]_IBUF_inst O[14]
load net AN_i__0_n_2 -attr @rip O[5] -pin AN_i__0 O[5] -pin AN_i__1 I1[5]
load net <const0> -ground -pin AN_i I0[3] -pin AN_i I0[2] -pin AN_i I0[1] -pin AN_i I0[0] -pin AN_i__0 I0[7] -pin AN_i__0 I0[6] -pin AN_i__0 I0[5] -pin AN_i__0 I0[4] -pin AN_i__1 I0[7] -pin AN_i__1 I0[6] -pin AN_i__1 I0[5] -pin AN_i__1 I0[4] -pin AN_i__1 I0[3] -pin AN_i__1 I0[2] -pin AN_i__1 I0[1] -pin AN_i__1 I0[0] -pin digit_i I1[3] -pin digit_i I1[2] -pin digit_i I1[1] -pin digit_i I1[0]
load net AN_i_n_0 -attr @rip O[7] -pin AN_i O[7] -pin AN_i__0 I1[7]
load net AN_i__0_n_3 -attr @rip O[4] -pin AN_i__0 O[4] -pin AN_i__1 I1[4]
load net SW[3] -attr @rip SW[3] -port SW[3] -pin SW[15:0]_IBUF_inst I[3]
load net SW_IBUF[11] -attr @rip 7 -pin AN0_i I0[7] -pin LED[15:0]_OBUF_inst I[11] -pin SW[15:0]_IBUF_inst O[11]
load net LED[13] -attr @rip 13 -port LED[13] -pin LED[15:0]_OBUF_inst O[13]
load net AN_i_n_1 -attr @rip O[6] -pin AN_i O[6] -pin AN_i__0 I1[6]
load net AN_i__0_n_4 -attr @rip O[3] -pin AN_i__0 O[3] -pin AN_i__1 I1[3]
load net SEG7_CATH[6] -attr @rip seg7[6] -port SEG7_CATH[6] -pin seg7_hex_1 seg7[6]
load net AN_i_n_2 -attr @rip O[5] -pin AN_i O[5] -pin AN_i__0 I1[5]
load net AN_i__0_n_5 -attr @rip O[2] -pin AN_i__0 O[2] -pin AN_i__1 I1[2]
load net AN[4] -attr @rip O[4] -port AN[4] -pin AN_i__1 O[4]
load net SW[15] -attr @rip SW[15] -port SW[15] -pin SW[15:0]_IBUF_inst I[15]
load net SW_IBUF[6] -attr @rip 2 -pin AN0_i I0[2] -pin LED[15:0]_OBUF_inst I[6] -pin SW[15:0]_IBUF_inst O[6]
load net BTNU -pin AN_i__0 S -port BTNU
netloc BTNU 1 0 4 NJ 130 NJ 130 NJ 130 NJ
load net LED[9] -attr @rip 9 -port LED[9] -pin LED[15:0]_OBUF_inst O[9]
load net AN_i_n_3 -attr @rip O[4] -pin AN_i O[4] -pin AN_i__0 I1[4]
load net AN_i__0_n_6 -attr @rip O[1] -pin AN_i__0 O[1] -pin AN_i__1 I1[1]
load net LED[4] -attr @rip 4 -port LED[4] -pin LED[15:0]_OBUF_inst O[4]
load net SW[10] -attr @rip SW[10] -port SW[10] -pin SW[15:0]_IBUF_inst I[10]
load net AN0[4] -attr @rip O[4] -pin AN0_i O[4] -pin AN_i I1[4]
load net AN_i_n_4 -attr @rip O[3] -pin AN_i O[3] -pin AN_i__0 I1[3]
load net SW[0] -attr @rip SW[0] -port SW[0] -pin SW[15:0]_IBUF_inst I[0]
load net AN[7] -attr @rip O[7] -port AN[7] -pin AN_i__1 O[7]
load net AN_i__0_n_7 -attr @rip O[0] -pin AN_i__0 O[0] -pin AN_i__1 I1[0]
load net SW_IBUF[4] -attr @rip 0 -pin AN0_i I0[0] -pin LED[15:0]_OBUF_inst I[4] -pin SW[15:0]_IBUF_inst O[4]
load netBundle @SEG7_CATH 8 SEG7_CATH[7] SEG7_CATH[6] SEG7_CATH[5] SEG7_CATH[4] SEG7_CATH[3] SEG7_CATH[2] SEG7_CATH[1] SEG7_CATH[0] -autobundled
netbloc @SEG7_CATH 1 5 1 NJ
load netBundle @LED 16 LED[15] LED[14] LED[13] LED[12] LED[11] LED[10] LED[9] LED[8] LED[7] LED[6] LED[5] LED[4] LED[3] LED[2] LED[1] LED[0] -autobundled
netbloc @LED 1 5 1 NJ
load netBundle @AN_i_n_0,AN_i_n_1,AN_i_n_2 8 AN_i_n_0 AN_i_n_1 AN_i_n_2 AN_i_n_3 AN_i_n_4 AN_i_n_5 AN_i_n_6 AN_i_n_7 -autobundled
netbloc @AN_i_n_0,AN_i_n_1,AN_i_n_2 1 3 1 770
load netBundle @digit 4 digit[3] digit[2] digit[1] digit[0] -autobundled
netbloc @digit 1 4 1 NJ
load netBundle @AN_i__0_n_0,AN_i__0_n_1 8 AN_i__0_n_0 AN_i__0_n_1 AN_i__0_n_2 AN_i__0_n_3 AN_i__0_n_4 AN_i__0_n_5 AN_i__0_n_6 AN_i__0_n_7 -autobundled
netbloc @AN_i__0_n_0,AN_i__0_n_1 1 4 1 N
load netBundle @SW 16 SW[15] SW[14] SW[13] SW[12] SW[11] SW[10] SW[9] SW[8] SW[7] SW[6] SW[5] SW[4] SW[3] SW[2] SW[1] SW[0] -autobundled
netbloc @SW 1 0 1 NJ
load netBundle @AN0 8 AN0[7] AN0[6] AN0[5] AN0[4] AN0[3] AN0[2] AN0[1] AN0[0] -autobundled
netbloc @AN0 1 2 1 NJ
load netBundle @SW_IBUF 16 SW_IBUF[15] SW_IBUF[14] SW_IBUF[13] SW_IBUF[12] SW_IBUF[11] SW_IBUF[10] SW_IBUF[9] SW_IBUF[8] SW_IBUF[7] SW_IBUF[6] SW_IBUF[5] SW_IBUF[4] SW_IBUF[3] SW_IBUF[2] SW_IBUF[1] SW_IBUF[0] -autobundled
netbloc @SW_IBUF 1 1 4 220 150 NJ 150 750 180 NJ
load netBundle @AN 8 AN[7] AN[6] AN[5] AN[4] AN[3] AN[2] AN[1] AN[0] -autobundled
netbloc @AN 1 5 1 NJ
levelinfo -pg 1 0 40 300 620 1000 1290 1480 -top 0 -bot 370
show
fullfit
#
# initialize ictrl to current module lab1_top work:lab1_top:NOFILE
ictrl init topinfo |
ictrl layer glayer install
ictrl layer glayer config ibundle 1
ictrl layer glayer config nbundle 0
ictrl layer glayer config pbundle 0
ictrl layer glayer config cache 1
