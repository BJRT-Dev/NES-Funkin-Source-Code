;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;; GAME OVER STATE ;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

  lda #BUTTON_START
  and pressed
  beq gameover_wait_state
    lda Game_State
    cmp #$01
    beq gameover_wait_state
      ldx #$00
      : lda sprites, x
        sta $0200, x
        inx
        cpx #$6C
        bne :-
      ldx #$00
      : lda #$00
        sta NoteArray, x
        inx
        cpx #$23
        bne :-
      jsr famistudio_music_stop
      jsr Reset_Gameplay
      lda #$01
      sta Game_State
      lda #$FE
      sta CurrentStep
      dec current_song
      lda #$FF
      sta song_delay
gameover_wait_state: