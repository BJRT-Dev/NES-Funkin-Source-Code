; This file is for the FamiStudio Sound Engine and was generated by FamiStudio

.if FAMISTUDIO_CFG_C_BINDINGS
.export _music_data_nes_funkin_ost=music_data_nes_funkin_ost
.endif

music_data_nes_funkin_ost:
	.byte 4
	.word @instruments
	.word @samples-4
; 00 : Bopeebo
	.word @song0ch0
	.word @song0ch1
	.word @song0ch2
	.word @song0ch3
	.word @song0ch4
	.byte .lobyte(@tempo_env_1_mid), .hibyte(@tempo_env_1_mid), 0, 0
; 01 : Fresh
	.word @song1ch0
	.word @song1ch1
	.word @song1ch2
	.word @song1ch3
	.word @song1ch4
	.byte .lobyte(@tempo_env_1_mid), .hibyte(@tempo_env_1_mid), 0, 0
; 02 : Dad Battle
	.word @song2ch0
	.word @song2ch1
	.word @song2ch2
	.word @song2ch3
	.word @song2ch4
	.byte .lobyte(@tempo_env_1_mid), .hibyte(@tempo_env_1_mid), 0, 0
; 03 : Don't Stop
	.word @song3ch0
	.word @song3ch1
	.word @song3ch2
	.word @song3ch3
	.word @song3ch4
	.byte .lobyte(@tempo_env_1_mid), .hibyte(@tempo_env_1_mid), 0, 0

.export music_data_nes_funkin_ost
.global FAMISTUDIO_DPCM_PTR

@instruments:
	.word @env4,@env6,@env9,@env3 ; 00 : Daddy Dearest
	.word @env4,@env6,@env7,@env11 ; 01 : Boyfriend
	.word @env5,@env6,@env8,@env0 ; 02 : Bass
	.word @env2,@env6,@env7,@env0 ; 03 : Drums
	.word @env1,@env6,@env8,@env0 ; 04 : Sustain_Bass
	.word @env10,@env6,@env7,@env0 ; 05 : Crack

@env0:
	.byte $00,$c0,$7f,$00,$02
@env1:
	.byte $00,$cf,$cc,$ca,$c8,$c6,$c3,$00,$06
@env2:
	.byte $00,$cf,$ce,$cd,$cc,$cb,$ca,$c9,$c8,$c7,$c6,$c5,$c4,$c3,$c2,$c1,$c0,$00,$10
@env3:
	.byte $00,$be,$bf,$c0,$00,$03
@env4:
	.byte $00,$cf,$cf,$ce,$ce,$cd,$cd,$cc,$cc,$cb,$cb,$ca,$ca,$c9,$c9,$c8,$c8,$c7,$00,$11
@env5:
	.byte $00,$c7,$c7,$c6,$c6,$c5,$c5,$c4,$c4,$c3,$c3,$c2,$c2,$c1,$c1,$c0,$00,$0f
@env6:
	.byte $c0,$7f,$00,$01
@env7:
	.byte $7f,$00,$00
@env8:
	.byte $c2,$7f,$00,$00
@env9:
	.byte $c0,$c2,$00,$01
@env10:
	.byte $00,$cf,$cf,$ce,$ce,$cd,$cd,$cc,$cc,$cb,$cb,$ca,$ca,$c9,$c9,$c8,$c8,$c7,$c7,$c6,$c6,$c5,$c5,$c4,$c4,$c3,$c3,$c2,$c2,$c1,$c1,$c0,$00,$1f
@env11:
	.byte $00,$c2,$c1,$c0,$00,$03

@samples:

@tempo_env_1_mid:
	.byte $03,$05,$80

@song0ch0:
	.byte $80, $1e, $b3, $00, $8f, $1c, $b3, $00, $8f, $1c, $b3, $00, $d7, $48, $82, $1e, $b3, $00, $8f, $1c, $b3, $00, $8f, $1c
	.byte $b3, $00, $d7, $48, $80, $20, $b3, $00, $8f, $1e, $b3, $00, $8f, $1c, $b3, $00, $d7, $48, $82, $20, $b3, $00, $8f, $1e
	.byte $b3, $00, $8f, $1c, $b3, $00, $d7, $48, $80, $17, $b3, $00, $8f, $1c, $a1, $19, $a1, $17, $b3, $00, $d7, $48, $82, $17
	.byte $b3, $00, $8f, $1c, $a1, $19, $a1, $17, $b3, $00, $d7, $48, $80, $21, $a1, $20, $b3, $00, $8f, $1c, $a1, $1e, $b3, $00
	.byte $d7, $48, $82, $21, $a1, $20, $b3, $00, $8f, $1c, $a1, $1e, $b3, $00, $d7, $48, $80, $20, $a1, $1e, $a1, $1c, $b3, $00
	.byte $ff, $9f, $48, $82, $20, $a1, $1e, $a1, $1c, $b3, $00, $ff, $9f, $48, $80, $17, $a1, $1e, $a1, $1c, $b3, $00, $ff, $9f
	.byte $48, $82, $17, $a1, $1e, $a1, $1c, $b3, $00, $ff, $9f
@song0ref156:
	.byte $48, $80, $20, $a1, $1e, $a1, $1c, $b3, $00, $ff, $9f, $48, $82, $20, $a1, $1e, $a1, $1c, $b3, $00, $fb
@song0ref177:
	.byte $80, $1c, $8f, $00, $8f, $48, $17, $9d, $00, $81, $17, $a1, $00, $a1, $1e, $a1, $1c, $b3, $00, $b3, $82, $1c, $8f, $00
	.byte $8f, $48, $17, $9f, $00, $17, $a1, $00, $a1, $1e, $a1, $1c, $b3, $00, $d7
@song0ref216:
	.byte $48, $80, $20, $c5, $1e, $c5, $1c, $c5, $00, $c5, $48, $82, $20, $c5, $1e, $c5, $1c, $c5, $00, $c5, $48, $80
@song0ref238:
	.byte $23, $8f, $00, $b3, $23, $8f, $00, $b3, $23, $8f, $23, $8f, $23, $8f, $00, $8f, $23, $8f, $00, $b3, $48, $82
	.byte $41, $14
	.word @song0ref238
	.byte $41, $11
	.word @song0ref216
	.byte $ff, $d5, $00, $c5, $48, $82, $23, $ff, $d5, $00, $c5
	.byte $41, $35
	.word @song0ref156
	.byte $a1, $1e, $a1, $1c, $a1, $23, $a1, $1e, $b3, $00, $d7, $48, $82, $20, $a1, $1e, $a1, $1c, $a1, $23, $a1, $1e, $b3, $00
	.byte $b3
	.byte $41, $23
	.word @song0ref177
	.byte $44, $00
@song0ch1:
@song0ref311:
	.byte $84
@song0ref312:
	.byte $10, $a1, $00, $8f, $1c, $8f, $00, $8f, $10, $8f, $00, $8f, $1c, $8f, $00, $8f, $10, $8f, $1c, $8f, $10, $8f, $14, $8f
	.byte $15, $8f, $17, $a1
	.byte $41, $1c
	.word @song0ref312
	.byte $41, $1c
	.word @song0ref312
	.byte $41, $1c
	.word @song0ref312
@song0ref349:
	.byte $10
@song0ref350:
	.byte $a1, $00, $8f, $1c, $8f, $00, $8f, $17, $8f, $00, $8f, $1c, $8f, $00, $8f, $17, $8f, $1c, $8f, $17, $8f, $1c, $8f, $1e
	.byte $8f, $20, $a1, $17
	.byte $41, $17
	.word @song0ref350
	.byte $17, $8b, $00, $81, $17, $a1
	.byte $41, $1c
	.word @song0ref312
	.byte $41, $1c
	.word @song0ref312
@song0ref393:
	.byte $15, $a1, $00, $8f, $1c, $8f, $00, $8f, $15, $8f, $00, $8f, $1c, $8f, $00, $8f, $15, $8f, $1c, $8f, $15, $8f, $1c, $8f
	.byte $1e, $8f, $20, $a1, $17
	.byte $41, $17
	.word @song0ref350
@song0ref425:
	.byte $17, $8b, $00, $81
@song0ref429:
	.byte $17, $a1, $12, $a1, $00, $8f, $1c, $8f, $00, $8f, $12, $8f, $00, $8f, $1c, $8f, $00, $8f, $12, $8f, $1c, $8f, $12, $8f
	.byte $14, $8f, $15, $8f, $17, $a1, $17
	.byte $41, $17
	.word @song0ref350
	.byte $17, $8f, $16, $a1
	.byte $41, $1d
	.word @song0ref393
	.byte $41, $17
	.word @song0ref350
	.byte $41, $22
	.word @song0ref425
	.byte $41, $1c
	.word @song0ref312
	.byte $41, $1c
	.word @song0ref312
	.byte $41, $1c
	.word @song0ref312
	.byte $41, $1c
	.word @song0ref312
	.byte $00, $ff, $ff, $9d
	.byte $41, $1d
	.word @song0ref349
	.byte $41, $17
	.word @song0ref350
	.byte $17, $8d, $00, $17, $a1
	.byte $41, $1c
	.word @song0ref312
	.byte $41, $1c
	.word @song0ref312
	.byte $41, $1d
	.word @song0ref393
	.byte $41, $17
	.word @song0ref350
	.byte $17, $8d, $00
	.byte $41, $1f
	.word @song0ref429
	.byte $41, $17
	.word @song0ref350
	.byte $17, $8d, $00, $16, $a1
	.byte $41, $1d
	.word @song0ref393
	.byte $41, $17
	.word @song0ref350
	.byte $17, $8d, $00
	.byte $41, $1e
	.word @song0ref429
	.byte $41, $1c
	.word @song0ref312
	.byte $44, $00
@song0ch2:
	.byte $41, $1c
	.word @song0ref311
	.byte $41, $1c
	.word @song0ref312
	.byte $41, $1c
	.word @song0ref312
	.byte $41, $1c
	.word @song0ref312
	.byte $41, $1d
	.word @song0ref349
	.byte $41, $17
	.word @song0ref350
	.byte $17, $8b, $00, $81, $17, $a1
	.byte $41, $1c
	.word @song0ref312
	.byte $41, $1c
	.word @song0ref312
	.byte $41, $1d
	.word @song0ref393
	.byte $41, $17
	.word @song0ref350
	.byte $41, $23
	.word @song0ref425
	.byte $41, $17
	.word @song0ref350
	.byte $17, $8f, $16, $a1
	.byte $41, $1d
	.word @song0ref393
	.byte $41, $17
	.word @song0ref350
	.byte $41, $22
	.word @song0ref425
	.byte $41, $1c
	.word @song0ref312
	.byte $41, $1c
	.word @song0ref312
	.byte $41, $1c
	.word @song0ref312
	.byte $41, $1c
	.word @song0ref312
	.byte $00, $ff, $ff, $9d
	.byte $41, $1d
	.word @song0ref349
	.byte $41, $17
	.word @song0ref350
	.byte $17, $8d, $00, $17, $a1
	.byte $41, $1c
	.word @song0ref312
	.byte $41, $1c
	.word @song0ref312
	.byte $41, $1d
	.word @song0ref393
	.byte $41, $17
	.word @song0ref350
	.byte $17, $8d, $00
	.byte $41, $1f
	.word @song0ref429
	.byte $41, $17
	.word @song0ref350
	.byte $17, $8d, $00, $16, $a1
	.byte $41, $1d
	.word @song0ref393
	.byte $41, $17
	.word @song0ref350
	.byte $17, $8d, $00
	.byte $41, $1e
	.word @song0ref429
	.byte $41, $1c
	.word @song0ref312
	.byte $44, $00
@song0ch3:
	.byte $86
@song0ref674:
	.byte $16, $00, $c3, $20, $85, $00, $99, $16, $00, $c3
@song0ref684:
	.byte $16, $00
@song0ref686:
	.byte $9f, $20, $85, $00, $bd, $16, $00, $c3, $20, $85, $00, $99, $16, $00, $c3, $16, $00, $8d, $16, $00, $8d, $20, $85, $00
	.byte $bd
	.byte $41, $25
	.word @song0ref674
	.byte $41, $25
	.word @song0ref674
	.byte $41, $25
	.word @song0ref674
	.byte $41, $25
	.word @song0ref674
	.byte $41, $25
	.word @song0ref674
	.byte $41, $25
	.word @song0ref674
	.byte $41, $25
	.word @song0ref674
	.byte $41, $25
	.word @song0ref674
	.byte $16, $00, $c3, $20, $85, $00, $e1, $16, $00, $9f, $20, $85, $00, $bd, $16, $00, $c3, $20, $85, $00, $99, $16, $00, $8d
	.byte $20, $85, $00, $99, $20, $85, $00, $87
	.byte $41, $13
	.word @song0ref684
	.byte $41, $19
	.word @song0ref686
	.byte $41, $25
	.word @song0ref674
	.byte $41, $25
	.word @song0ref674
	.byte $41, $25
	.word @song0ref674
	.byte $41, $25
	.word @song0ref674
	.byte $41, $25
	.word @song0ref674
	.byte $44, $00
@song0ch4:
@song0ref791:
	.byte $ff, $ff, $9f, $ff, $ff, $9f, $ff, $ff, $9f, $ff, $ff, $9f, $ff, $ff, $9f, $ff, $ff, $9f
	.byte $41, $12
	.word @song0ref791
	.byte $41, $12
	.word @song0ref791
	.byte $41, $12
	.word @song0ref791
	.byte $41, $12
	.word @song0ref791
	.byte $ff, $ff, $9f, $ff, $ff, $9f, $44, $00
@song1ch0:
	.byte $ff, $ff, $48, $ff, $ff, $48, $ff, $ff, $48, $ff, $ff, $48, $9f, $80
@song1ref15:
	.byte $28, $9d, $27, $9d, $00, $9d, $28, $9d, $00, $dd, $48, $9f, $82
	.byte $41, $0b
	.word @song1ref15
	.byte $80
@song1ref32:
	.byte $2c, $9d, $2a, $9d, $28, $9d, $27, $9d, $00, $dd, $48, $9f, $82
	.byte $41, $0b
	.word @song1ref32
	.byte $80
@song1ref49:
	.byte $27, $9d, $23, $9d, $25, $9d, $27, $9d, $00, $9d, $2c, $9d, $00, $9d, $48, $9f, $82
	.byte $41, $0e
	.word @song1ref49
	.byte $48, $80
@song1ref71:
	.byte $2a, $9d, $28, $9d, $00, $9d, $28, $9d, $27, $9d, $25, $9d, $00, $9d, $28, $9d, $48, $82
	.byte $41, $10
	.word @song1ref71
@song1ref92:
	.byte $48, $80
@song1ref94:
	.byte $27, $9d, $00, $9d, $28, $9d, $00, $9d, $25, $9d, $25, $9d, $28, $9d, $00, $9d, $48, $28, $9d, $27, $9d, $25, $91, $50
	.byte $ee, $31, $36, $89, $2a, $9d, $28, $9d, $28, $9d, $27, $9d, $00, $9d, $48, $82
	.byte $41, $22
	.word @song1ref94
@song1ref137:
	.byte $48, $bf, $80
@song1ref140:
	.byte $2a, $9d, $28, $9d, $2a, $9d, $28, $9d, $2a, $9d, $2c, $9d, $48, $00, $9d, $2a, $9d, $28, $9d, $25, $9d, $28, $bd, $27
	.byte $bd, $48, $00, $bd, $82
	.byte $41, $19
	.word @song1ref140
	.byte $9d, $80
@song1ref174:
	.byte $28, $9d, $27, $9d, $00, $9d, $28, $9d, $00, $9d, $28, $9d, $28, $9d, $48, $00, $9d, $82
	.byte $41, $10
	.word @song1ref174
	.byte $80
@song1ref196:
	.byte $2c, $9d, $2a, $9d, $28, $9d, $27, $9d, $00, $bd, $27, $9d, $48, $00, $9d, $82
	.byte $41, $0e
	.word @song1ref196
	.byte $80
@song1ref216:
	.byte $27, $9d, $23, $9d, $25, $9d, $27, $9d, $00, $bd, $2c, $9d, $48, $00, $9d, $82
	.byte $41, $0c
	.word @song1ref216
	.byte $48, $80
@song1ref237:
	.byte $2a, $9d, $28, $9d, $28, $9d, $28, $8d, $00, $8d, $27, $9d, $25, $9d, $00, $9d, $28, $9d, $48, $82
	.byte $41, $12
	.word @song1ref237
	.byte $41, $22
	.word @song1ref92
	.byte $48, $82
	.byte $41, $22
	.word @song1ref94
	.byte $41, $1b
	.word @song1ref137
	.byte $82
	.byte $41, $19
	.word @song1ref140
	.byte $ff, $fd, $48, $ff, $ff, $48, $ff, $ff, $48, $ff, $ff, $44, $00
@song1ch1:
@song1ref289:
	.byte $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $88
@song1ref298:
	.byte $15, $dd, $14, $fd, $0d, $9d, $df, $17, $fd, $15, $9d, $df, $14, $fd, $19, $9d, $df, $17, $ff, $9d
	.byte $41, $14
	.word @song1ref298
	.byte $41, $14
	.word @song1ref298
	.byte $41, $12
	.word @song1ref298
	.byte $dd, $00, $bd
	.byte $41, $14
	.word @song1ref298
	.byte $41, $14
	.word @song1ref298
	.byte $41, $14
	.word @song1ref298
	.byte $41, $12
	.word @song1ref298
@song1ref342:
	.byte $dd, $00, $bd, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $44, $00
@song1ch2:
	.byte $41, $1c
	.word @song1ref289
	.byte $41, $14
	.word @song1ref298
	.byte $41, $14
	.word @song1ref298
	.byte $41, $12
	.word @song1ref298
	.byte $dd, $00, $bd
	.byte $41, $14
	.word @song1ref298
	.byte $41, $14
	.word @song1ref298
	.byte $41, $14
	.word @song1ref298
	.byte $41, $12
	.word @song1ref298
	.byte $41, $0c
	.word @song1ref342
@song1ch3:
	.byte $86
@song1ref388:
	.byte $16, $8d, $00, $8d, $16, $8d, $00, $8d, $1e, $8d, $00, $9d, $1e, $8d, $00, $8d, $1e, $8d, $16, $9d, $1e, $8d, $00, $8d
	.byte $21, $8d, $21, $8d
	.byte $41, $1a
	.word @song1ref388
	.byte $00, $8d
	.byte $41, $1c
	.word @song1ref388
	.byte $41, $18
	.word @song1ref388
	.byte $16, $8d, $00, $8d
@song1ref431:
	.byte $16, $00, $bb, $20, $81, $00, $99, $22, $00, $8b, $21, $00, $8b, $22, $00, $8b, $21, $00, $8b, $16, $00, $9b, $20, $81
	.byte $00, $99, $16, $00, $9b
	.byte $41, $1d
	.word @song1ref431
	.byte $41, $1d
	.word @song1ref431
	.byte $41, $1d
	.word @song1ref431
	.byte $41, $1d
	.word @song1ref431
	.byte $41, $1d
	.word @song1ref431
	.byte $41, $1d
	.word @song1ref431
	.byte $41, $1c
	.word @song1ref388
	.byte $41, $1d
	.word @song1ref431
	.byte $41, $1d
	.word @song1ref431
	.byte $41, $1d
	.word @song1ref431
	.byte $41, $1d
	.word @song1ref431
	.byte $41, $1d
	.word @song1ref431
	.byte $41, $1d
	.word @song1ref431
	.byte $41, $1d
	.word @song1ref431
	.byte $41, $15
	.word @song1ref431
	.byte $db
	.byte $41, $1d
	.word @song1ref431
	.byte $41, $1d
	.word @song1ref431
	.byte $41, $1d
	.word @song1ref431
	.byte $41, $1d
	.word @song1ref431
	.byte $41, $1d
	.word @song1ref431
	.byte $41, $1d
	.word @song1ref431
	.byte $41, $1d
	.word @song1ref431
	.byte $41, $1c
	.word @song1ref388
	.byte $41, $1d
	.word @song1ref431
	.byte $41, $1d
	.word @song1ref431
	.byte $41, $1d
	.word @song1ref431
	.byte $41, $1d
	.word @song1ref431
	.byte $41, $1d
	.word @song1ref431
	.byte $41, $1d
	.word @song1ref431
	.byte $41, $1d
	.word @song1ref431
	.byte $41, $15
	.word @song1ref431
	.byte $db
	.byte $41, $1c
	.word @song1ref388
	.byte $41, $1a
	.word @song1ref388
	.byte $00, $8d
	.byte $41, $1c
	.word @song1ref388
	.byte $41, $18
	.word @song1ref388
	.byte $16, $8d, $00, $8d, $44, $00
@song1ch4:
@song1ref576:
	.byte $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff
	.byte $41, $0b
	.word @song1ref576
	.byte $41, $0b
	.word @song1ref576
	.byte $41, $0b
	.word @song1ref576
	.byte $41, $0b
	.word @song1ref576
	.byte $41, $0b
	.word @song1ref576
	.byte $41, $0b
	.word @song1ref576
	.byte $ff, $ff, $ff, $44, $00
@song2ch0:
	.byte $ff, $ff, $bf, $48, $ff, $ff, $bf, $48, $ff, $ff, $bf, $48, $ff, $ff, $bf
@song2ref16:
	.byte $48, $80
@song2ref18:
	.byte $2e, $a5, $27, $91, $2a, $91, $2e, $a5, $27, $91, $2a, $91, $2c, $91, $2e, $91, $2c, $91, $2a, $91, $2c, $a5, $27, $91
	.byte $2a, $91, $48, $82
	.byte $41, $1a
	.word @song2ref18
@song2ref49:
	.byte $48, $80
@song2ref51:
	.byte $33, $a5, $2e, $91, $2c, $91, $2a, $a5, $29, $a5, $27, $a5, $27, $91, $27, $91, $27, $91, $27, $91, $27, $91, $27, $91
	.byte $48, $82
	.byte $41, $18
	.word @song2ref51
@song2ref80:
	.byte $48, $00, $a5, $80
@song2ref84:
	.byte $2a, $91, $2c, $91, $27, $cd, $00, $91, $27, $91, $29, $a5, $25, $cd, $48, $00, $a5, $2e, $a5, $2c, $a5, $2c, $91, $2e
	.byte $91, $2f, $91, $2f, $91, $2e, $91, $2c, $91, $2e, $cd, $48, $00, $a5, $82
	.byte $41, $23
	.word @song2ref84
	.byte $91, $80
@song2ref128:
	.byte $2e, $91, $2c, $91, $2a, $91, $2c, $a5, $2e, $a5, $00, $91, $2e, $91, $2c, $91, $2a, $91, $2c, $a5, $2f, $a5, $48, $2e
	.byte $a5, $2c, $a5, $2a, $a5, $29, $a5, $27, $a5, $25, $a5, $20, $cd, $48, $00, $91, $2e, $91, $2c, $91, $2a, $91, $2c, $91
	.byte $2e, $91, $2c, $a5, $2e, $91, $2e, $91, $2c, $91, $2a, $91, $2c, $91, $2e, $91, $2c, $a5, $48, $00, $91, $2e, $91, $2c
	.byte $91, $2a, $91, $2c, $91, $2e, $91, $2c, $91, $2a, $91, $82, $2a, $91, $29, $91, $2a, $91, $2c, $91, $2e, $91, $2c, $91
	.byte $2a, $91, $29, $91, $48, $93
	.byte $41, $50
	.word @song2ref128
	.byte $2f, $91, $2f, $91, $2e, $91, $2c, $91, $2e, $a5, $2a, $a5
	.byte $41, $1a
	.word @song2ref16
	.byte $48, $82
	.byte $41, $1a
	.word @song2ref18
	.byte $41, $18
	.word @song2ref49
	.byte $48, $82
	.byte $41, $18
	.word @song2ref51
	.byte $41, $26
	.word @song2ref80
	.byte $82
	.byte $41, $22
	.word @song2ref84
	.byte $41, $16
	.word @song2ref16
	.byte $2c, $a5, $48, $82
	.byte $41, $16
	.word @song2ref18
	.byte $2c, $a5, $48, $80
@song2ref282:
	.byte $33, $a5, $2e, $91, $2c, $91, $2a, $a5, $29, $a5, $27, $a1, $00, $81, $27, $a1, $00, $81, $27, $a5, $00, $a5, $48, $82
	.byte $41, $16
	.word @song2ref282
	.byte $48, $ff, $ff, $bf, $44, $00
@song2ch1:
	.byte $84
@song2ref317:
	.byte $27, $91, $00, $a5, $27, $91, $00, $a5, $27, $91, $00, $b9, $27, $91, $00, $a5, $27, $91, $00, $a5, $23, $91, $00, $a5
	.byte $23, $91, $00, $a5, $25, $91, $00, $b9, $25, $91, $00, $a5, $25, $91, $00, $a5
	.byte $41, $28
	.word @song2ref317
@song2ref360:
	.byte $23, $91, $00, $a5, $23, $91, $00, $a5, $23, $91, $00, $b9, $23, $91, $00, $a5, $23, $91, $00, $a5, $25, $91, $00, $a5
	.byte $25, $91, $00, $a5, $25, $91, $00, $b9, $25, $91, $00, $a5, $25, $91, $00, $a5
	.byte $41, $14
	.word @song2ref317
@song2ref403:
	.byte $27, $a5, $2a, $91, $27, $91, $29, $91, $27, $91, $25, $91, $27, $91, $27, $a5, $2a, $91, $27, $91, $29, $91, $27, $91
	.byte $25, $91, $27, $91
	.byte $41, $28
	.word @song2ref360
	.byte $41, $14
	.word @song2ref317
	.byte $41, $1c
	.word @song2ref403
	.byte $41, $28
	.word @song2ref360
	.byte $41, $14
	.word @song2ref317
	.byte $41, $1c
	.word @song2ref403
	.byte $41, $28
	.word @song2ref360
	.byte $41, $14
	.word @song2ref317
	.byte $41, $1c
	.word @song2ref403
	.byte $41, $28
	.word @song2ref360
	.byte $41, $14
	.word @song2ref317
	.byte $41, $1c
	.word @song2ref403
	.byte $41, $28
	.word @song2ref360
	.byte $41, $14
	.word @song2ref317
	.byte $41, $1c
	.word @song2ref403
	.byte $41, $28
	.word @song2ref360
	.byte $41, $14
	.word @song2ref317
	.byte $41, $1c
	.word @song2ref403
	.byte $cf, $00, $ff, $ed, $44, $00
@song2ch2:
	.byte $84
@song2ref493:
	.byte $1b, $91, $00, $a5, $1b, $91, $00, $a5, $1b, $91, $00, $b9, $1b, $91, $00, $a5, $1b, $91, $00, $a5, $17, $91, $00, $a5
	.byte $17, $91, $00, $a5, $19, $91, $00, $b9, $19, $91, $00, $a5, $19, $91, $00, $a5
	.byte $41, $28
	.word @song2ref493
	.byte $88
@song2ref537:
	.byte $17, $ff, $ff, $bd, $19, $ff, $ff, $bd, $1b, $ff, $ff, $bd, $1b, $a5, $1e, $91, $1b, $91, $1d, $91, $1b, $91, $19, $91
	.byte $1b, $b9, $1e, $91, $1b, $91, $1d, $91, $1b, $91, $19, $91, $1b, $91
	.byte $41, $26
	.word @song2ref537
	.byte $41, $26
	.word @song2ref537
	.byte $41, $26
	.word @song2ref537
	.byte $41, $26
	.word @song2ref537
	.byte $41, $26
	.word @song2ref537
	.byte $41, $26
	.word @song2ref537
	.byte $cf, $00, $ff, $ed, $44, $00
@song2ch3:
	.byte $86
@song2ref601:
	.byte $16, $81, $00, $a1
@song2ref605:
	.byte $20, $89, $00, $ad, $20, $89, $00, $99, $20, $89, $00, $ad, $20, $89, $00, $ad, $22, $85, $00, $b1, $a7
	.byte $41, $14
	.word @song2ref605
	.byte $41, $19
	.word @song2ref601
	.byte $41, $14
	.word @song2ref605
@song2ref635:
	.byte $16, $81, $00, $a1, $20, $89, $00, $99, $22, $85, $00, $9d, $20, $89, $00, $c1, $20, $89, $00, $99, $22, $85, $00, $9d
	.byte $20, $89, $00, $99
	.byte $41, $1c
	.word @song2ref635
	.byte $41, $1c
	.word @song2ref635
	.byte $41, $1c
	.word @song2ref635
	.byte $41, $1c
	.word @song2ref635
	.byte $41, $1c
	.word @song2ref635
	.byte $41, $1c
	.word @song2ref635
	.byte $41, $1c
	.word @song2ref635
@song2ref684:
	.byte $16, $81, $00, $a1, $20, $89, $00, $ad, $19, $81, $00, $b5, $20, $89, $00, $ad, $22, $85, $00, $b1, $20, $89, $00, $99
	.byte $41, $18
	.word @song2ref684
	.byte $16, $81, $00, $a1, $20, $89, $00, $ad, $19, $81, $00, $8d, $19, $81, $00, $a1, $20, $89, $00, $ad, $19, $81, $00, $b5
	.byte $20, $89, $00, $99
@song2ref739:
	.byte $16, $81, $00, $a1, $20, $89, $00, $ad, $20, $89, $00, $ad, $20, $89, $00, $ad, $20, $89, $00, $ad, $20, $89, $00, $99
	.byte $41, $18
	.word @song2ref684
	.byte $41, $18
	.word @song2ref739
@song2ref769:
	.byte $20, $89, $00, $99, $20, $89, $00, $99, $20, $89, $00, $99, $20, $89, $00, $99
	.byte $41, $10
	.word @song2ref769
@song2ref788:
	.byte $20, $89, $00, $85, $20, $89, $00, $85, $20, $89, $00, $85, $20, $89, $00, $85
	.byte $41, $10
	.word @song2ref788
@song2ref807:
	.byte $20, $81, $00, $83, $20, $81, $00, $83, $20, $81, $00, $83, $20, $81, $00, $83
	.byte $41, $10
	.word @song2ref807
	.byte $41, $10
	.word @song2ref807
	.byte $41, $10
	.word @song2ref807
	.byte $41, $1c
	.word @song2ref635
	.byte $41, $1c
	.word @song2ref635
	.byte $41, $1c
	.word @song2ref635
	.byte $41, $1c
	.word @song2ref635
	.byte $41, $1c
	.word @song2ref635
	.byte $41, $1c
	.word @song2ref635
	.byte $41, $1c
	.word @song2ref635
	.byte $41, $1c
	.word @song2ref635
	.byte $16, $81, $00, $a1
@song2ref860:
	.byte $22, $85, $00, $b1, $22, $85, $00, $9d, $20, $89, $00, $ad, $22, $85, $00, $89, $16, $81, $00, $8d, $16, $81, $00, $8d
	.byte $16, $81, $00, $8d, $22, $85, $00, $9d, $a7
	.byte $41, $21
	.word @song2ref860
	.byte $41, $21
	.word @song2ref860
	.byte $41, $1f
	.word @song2ref860
	.byte $89, $16, $91, $bb, $00, $ff, $ff, $81, $44, $00
@song2ch4:
@song2ref913:
	.byte $ff, $ff, $bf, $ff, $ff, $bf, $ff, $ff, $bf, $ff, $ff, $bf, $ff, $ff, $bf, $ff, $ff, $bf
	.byte $41, $12
	.word @song2ref913
	.byte $41, $12
	.word @song2ref913
	.byte $41, $12
	.word @song2ref913
	.byte $41, $12
	.word @song2ref913
	.byte $ff, $ff, $bf, $ff, $ff, $bf, $ff, $ff, $bf, $44, $00
@song3ch0:
	.byte $ff, $ff, $9f
@song3ch0loop:
	.byte $47, .lobyte(@tempo_env_1_mid), .hibyte(@tempo_env_1_mid), $80
@song3ref9:
	.byte $1e, $8f, $20, $8f, $25, $8f, $28, $8f
@song3ref17:
	.byte $2c, $8f, $34, $8f
@song3ref21:
	.byte $20, $8f, $23, $8f, $25, $8f, $28
@song3ref28:
	.byte $8f, $1e, $8f, $20, $8f, $23, $8f, $27, $8f, $20, $8f, $21, $8f, $48, $25, $8f, $28, $8f, $2c, $8f
	.byte $41, $0a
	.word @song3ref9
	.byte $20, $8f, $21
	.byte $41, $09
	.word @song3ref28
	.byte $2a, $8f, $1e, $8f, $48
	.byte $41, $08
	.word @song3ref21
	.byte $41, $14
	.word @song3ref17
	.byte $19, $8f, $1c, $8f, $48, $20, $8f, $23, $8f, $27, $8f, $28, $8f, $2a, $8f, $2c, $8f, $19, $8f, $1c, $8f, $20, $8f, $25
	.byte $8f, $28, $8f, $19, $8f, $1c, $8f, $20, $8f, $23, $8f, $2a, $8f, $42
	.word @song3ch0loop
@song3ch1:
	.byte $ff, $ff, $9f
@song3ch1loop:
	.byte $84
@song3ref113:
	.byte $2c, $ff, $8d, $00, $a1, $2a, $a1, $00, $a1, $2c, $a1, $ff, $8f, $00, $a1, $2a, $a1, $29, $81, $28, $81, $27, $81
@song3ref136:
	.byte $26, $81, $25, $81, $24, $81, $23, $81, $22, $81, $21, $81, $20, $81, $1f, $81, $1e, $81, $1d, $81, $1c, $81, $1b, $81
	.byte $1a, $81, $00, $85
	.byte $41, $09
	.word @song3ref113
	.byte $27, $a1, $ff, $d7
	.byte $41, $1a
	.word @song3ref136
@song3ref174:
	.byte $19, $81, $18, $81, $17, $81, $00, $85, $42
	.word @song3ch1loop
@song3ch2:
	.byte $ff, $ff, $9f
@song3ch2loop:
	.byte $88
	.byte $41, $33
	.word @song3ref113
	.byte $41, $09
	.word @song3ref113
	.byte $27, $a1, $ff, $d7
	.byte $41, $1a
	.word @song3ref136
	.byte $41, $08
	.word @song3ref174
	.byte $42
	.word @song3ch2loop
@song3ch3:
	.byte $8a, $27, $ff, $8d, $00, $ff, $8d
@song3ch3loop:
	.byte $86
@song3ref218:
	.byte $16, $81, $00, $c1, $20, $89, $00, $95, $16, $81, $00, $af
@song3ref230:
	.byte $20, $89, $00, $83, $16, $81, $00, $9d
	.byte $41, $08
	.word @song3ref230
	.byte $20, $89, $00, $83
	.byte $41, $0b
	.word @song3ref218
	.byte $c1, $16, $81, $00, $9d, $20, $89, $00, $95, $22, $89, $00, $95
	.byte $41, $14
	.word @song3ref218
	.byte $41, $08
	.word @song3ref230
	.byte $20, $89, $00, $83
@song3ref271:
	.byte $16, $81, $00, $8b, $20, $89, $00, $95
	.byte $41, $08
	.word @song3ref271
	.byte $41, $08
	.word @song3ref271
	.byte $20, $89, $00, $95
	.byte $41, $08
	.word @song3ref271
	.byte $22, $89, $00, $95, $42
	.word @song3ch3loop
@song3ch4:
	.byte $ff, $ff, $9f
@song3ch4loop:
	.byte $ff, $ff, $9f, $ff, $ff, $9f, $ff, $ff, $9f, $ff, $ff, $9f, $42
	.word @song3ch4loop
