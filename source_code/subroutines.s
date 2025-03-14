; NOTE GENERATION SUBROUTINE
GenerateNote:   ; $05 - Note Number. (0-3 Opponent, 4-7 BF)
  ldx #$00
  CheckEmptyLoop:
    lda NoteArray+2, x
    cmp #$04
    beq Generate
    jmp ExitGenerate
  Generate:
    lda NoteGenNumber
    cmp #$00
    beq OppNoteLeft
    cmp #$01
    beq OppNoteDown
    cmp #$02
    beq OppNoteUp
    cmp #$03
    beq OppNoteRight
    cmp #$04
    beq BFNoteLeft
    cmp #$05
    beq BFNoteDown
    cmp #$06
    beq BFNoteUp
    cmp #$07
    beq BFNoteRight
    jmp ContinueGen
    OppNoteLeft:
      lda #$10
      sta NoteArray, x
      lda #$F2
      sta NoteArray+1, x
      lda #$00
      sta NoteArray+2, x
      jmp ContinueGen
    OppNoteDown:
      lda #$28
      sta NoteArray, x
      lda #$F2
      sta NoteArray+1, x
      lda #$01
      sta NoteArray+2, x
      jmp ContinueGen
    OppNoteUp:
      lda #$40
      sta NoteArray, x
      lda #$F2
      sta NoteArray+1, x
      lda #$02
      sta NoteArray+2, x
      jmp ContinueGen
    OppNoteRight:
      lda #$58
      sta NoteArray, x
      lda #$F2
      sta NoteArray+1, x
      lda #$03
      sta NoteArray+2, x
      jmp ContinueGen

  CHK_EMPTY: jmp CheckEmptyLoop

    BFNoteLeft:
      lda #$98
      sta NoteArray, x
      lda #$F2
      sta NoteArray+1, x
      lda #$00
      sta NoteArray+2, x
      jmp ContinueGen
    BFNoteDown:
      lda #$B0
      sta NoteArray, x
      lda #$F2
      sta NoteArray+1, x
      lda #$01
      sta NoteArray+2, x
      jmp ContinueGen
    BFNoteUp:
      lda #$C8
      sta NoteArray, x
      lda #$F2
      sta NoteArray+1, x
      lda #$02
      sta NoteArray+2, x
      jmp ContinueGen
    BFNoteRight:
      lda #$E0
      sta NoteArray, x
      lda #$F2
      sta NoteArray+1, x
      lda #$03
      sta NoteArray+2, x
      jmp ContinueGen
  ContinueGen:
    jmp FinishGeneration
  ExitGenerate:
    inx
    inx
    inx
    cpx ArrayLimit
    bne CHK_EMPTY

    lda ArrayLimit
    cmp #$18
    beq FinishGeneration
      inc ArrayLimit
      inc ArrayLimit
      inc ArrayLimit
      jmp CheckEmptyLoop
  FinishGeneration:
  rts

IncrementScore:
  lda Score+6
  clc
  adc #$05
  sta Score+6

  lda Score+5
  clc
  adc #$02
  sta Score+5
  rts

PPU_Render:
  lda #%00000000
  sta $2001

  lda #BUTTON_START
  and pressed
  beq title_wait
    lda Game_State
    cmp #$00
    bne title_wait
      LoadPalettes game_palettes
      LoadNametable gameplay_background
  title_wait:

  lda #BUTTON_START
  and pressed
  beq gameover_wait
    lda Game_State
    cmp #$03
    bne gameover_wait
      LoadPalettes game_palettes
      LoadNametable gameplay_background
  gameover_wait:

  lda Game_State
  cmp #$03
  bne Continue_PPU
    lda over_game
    cmp #$01
    beq Continue_PPU
      lda #$01
      sta over_game
      LoadPalettes gameover_palettes
      LoadNametable gameover_background  
Continue_PPU:

  lda Game_State
  cmp #$00
  beq PPU_Title
  cmp #$01
  beq PPU_Gameplay
  cmp #$02
  beq PPU_End
  jmp PPU_Done
  PPU_End:
    lda end_game
    cmp #$01
    beq PPU_Title
      lda #$01
      sta end_game
      LoadNametable end_background
      ldx #$00
      : lda #$FE
        sta $0200, x
        inx
        bne :-
  PPU_Title:
    jmp PPU_Done
  PPU_Gameplay:
    VramColRow 10, 27, NAMETABLE_A
    lda Score
    sta $2007
    lda Score+1
    sta $2007
    lda Score+2
    sta $2007
    lda Score+3
    sta $2007
    lda Score+4
    sta $2007
    lda Score+5
    sta $2007
    lda Score+6
    sta $2007

    VramColRow 23, 27, NAMETABLE_A
    lda Misses
    sta $2007
    lda Misses+1
    sta $2007
    lda Misses+2
    sta $2007

    lda #BUTTON_LEFT   ; Left Note Slot Update
    and down
    beq left_slot
    VramColRow 19, 2, NAMETABLE_A
    lda #$6A
    sta $2007
    lda #$6B
    sta $2007
    VramColRow 19, 3, NAMETABLE_A
    lda #$6C
    sta $2007
    lda #$6D
    sta $2007
    jmp left_done
  left_slot:
    VramColRow 19, 2, NAMETABLE_A
    lda #$28
    sta $2007
    lda #$29
    sta $2007
    VramColRow 19, 3, NAMETABLE_A
    lda #$38
    sta $2007
    lda #$39
    sta $2007
  left_done:

    lda #BUTTON_DOWN   ; Down Note Slot Update
    and down
    beq down_slot
    VramColRow 22, 2, NAMETABLE_A
    lda #$6E
    sta $2007
    lda #$6F
    sta $2007
    VramColRow 22, 3, NAMETABLE_A
    lda #$70
    sta $2007
    lda #$71
    sta $2007
    jmp down_done
  down_slot:
    VramColRow 22, 2, NAMETABLE_A
    lda #$2A
    sta $2007
    lda #$2B
    sta $2007
    VramColRow 22, 3, NAMETABLE_A
    lda #$3A
    sta $2007
    lda #$3B
    sta $2007
  down_done:

    lda #BUTTON_B   ; Up Note Slot Update
    and down
    beq up_slot
    VramColRow 25, 2, NAMETABLE_A
    lda #$72
    sta $2007
    lda #$73
    sta $2007
    VramColRow 25, 3, NAMETABLE_A
    lda #$74
    sta $2007
    lda #$75
    sta $2007
    jmp up_done
  up_slot:
    VramColRow 25, 2, NAMETABLE_A
    lda #$2C
    sta $2007
    lda #$2D
    sta $2007
    VramColRow 25, 3, NAMETABLE_A
    lda #$3C
    sta $2007
    lda #$3D
    sta $2007
  up_done:

    lda #BUTTON_A   ; Right Note Slot Update
    and down
    beq right_slot
    VramColRow 28, 2, NAMETABLE_A
    lda #$76
    sta $2007
    lda #$77
    sta $2007
    VramColRow 28, 3, NAMETABLE_A
    lda #$78
    sta $2007
    lda #$79
    sta $2007
    jmp right_done
  right_slot:
    VramColRow 28, 2, NAMETABLE_A
    lda #$2E
    sta $2007
    lda #$2F
    sta $2007
    VramColRow 28, 3, NAMETABLE_A
    lda #$3E
    sta $2007
    lda #$3F
    sta $2007
  right_done:
    jmp PPU_Done

  PPU_Done: VramReset

  lda #%10010000
  sta $2000
  lda #%00011110
  sta $2001

  lda #$00
  sta OAM_ADDR
  lda #$02
  sta OAM_DMA

  rts

Latch_P1:
  lda down
  tay
  lda #$01
  sta JOYPAD1
  sta down
  lsr
  sta JOYPAD1
@loop:
  lda JOYPAD1
  lsr
  rol down
  bcc @loop
  tya
  eor down
  and down
  sta pressed
  rts


Reset_Gameplay:
  lda #$80
  sta Health
  lda #$00
  sta Score+6
  sta Score+5
  sta Score+4
  sta Score+3
  sta Score+2
  sta Score+1
  sta Score
  sta Misses+2
  sta Misses+1
  sta Misses
  lda #$04
  sta NoteArray+2
  sta NoteArray+5
  sta NoteArray+8
  sta NoteArray+11
  sta NoteArray+14
  sta NoteArray+17
  sta NoteArray+20
  sta NoteArray+23
  rts