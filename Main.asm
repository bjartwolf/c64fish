.var music = LoadSid("Manta-Mania.sid")
*= $0801 "Basic Upstart"
BasicUpstart(start) 

.const FISH = $6000
.const SCREENMSB = $04
.const SCREENLSB = $00
.const CHARMSB = $60
.const CHARLSB = $00
.const CHARSET = $3800
.const ZSCREEN = $fb
.const ZCHAR = $fd

*= $0810 "Program"
start:
    lda #$00
    sta $d020
    sta $d021
 
    ldx #0
    ldy #0
    lda #music.startSong-1
    jsr music.init
    sei
    lda #<irq1
    sta $0314
    lda #>irq1
    sta $0315
    asl $d019
    lda #$7b
    sta $dc0d
    lda #$81
    sta $d01a
    lda #$1b
    sta $d011
    lda #$80
    sta $d012
    cli
    lda $d018
    ora #$0f       
    sta $d018
    
    lda #CHARLSB
    sta ZCHAR
    lda #CHARMSB
    sta ZCHAR+1
    
    lda #SCREENLSB
    sta ZSCREEN
    lda #SCREENMSB
    sta ZSCREEN+1 

    ldx #4 // We need to loop four times to cover the 250*4=1000 values (we copy 1024, but don't care...)
oloop:
    ldy #0 // We count down from 0, so it will be 0,255,254 and then stop at 0
iloop:
    lda (ZCHAR),y // Indirect lookup using zeropage
    sta (ZSCREEN),y
    dey
    bne iloop 
    inc ZSCREEN+1 // When we have looped 256 values, we count the MSBs up
    inc ZCHAR+1   // by one to move to the next values... 
    dex 
    bne oloop 
end:
    jmp * 

.print ""
.print "SID Data"
.print "--------"
.print "location=$"+toHexString(music.location)
.print "init=$"+toHexString(music.init)
.print "play=$"+toHexString(music.play)
.print "songs="+music.songs
.print "startSong="+music.startSong
.print "size=$"+toHexString(music.size)
.print "name="+music.name
.print "author="+music.author
.print "copyright="+music.copyright

.print ""
.print "Additional tech data"
.print "--------------------"
.print "header="+music.header
.print "header version="+music.version
.print "flags="+toBinaryString(music.flags)
.print "speed="+toBinaryString(music.speed)
.print "startpage="+music.startpage
.print "pagelength="+music.pagelength


irq1:
        asl $d019
        inc $d020
        jsr music.play 
        dec $d020
        pla
        tay
        pla
        tax
        pla
        rti

*=music.location "Music"
.fill music.size, music.getData(i)


*= CHARSET "Charset"
charset_data:

.byte $ff,$80,$c0,$40,$20,$20,$10,$18,$ff,$00,$00,$00,$00,$00,$00,$00
.byte $ff,$02,$04,$04,$08,$08,$10,$30,$80,$c0,$30,$0c,$03,$01,$00,$00
.byte $00,$00,$00,$00,$00,$80,$60,$18,$10,$10,$10,$10,$10,$10,$10,$10
.byte $00,$00,$00,$00,$01,$03,$0c,$30,$03,$06,$18,$60,$80,$00,$00,$00
.byte $08,$04,$04,$02,$02,$01,$01,$00,$00,$00,$00,$00,$00,$01,$83,$82
.byte $20,$40,$40,$80,$80,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
.byte $0e,$03,$00,$00,$00,$00,$00,$00,$10,$11,$d6,$38,$10,$28,$6c,$44
.byte $c0,$80,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
.byte $00,$00,$00,$00,$00,$00,$01,$07,$44,$44,$28,$38,$38,$7c,$ff,$f8
.byte $00,$00,$00,$00,$00,$00,$00,$c0,$00,$00,$00,$00,$00,$00,$00,$00
.byte $00,$00,$01,$01,$02,$06,$04,$08,$82,$82,$01,$01,$00,$00,$00,$00
.byte $00,$00,$00,$00,$80,$c0,$40,$20,$00,$00,$00,$00,$00,$00,$00,$00
.byte $0f,$3f,$ff,$3f,$1f,$0f,$07,$07,$f0,$e0,$c0,$80,$80,$00,$00,$00
.byte $60,$18,$06,$01,$00,$00,$00,$00,$00,$00,$00,$80,$c0,$70,$7c,$3f
.byte $08,$10,$30,$20,$40,$40,$80,$80,$00,$00,$00,$00,$00,$3c,$42,$81
.byte $20,$10,$10,$08,$0c,$04,$02,$03,$00,$00,$00,$03,$06,$18,$60,$80
.byte $07,$07,$0f,$1f,$3f,$ff,$3f,$1f,$00,$00,$00,$80,$c0,$c0,$e0,$f0
.byte $00,$00,$00,$00,$01,$03,$0c,$30,$1f,$3c,$78,$e0,$80,$00,$00,$00
.byte $41,$a2,$5c,$40,$20,$20,$10,$18,$00,$00,$00,$00,$00,$00,$00,$00
.byte $83,$46,$3c,$04,$08,$08,$10,$30,$80,$c0,$30,$0c,$03,$01,$00,$00
.byte $07,$03,$00,$00,$00,$00,$00,$00,$f0,$ff,$fe,$38,$10,$28,$6c,$44
.byte $c0,$80,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
.byte $08,$04,$04,$02,$02,$01,$01,$00,$00,$00,$00,$00,$00,$01,$82,$82
.byte $20,$40,$40,$80,$80,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
.byte $00,$00,$01,$01,$02,$06,$04,$08,$82,$82,$01,$01,$00,$00,$00,$00
.byte $00,$00,$00,$00,$80,$c0,$40,$20,$00,$00,$00,$00,$00,$00,$00,$00
.byte $00,$00,$00,$00,$00,$00,$01,$06,$44,$44,$28,$38,$38,$7c,$93,$10
.byte $00,$00,$00,$00,$00,$00,$00,$c0,$00,$00,$00,$00,$00,$00,$00,$00
.byte $08,$10,$30,$20,$40,$40,$80,$80,$00,$00,$00,$00,$00,$00,$00,$00
.byte $20,$10,$10,$08,$0c,$04,$02,$03,$00,$00,$00,$03,$06,$18,$60,$80
.byte $08,$30,$c0,$00,$00,$00,$00,$00,$10,$10,$10,$10,$10,$10,$10,$10
.byte $60,$18,$06,$01,$00,$00,$00,$00,$00,$00,$00,$80,$c0,$30,$0c,$03

* = FISH "ScreenmapFish"

.byte $00,$01,$02,$03,$04,$05,$06,$07
.byte $00,$01,$02,$03,$04,$05,$06,$07
.byte $00,$01,$02,$03,$04,$05,$06,$07
.byte $00,$01,$02,$03,$04,$05,$06,$07
.byte $00,$01,$02,$03,$04,$05,$06,$07

.byte $08,$09,$0a,$0b,$0c,$0d,$0e,$0f
.byte $08,$09,$0a,$0b,$0c,$0d,$0e,$0f
.byte $08,$09,$0a,$0b,$0c,$0d,$0e,$0f
.byte $08,$09,$0a,$0b,$0c,$0d,$0e,$0f
.byte $08,$09,$0a,$0b,$0c,$0d,$0e,$0f

.byte $10,$11,$12,$13,$14,$15,$16,$17
.byte $10,$11,$12,$13,$14,$15,$16,$17
.byte $10,$11,$12,$13,$14,$15,$16,$17
.byte $10,$11,$12,$13,$14,$15,$16,$17
.byte $10,$11,$12,$13,$14,$15,$16,$17

.byte $18,$19,$1a,$1b,$1c,$1d,$1e,$1f
.byte $18,$19,$1a,$1b,$1c,$1d,$1e,$1f
.byte $18,$19,$1a,$1b,$1c,$1d,$1e,$1f
.byte $18,$19,$1a,$1b,$1c,$1d,$1e,$1f
.byte $18,$19,$1a,$1b,$1c,$1d,$1e,$1f

.byte $20,$21,$22,$23,$24,$25,$26,$27
.byte $20,$21,$22,$23,$24,$25,$26,$27
.byte $20,$21,$22,$23,$24,$25,$26,$27
.byte $20,$21,$22,$23,$24,$25,$26,$27
.byte $20,$21,$22,$23,$24,$25,$26,$27

.byte $28,$29,$2a,$2b,$2c,$2d,$2e,$2f
.byte $28,$29,$2a,$2b,$2c,$2d,$2e,$2f
.byte $28,$29,$2a,$2b,$2c,$2d,$2e,$2f
.byte $28,$29,$2a,$2b,$2c,$2d,$2e,$2f
.byte $28,$29,$2a,$2b,$2c,$2d,$2e,$2f

.byte $30,$31,$32,$33,$34,$35,$36,$37
.byte $30,$31,$32,$33,$34,$35,$36,$37
.byte $30,$31,$32,$33,$34,$35,$36,$37
.byte $30,$31,$32,$33,$34,$35,$36,$37
.byte $30,$31,$32,$33,$34,$35,$36,$37

.byte $38,$39,$3a,$3b,$3c,$3d,$3e,$3f
.byte $38,$39,$3a,$3b,$3c,$3d,$3e,$3f
.byte $38,$39,$3a,$3b,$3c,$3d,$3e,$3f
.byte $38,$39,$3a,$3b,$3c,$3d,$3e,$3f
.byte $38,$39,$3a,$3b,$3c,$3d,$3e,$3f

.byte $00,$01,$02,$03,$04,$05,$06,$07
.byte $00,$01,$02,$03,$04,$05,$06,$07
.byte $00,$01,$02,$03,$04,$05,$06,$07
.byte $00,$01,$02,$03,$04,$05,$06,$07
.byte $00,$01,$02,$03,$04,$05,$06,$07

.byte $08,$09,$0a,$0b,$0c,$0d,$0e,$0f
.byte $08,$09,$0a,$0b,$0c,$0d,$0e,$0f
.byte $08,$09,$0a,$0b,$0c,$0d,$0e,$0f
.byte $08,$09,$0a,$0b,$0c,$0d,$0e,$0f
.byte $08,$09,$0a,$0b,$0c,$0d,$0e,$0f

.byte $10,$11,$12,$13,$14,$15,$16,$17
.byte $10,$11,$12,$13,$14,$15,$16,$17
.byte $10,$11,$12,$13,$14,$15,$16,$17
.byte $10,$11,$12,$13,$14,$15,$16,$17
.byte $10,$11,$12,$13,$14,$15,$16,$17

.byte $18,$19,$1a,$1b,$1c,$1d,$1e,$1f
.byte $18,$19,$1a,$1b,$1c,$1d,$1e,$1f
.byte $18,$19,$1a,$1b,$1c,$1d,$1e,$1f
.byte $18,$19,$1a,$1b,$1c,$1d,$1e,$1f
.byte $18,$19,$1a,$1b,$1c,$1d,$1e,$1f

.byte $20,$21,$22,$23,$24,$25,$26,$27
.byte $20,$21,$22,$23,$24,$25,$26,$27
.byte $20,$21,$22,$23,$24,$25,$26,$27
.byte $20,$21,$22,$23,$24,$25,$26,$27
.byte $20,$21,$22,$23,$24,$25,$26,$27

.byte $28,$29,$2a,$2b,$2c,$2d,$2e,$2f
.byte $28,$29,$2a,$2b,$2c,$2d,$2e,$2f
.byte $28,$29,$2a,$2b,$2c,$2d,$2e,$2f
.byte $28,$29,$2a,$2b,$2c,$2d,$2e,$2f
.byte $28,$29,$2a,$2b,$2c,$2d,$2e,$2f

.byte $30,$31,$32,$33,$34,$35,$36,$37
.byte $30,$31,$32,$33,$34,$35,$36,$37
.byte $30,$31,$32,$33,$34,$35,$36,$37
.byte $30,$31,$32,$33,$34,$35,$36,$37
.byte $30,$31,$32,$33,$34,$35,$36,$37

.byte $38,$39,$3a,$3b,$3c,$3d,$3e,$3f
.byte $38,$39,$3a,$3b,$3c,$3d,$3e,$3f
.byte $38,$39,$3a,$3b,$3c,$3d,$3e,$3f
.byte $38,$39,$3a,$3b,$3c,$3d,$3e,$3f
.byte $38,$39,$3a,$3b,$3c,$3d,$3e,$3f

.byte $00,$01,$02,$03,$04,$05,$06,$07
.byte $00,$01,$02,$03,$04,$05,$06,$07
.byte $00,$01,$02,$03,$04,$05,$06,$07
.byte $00,$01,$02,$03,$04,$05,$06,$07
.byte $00,$01,$02,$03,$04,$05,$06,$07

.byte $08,$09,$0a,$0b,$0c,$0d,$0e,$0f
.byte $08,$09,$0a,$0b,$0c,$0d,$0e,$0f
.byte $08,$09,$0a,$0b,$0c,$0d,$0e,$0f
.byte $08,$09,$0a,$0b,$0c,$0d,$0e,$0f
.byte $08,$09,$0a,$0b,$0c,$0d,$0e,$0f

.byte $10,$11,$12,$13,$14,$15,$16,$17
.byte $10,$11,$12,$13,$14,$15,$16,$17
.byte $10,$11,$12,$13,$14,$15,$16,$17
.byte $10,$11,$12,$13,$14,$15,$16,$17
.byte $10,$11,$12,$13,$14,$15,$16,$17

.byte $18,$19,$1a,$1b,$1c,$1d,$1e,$1f
.byte $18,$19,$1a,$1b,$1c,$1d,$1e,$1f
.byte $18,$19,$1a,$1b,$1c,$1d,$1e,$1f
.byte $18,$19,$1a,$1b,$1c,$1d,$1e,$1f
.byte $18,$19,$1a,$1b,$1c,$1d,$1e,$1f

.byte $20,$21,$22,$23,$24,$25,$26,$27
.byte $20,$21,$22,$23,$24,$25,$26,$27
.byte $20,$21,$22,$23,$24,$25,$26,$27
.byte $20,$21,$22,$23,$24,$25,$26,$27
.byte $20,$21,$22,$23,$24,$25,$26,$27

.byte $28,$29,$2a,$2b,$2c,$2d,$2e,$2f
.byte $28,$29,$2a,$2b,$2c,$2d,$2e,$2f
.byte $28,$29,$2a,$2b,$2c,$2d,$2e,$2f
.byte $28,$29,$2a,$2b,$2c,$2d,$2e,$2f
.byte $28,$29,$2a,$2b,$2c,$2d,$2e,$2f

.byte $30,$31,$32,$33,$34,$35,$36,$37
.byte $30,$31,$32,$33,$34,$35,$36,$37
.byte $30,$31,$32,$33,$34,$35,$36,$37
.byte $30,$31,$32,$33,$34,$35,$36,$37
.byte $30,$31,$32,$33,$34,$35,$36,$37

.byte $38,$39,$3a,$3b,$3c,$3d,$3e,$3f
.byte $38,$39,$3a,$3b,$3c,$3d,$3e,$3f
.byte $38,$39,$3a,$3b,$3c,$3d,$3e,$3f
.byte $38,$39,$3a,$3b,$3c,$3d,$3e,$3f
.byte $38,$39,$3a,$3b,$3c,$3d,$3e,$3f


.byte $00,$01,$02,$03,$04,$05,$06,$07
.byte $00,$01,$02,$03,$04,$05,$06,$07
.byte $00,$01,$02,$03,$04,$05,$06,$07
.byte $00,$01,$02,$03,$04,$05,$06,$07
.byte $00,$01,$02,$03,$04,$05,$06,$07

.byte $08,$09,$0a,$0b,$0c,$0d,$0e,$0f
.byte $08,$09,$0a,$0b,$0c,$0d,$0e,$0f
.byte $08,$09,$0a,$0b,$0c,$0d,$0e,$0f
.byte $08,$09,$0a,$0b,$0c,$0d,$0e,$0f
.byte $08,$09,$0a,$0b,$0c,$0d,$0e,$0f

.byte $10,$11,$12,$13,$14,$15,$16,$17
.byte $10,$11,$12,$13,$14,$15,$16,$17
.byte $10,$11,$12,$13,$14,$15,$16,$17
.byte $10,$11,$12,$13,$14,$15,$16,$17
.byte $10,$11,$12,$13,$14,$15,$16,$17

.byte $18,$19,$1a,$1b,$1c,$1d,$1e,$1f
.byte $18,$19,$1a,$1b,$1c,$1d,$1e,$1f
.byte $18,$19,$1a,$1b,$1c,$1d,$1e,$1f
.byte $18,$19,$1a,$1b,$1c,$1d,$1e,$1f
.byte $18,$19,$1a,$1b,$1c,$1d,$1e,$1f

.byte $20,$21,$22,$23,$24,$25,$26,$27
.byte $20,$21,$22,$23,$24,$25,$26,$27
.byte $20,$21,$22,$23,$24,$25,$26,$27
.byte $20,$21,$22,$23,$24,$25,$26,$27
.byte $20,$21,$22,$23,$24,$25,$26,$27

.byte $28,$29,$2a,$2b,$2c,$2d,$2e,$2f
.byte $28,$29,$2a,$2b,$2c,$2d,$2e,$2f
.byte $28,$29,$2a,$2b,$2c,$2d,$2e,$2f
.byte $28,$29,$2a,$2b,$2c,$2d,$2e,$2f
.byte $28,$29,$2a,$2b,$2c,$2d,$2e,$2f

.byte $30,$31,$32,$33,$34,$35,$36,$37
.byte $30,$31,$32,$33,$34,$35,$36,$37
.byte $30,$31,$32,$33,$34,$35,$36,$37
.byte $30,$31,$32,$33,$34,$35,$36,$37
.byte $30,$31,$32,$33,$34,$35,$36,$37

.byte $38,$39,$3a,$3b,$3c,$3d,$3e,$3f
.byte $38,$39,$3a,$3b,$3c,$3d,$3e,$3f
.byte $38,$39,$3a,$3b,$3c,$3d,$3e,$3f
.byte $38,$39,$3a,$3b,$3c,$3d,$3e,$3f
.byte $38,$39,$3a,$3b,$3c,$3d,$3e,$3f