;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;; TITLE STATE ;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

  lda #BUTTON_START
  and pressed
  beq title_wait_state
    lda Game_State
    cmp #$01
    beq title_wait_state
      lda #$01
      sta Game_State
      ldx #$00
      : lda sprites, x
        sta $0200, x
        inx
        cpx #$6C
        bne :-
      lda #$FF
      sta song_delay
title_wait_state: