  inc AnimFrameDad  ; Increment animation keyframe

  lda AnimIndexDad
  cmp #$01
  beq AnimLeftDad
  cmp #$02
  beq AnimDownDad
  cmp #$03
  beq AnimUpDad
  cmp #$04
  beq T_Dad_RIGHT
  jmp FinishAnimDad1
AnimLeftDad:
  lda AnimFrameDad
  cmp #$06
  bcs FinishAnimDad1
    lda #$33
    sta DADHEADSPRITE2 + OAM_TILE
    lda #$34
    sta DADSPRITE5 + OAM_TILE
    lda #$37
    sta DADSPRITE6 + OAM_TILE
    lda #$36
    sta DADSPRITE4 + OAM_TILE
    lda #$80
    sta DADHEADSPRITE2 + OAM_Y
    sta DADHEADSPRITE3 + OAM_Y
    lda #$52
    sta DADHEADSPRITE2 + OAM_X
    sta DADHEADSPRITE3 + OAM_X
    lda #$7D
    sta DADHEADSPRITE1 + OAM_Y
    lda #$53
    sta DADHEADSPRITE1 + OAM_X
    jmp FinishAnimDad1
AnimDownDad:
  lda AnimFrameDad
  cmp #$06
  bcs FinishAnimDad1
    lda #$40
    sta DADHEADSPRITE2 + OAM_TILE
    lda #$34
    sta DADSPRITE5 + OAM_TILE
    lda #$3B
    sta DADSPRITE6 + OAM_TILE
    lda #$36
    sta DADSPRITE4 + OAM_TILE
    lda #$81
    sta DADHEADSPRITE2 + OAM_Y
    sta DADHEADSPRITE3 + OAM_Y
    lda #$54
    sta DADHEADSPRITE2 + OAM_X
    sta DADHEADSPRITE3 + OAM_X
    lda #$7E
    sta DADHEADSPRITE1 + OAM_Y
    lda #$55
    sta DADHEADSPRITE1 + OAM_X
    jmp FinishAnimDad1

FinishAnimDad1: jmp FinishAnimDad2
T_Dad_RIGHT: jmp AnimRightDad

AnimUpDad:
  lda AnimFrameDad
  cmp #$06
  bcs FinishAnimDad2
    lda #$33
    sta DADHEADSPRITE2 + OAM_TILE
    lda #$34
    sta DADSPRITE5 + OAM_TILE
    lda #$3A
    sta DADSPRITE6 + OAM_TILE
    lda #$36
    sta DADSPRITE4 + OAM_TILE
    lda #$7F
    sta DADHEADSPRITE2 + OAM_Y
    sta DADHEADSPRITE3 + OAM_Y
    lda #$54
    sta DADHEADSPRITE2 + OAM_X
    sta DADHEADSPRITE3 + OAM_X
    lda #$7C
    sta DADHEADSPRITE1 + OAM_Y
    lda #$55
    sta DADHEADSPRITE1 + OAM_X
    jmp FinishAnimDad1
AnimRightDad:
  lda AnimFrameDad
  cmp #$06
  bcs FinishAnimDad2
    lda #$33
    sta DADHEADSPRITE2 + OAM_TILE
    lda #$34
    sta DADSPRITE5 + OAM_TILE
    lda #$39
    sta DADSPRITE6 + OAM_TILE
    lda #$36
    sta DADSPRITE4 + OAM_TILE
    lda #$80
    sta DADHEADSPRITE2 + OAM_Y
    sta DADHEADSPRITE3 + OAM_Y
    lda #$56
    sta DADHEADSPRITE2 + OAM_X
    sta DADHEADSPRITE3 + OAM_X
    lda #$7D
    sta DADHEADSPRITE1 + OAM_Y
    lda #$57
    sta DADHEADSPRITE1 + OAM_X
    jmp FinishAnimDad1
FinishAnimDad2:

  lda AnimFrameDad
  cmp #$06
  beq DadChangeFrame
  jmp DadKeepFrame
DadChangeFrame:
  lda AnimIndexDad
  cmp #$01
  beq LeftDad
  cmp #$02
  beq DownDad
  cmp #$03
  beq UpDad
  cmp #$04
  beq RightDad
  jmp DadKeepFrame
  LeftDad:
    lda #$38
    sta DADSPRITE6 + OAM_TILE
    lda #$53
    sta DADHEADSPRITE2 + OAM_X
    sta DADHEADSPRITE3 + OAM_X
    lda #$54
    sta DADHEADSPRITE1 + OAM_X
    jmp DadKeepFrame
  DownDad:
    lda #$38
    sta DADSPRITE6 + OAM_TILE
    lda #$80
    sta DADHEADSPRITE2 + OAM_Y
    sta DADHEADSPRITE3 + OAM_Y
    lda #$7D
    sta DADHEADSPRITE1 + OAM_Y
    jmp DadKeepFrame
  UpDad:
    lda #$38
    sta DADSPRITE6 + OAM_TILE
    lda #$80
    sta DADHEADSPRITE2 + OAM_Y
    sta DADHEADSPRITE3 + OAM_Y
    lda #$7D
    sta DADHEADSPRITE1 + OAM_Y
    jmp DadKeepFrame
  RightDad:
    lda #$38
    sta DADSPRITE6 + OAM_TILE
    lda #$55
    sta DADHEADSPRITE2 + OAM_X
    sta DADHEADSPRITE3 + OAM_X
    lda #$56
    sta DADHEADSPRITE1 + OAM_X
    jmp DadKeepFrame
DadKeepFrame:

  lda AnimFrameDad
  cmp #$38
  bne NoFrameResetDad
    lda #$00
    sta AnimFrameDad
    sta AnimIndexDad
NoFrameResetDad:

  lda AnimIndexDad
  cmp #$00
  beq AnimIdleDad
  jmp FinishAnimDad3
AnimIdleDad:
  lda AnimFrameDad
  cmp #$06
  bcs FinishAnimDad3
    lda #$30
    sta DADSPRITE1 + OAM_TILE
    lda #$31
    sta DADSPRITE2 + OAM_TILE
    lda #$2E
    sta DADSPRITE3 + OAM_TILE
    lda #$2F
    sta DADSPRITE4 + OAM_TILE
    lda #$2C
    sta DADSPRITE5 + OAM_TILE
    lda #$2D
    sta DADSPRITE6 + OAM_TILE
    lda #$2A
    sta DADHEADSPRITE2 + OAM_TILE
    lda #$80
    sta DADHEADSPRITE2 + OAM_Y
    sta DADHEADSPRITE3 + OAM_Y
    lda #$54
    sta DADHEADSPRITE2 + OAM_X
    sta DADHEADSPRITE3 + OAM_X
    lda #$7D
    sta DADHEADSPRITE1 + OAM_Y
    lda #$55
    sta DADHEADSPRITE1 + OAM_X
    jmp FinishAnimDad3
FinishAnimDad3: