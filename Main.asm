*= $0801 "Basic Upstart"
BasicUpstart(start) 
*= $0810 "Program"
jmp start// https://dustlayer.com/c64-coding-tutorials/2013/5/24/episode-3-6-custom-character-sets-hello-charpad

* = $1000 "InitScreen"
.const CHARSET = $3800 
.const SCREEN = $0400
start:
    lda $d018
    ora #$0e       
    sta $d018
    ldx #255             
loop:
    lda #1 // also 2 works
    beq end                  
    sta SCREEN,x   
    sta SCREEN+255,x   
    sta SCREEN+255*2,x   
    sta SCREEN+255*3,x   
    dex                  
    jmp loop             
end:

* = CHARSET "Charset"
charset_data:
.byte $00,$00,$00,$00,$00,$00,$00,$00,$42,$FF,$66,$5A,$5A,$66,$FF,$42
.byte $18,$BC,$FA,$FF,$FF,$FA,$BC,$18