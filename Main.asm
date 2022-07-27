*= $0801 "Basic Upstart"
BasicUpstart(start) 

.const CHARSET = $3800 
.const SCREEN = $0400
.const FISH = $6000
*= $0810 "Program"
start:
    lda $d018
    ora #$0f       
    sta $d018
    ldx #0 
loop:
    lda FISH,x 
    sta SCREEN,x
    lda FISH+256,x 
    sta SCREEN+256,x
    lda FISH+256*2,x 
    sta SCREEN+256*2,x
    lda FISH+256*3,x 
    sta SCREEN+256*3,x
    dex 
    beq end                  
    jmp loop
end:
    nop
    jmp end

*= CHARSET "Charset"
charset_data:
.byte $FF,$80,$80,$80,$80,$80,$80,$80,$FF,$00,$00,$00,$00,$00,$00,$00
.byte $FF,$00,$00,$00,$00,$00,$00,$00,$FE,$00,$00,$00,$00,$00,$00,$00
.byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
.byte $00,$00,$00,$00,$00,$00,$00,$00,$1F,$00,$00,$00,$00,$00,$00,$00
.byte $80,$80,$80,$80,$80,$80,$80,$80,$00,$00,$00,$00,$00,$00,$00,$00
.byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
.byte $00,$00,$00,$03,$06,$0C,$18,$30,$00,$7F,$C0,$00,$00,$00,$00,$00
.byte $00,$FF,$00,$00,$00,$00,$00,$00,$00,$C0,$78,$08,$08,$08,$08,$08
.byte $80,$80,$80,$80,$80,$80,$80,$80,$00,$00,$00,$00,$00,$00,$00,$00
.byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
.byte $20,$60,$40,$40,$40,$C0,$80,$C0,$00,$00,$00,$00,$00,$00,$00,$00
.byte $00,$00,$00,$00,$00,$00,$00,$00,$08,$08,$08,$08,$08,$08,$08,$0C
.byte $80,$80,$80,$80,$80,$80,$80,$00,$00,$00,$00,$00,$00,$00,$00,$00
.byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
.byte $40,$60,$20,$10,$18,$0F,$00,$00,$00,$00,$00,$00,$0F,$F9,$00,$00
.byte $00,$00,$00,$00,$00,$C0,$30,$18,$04,$04,$04,$06,$02,$02,$02,$01
.byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
.byte $00,$00,$00,$00,$01,$03,$0C,$18,$00,$00,$00,$3F,$E0,$00,$00,$00
.byte $00,$00,$00,$FF,$00,$00,$00,$00,$00,$00,$00,$FC,$07,$01,$00,$00
.byte $0C,$02,$01,$00,$00,$C0,$60,$20,$00,$00,$00,$80,$40,$20,$30,$1F
.byte $80,$80,$80,$80,$80,$80,$80,$80,$00,$00,$00,$00,$00,$00,$00,$00
.byte $10,$1F,$00,$00,$00,$00,$00,$00,$00,$80,$E0,$30,$18,$0C,$06,$03
.byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
.byte $18,$0C,$04,$06,$03,$01,$01,$00,$01,$00,$00,$00,$00,$00,$80,$80
.byte $80,$80,$80,$80,$80,$80,$80,$80,$00,$00,$00,$00,$00,$00,$00,$00
.byte $00,$00,$00,$00,$00,$00,$00,$00,$01,$00,$00,$00,$00,$00,$00,$00
.byte $80,$80,$40,$40,$20,$20,$20,$10,$00,$00,$00,$00,$00,$00,$00,$00
.byte $00,$00,$00,$00,$00,$00,$00,$00,$C0,$40,$60,$20,$20,$10,$10,$10
.byte $80,$80,$80,$80,$80,$80,$80,$80,$00,$00,$00,$00,$00,$00,$00,$00
.byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
.byte $10,$10,$10,$10,$10,$30,$20,$20,$00,$00,$00,$00,$00,$00,$00,$00
.byte $00,$00,$00,$00,$00,$00,$00,$00,$10,$10,$10,$10,$10,$10,$10,$10

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