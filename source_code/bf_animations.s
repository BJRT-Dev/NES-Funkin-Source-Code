  inc AnimFrameBF  ; Increment animation keyframe

  lda AnimIndexBF
  cmp #$01
  beq AnimLeftBF
  cmp #$02
  beq AnimDownBF
  cmp #$03
  beq AnimUpBF
  cmp #$04
  beq T_BF_RIGHT
  jmp FinishAnimBF1
AnimLeftBF:
  lda AnimFrameBF
  cmp #$06
  bcs FinishAnimBF1
    lda #$0E  ; Tiles
    sta BFSPRITE1 + OAM_TILE
    lda #$0F
    sta BFSPRITE2 + OAM_TILE
    lda #$22
    sta BFSPRITE3 + OAM_TILE
    lda #$23
    sta BFSPRITE4 + OAM_TILE
    lda #$A5  ; X Position
    sta BFSPRITE1 + OAM_X
    lda #$AD
    sta BFSPRITE2 + OAM_X
    lda #$90 ; Y Position
    sta BFSPRITE1 + OAM_Y
    sta BFSPRITE2 + OAM_Y
    jmp FinishAnimBF1
AnimDownBF:
  lda AnimFrameBF
  cmp #$06
  bcs FinishAnimBF1
    lda #$1C  ; Tiles
    sta BFSPRITE1 + OAM_TILE
    lda #$1D
    sta BFSPRITE2 + OAM_TILE
    lda #$26
    sta BFSPRITE3 + OAM_TILE
    lda #$27
    sta BFSPRITE4 + OAM_TILE
    lda #$A8  ; X Position
    sta BFSPRITE1 + OAM_X
    lda #$B0
    sta BFSPRITE2 + OAM_X
    lda #$92 ; Y Position
    sta BFSPRITE1 + OAM_Y
    sta BFSPRITE2 + OAM_Y
    jmp FinishAnimBF1

FinishAnimBF1: jmp FinishAnimBF2
T_BF_RIGHT: jmp AnimRightBF

AnimUpBF:
  lda AnimFrameBF
  cmp #$06
  bcs FinishAnimBF2
    lda #$1E  ; Tiles
    sta BFSPRITE1 + OAM_TILE
    lda #$1F
    sta BFSPRITE2 + OAM_TILE
    lda #$28
    sta BFSPRITE3 + OAM_TILE
    lda #$29
    sta BFSPRITE4 + OAM_TILE
    lda #$A8  ; X Position
    sta BFSPRITE1 + OAM_X
    lda #$B0
    sta BFSPRITE2 + OAM_X
    lda #$8F ; Y Position
    sta BFSPRITE1 + OAM_Y
    sta BFSPRITE2 + OAM_Y
    jmp FinishAnimBF2
AnimRightBF:
  lda AnimFrameBF
  cmp #$06
  bcs FinishAnimBF2
    lda #$0E  ; Tiles
    sta BFSPRITE1 + OAM_TILE
    lda #$0F
    sta BFSPRITE2 + OAM_TILE
    lda #$24
    sta BFSPRITE3 + OAM_TILE
    lda #$25
    sta BFSPRITE4 + OAM_TILE
    lda #$AD  ; X Position
    sta BFSPRITE1 + OAM_X
    lda #$B5
    sta BFSPRITE2 + OAM_X
    lda #$90 ; Y Position
    sta BFSPRITE1 + OAM_Y
    sta BFSPRITE2 + OAM_Y
    jmp FinishAnimBF2
FinishAnimBF2:

  lda AnimFrameBF
  cmp #$06
  beq BFChangeFrame
  jmp BFKeepFrame
BFChangeFrame:
  lda AnimIndexBF
  cmp #$01
  beq LeftBF
  cmp #$02
  beq DownBF
  cmp #$03
  beq UpBF
  cmp #$04
  beq RightBF
  jmp BFKeepFrame
  LeftBF:
    lda #$A6
    sta BFSPRITE1 + OAM_X
    lda #$AE
    sta BFSPRITE2 + OAM_X
    jmp BFKeepFrame
  DownBF:
    lda #$91
    sta BFSPRITE1 + OAM_Y
    sta BFSPRITE2 + OAM_Y
    jmp BFKeepFrame
  UpBF:
    lda #$90
    sta BFSPRITE1 + OAM_Y
    sta BFSPRITE2 + OAM_Y
    jmp BFKeepFrame
  RightBF:
    lda #$AC
    sta BFSPRITE1 + OAM_X
    lda #$B4
    sta BFSPRITE2 + OAM_X
    jmp BFKeepFrame
BFKeepFrame:

  lda AnimFrameBF
  cmp #$38
  bne NoFrameResetBF
    lda #$00
    sta AnimFrameBF
    sta AnimIndexBF
NoFrameResetBF:

  lda AnimIndexBF
  cmp #$00
  beq AnimIdleBF
  jmp FinishAnimBF3
AnimIdleBF:
  lda AnimFrameBF
  cmp #$06
  bcs FinishAnimBF3
    lda #$0C  ; Tiles
    sta BFSPRITE1 + OAM_TILE
    lda #$0D
    sta BFSPRITE2 + OAM_TILE
    lda #$20
    sta BFSPRITE3 + OAM_TILE
    lda #$21
    sta BFSPRITE4 + OAM_TILE
    lda #$A8  ; X Position
    sta BFSPRITE1 + OAM_X
    lda #$B0
    sta BFSPRITE2 + OAM_X
    lda #$90 ; Y Position
    sta BFSPRITE1 + OAM_Y
    sta BFSPRITE2 + OAM_Y
    jmp FinishAnimBF3
FinishAnimBF3: