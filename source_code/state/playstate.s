;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;; PLAY STATE ;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

  lda #BUTTON_LEFT   ; Left Note Timer
  and down
  bne HoldLeft
  beq ReleaseLeft
HoldLeft:
  lda LeftTimer
  cmp #$08
  beq FinishLeftInput
    inc LeftTimer
    jmp FinishLeftInput
ReleaseLeft:
  lda #$00
  sta LeftTimer
  jmp FinishLeftInput
FinishLeftInput:

  lda #BUTTON_DOWN   ; Down Note Timer
  and down
  bne HoldDown
  beq ReleaseDown
HoldDown:
  lda DownTimer
  cmp #$08
  beq FinishDownInput
    inc DownTimer
    jmp FinishDownInput
ReleaseDown:
  lda #$00
  sta DownTimer
  jmp FinishDownInput
FinishDownInput:

  lda #BUTTON_B   ; Up Note Timer
  and down
  bne HoldUp
  beq ReleaseUp
HoldUp:
  lda UpTimer
  cmp #$08
  beq FinishUpInput
    inc UpTimer
    jmp FinishUpInput
ReleaseUp:
  lda #$00
  sta UpTimer
  jmp FinishUpInput
FinishUpInput:

  lda #BUTTON_A   ; Right Note Timer
  and down
  bne HoldRight
  beq ReleaseRight
HoldRight:
  lda RightTimer
  cmp #$08
  beq FinishRightInput
    inc RightTimer
    jmp FinishRightInput
ReleaseRight:
  lda #$00
  sta RightTimer
  jmp FinishRightInput
FinishRightInput:


;;;;;;;;;;;;;;;;;;;;;;;;;; BPM AND STEPS ;;;;;;;;;;;;;;;;;;;;;;;;;;
  inc BPM_Counter ; BPM = 60 / (Beat in seconds)
  lda BPM_Counter ; TBB (in frames) = (60 * FPS) / BPM
  ldx current_song
  cpx #$00
  beq bopeebo
  cpx #$01
  beq fresh
  cpx #$02
  beq dad_battle
  bopeebo:
    cmp #BOPEEBO_BPM ; $09 - Bopeebo, $08 - Fresh, $0A - Dad Battle
    jmp bpm_continue
  fresh:
    cmp #FRESH_BPM
    jmp bpm_continue
  dad_battle:
    cmp #DADBATTLE_BPM
    jmp bpm_continue
bpm_continue:
  bne Continue

  lda #$00
  sta BPM_Counter

  ldy #$00  ; I Spent 2 days trying to fix this code, only to realize that I accidentally swapped the High and Low byte
  lda (ChartLo), y
  sta CurrentStep

  inc ChartLo
  bne Continue
  inc ChartHi
  bne Continue

Continue:
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;;;;;;;;;;;;;;;;;;;;;;;;;; NOTE GENERATION ;;;;;;;;;;;;;;;;;;;;;;;;;;
  lda CurrentStep
  cmp #$FE
  bne ContinueChart
    inc current_song
    lda #$FF
    sta song_delay
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
    lda current_song
    cmp #$00
    beq load_bopeebo
    cmp #$01
    beq load_fresh
    cmp #$02
    beq load_dadbattle
    cmp #$03
    beq end_screen
    jmp ContinueChart
  load_bopeebo:
    lda #>bopeebo_chart
    sta ChartHi
    lda #<bopeebo_chart
    sta ChartLo
    jmp ContinueChart
  load_fresh:
    lda #>fresh_chart
    sta ChartHi
    lda #<fresh_chart
    sta ChartLo
    jmp ContinueChart
  load_dadbattle:
    lda #>dadbattle_chart
    sta ChartHi
    lda #<dadbattle_chart
    sta ChartLo
    jmp ContinueChart
  end_screen:
    lda #$02
    sta Game_State
ContinueChart:

  lda CurrentStep
  ldy #$08
CheckBits:
  lsr a
  bcc NextBit
    lda CurrentStep
    cmp #$FE
    beq ChartEnded
      sty NoteGenNumber
      dec NoteGenNumber
      jsr GenerateNote
  ChartEnded:
  lda #$00
  sta CurrentStep
  jmp NextBit
NextBit:
  dey
  bne CheckBits
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;;;;;;;;;;;;;;;;;;;;;;;; CHARACTER ANIMATIONS ;;;;;;;;;;;;;;;;;;;;;;;;
  .include "bf_animations.s"
  .include "dad_animations.s"
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;


  lda ArrayIndex ; Display all the notes in the array with a single note
  cmp ArrayLimit
  bne NoteArrayLoop
    lda #$00
    sta ArrayIndex
    jmp FinishNoteArray
NoteArrayLoop:
  ldx ArrayIndex
  lda NoteArray+2, x
  cmp #$00
  beq NoteLeft
  cmp #$01
  beq NoteDown
  cmp #$02
  beq NoteUp
  cmp #$03
  beq NoteRight
  cmp #$04
  beq NoteEmpty
  jmp NoteSkip
NoteLeft:
  lda NoteArray, x
  sta MainNote_X
  lda NoteArray+1, x
  sta MainNote_Y
  lda NoteArray+2, x
  sta MainNote_Dir
  lda ArrayIndex
  adc #$02
  sta ArrayIndex
  jmp FinishNoteArray
NoteDown:
  lda NoteArray, x
  sta MainNote_X
  lda NoteArray+1, x
  sta MainNote_Y
  lda NoteArray+2, x
  sta MainNote_Dir
  lda ArrayIndex
  adc #$02
  sta ArrayIndex
  jmp FinishNoteArray
NoteUp:
  lda NoteArray, x
  sta MainNote_X
  lda NoteArray+1, x
  sta MainNote_Y
  lda NoteArray+2, x
  sta MainNote_Dir
  lda ArrayIndex
  adc #$02
  sta ArrayIndex
  jmp FinishNoteArray
NoteRight:
  lda NoteArray, x
  sta MainNote_X
  lda NoteArray+1, x
  sta MainNote_Y
  lda NoteArray+2, x
  sta MainNote_Dir
  lda ArrayIndex
  adc #$02
  sta ArrayIndex
  jmp FinishNoteArray
NoteEmpty:
  lda #$F0
  sta MainNote_Y
  lda ArrayIndex
  adc #$02
  sta ArrayIndex
  jmp NoteArrayInit
NoteSkip:
  lda ArrayIndex
  adc #$02
  sta ArrayIndex
  jmp FinishNoteArray
FinishNoteArray:

MoveNotes:
  ldx #$00
MoveNotesLoop:
  lda NoteArray+1, x
  cmp #$14
  beq OpponentNotes
continue_moving:
  cmp #$F0  ; F0 = Miss, EE = Pressed
  beq MissNotes
  cmp #$EE
  beq PressedNotes
    dec NoteArray+1, x
    dec NoteArray+1, x
    dec NoteArray+1, x
    jmp ExitMoveNotes
MissNotes:
  lda NoteArray+2, x
  cmp #$04
  beq ExitMoveNotes
    inc Misses+2
    lda #$FF
    sta NoteArray, x
    lda #$04
    sta NoteArray+2, x
    lda Health
    adc #$08
    sta Health
    jmp ExitMoveNotes
OpponentNotes:
  lda NoteArray, x
  cmp #$80
  bcs continue_moving
    lda #$00
    sta AnimFrameDad
    lda NoteArray+2, x
    clc
    adc #$01
    sta AnimIndexDad
    lda #$EE
    sta NoteArray+1, x
    lda #$04
    sta NoteArray+2, x
    jmp ExitMoveNotes
PressedNotes:
  lda NoteArray+1, x
  cmp #$EE
  beq ExitMoveNotes
    lda #$FF
    sta NoteArray, x
    lda #$04
    sta NoteArray+2, x
    jmp ExitMoveNotes
ExitMoveNotes:
  inx
  inx
  inx
  cpx ArrayLimit
  bne MoveNotesLoop

GetNoteInput1:
  ldx #$00
GetNoteInputLoop1:
  lda LeftTimer
  cmp #$08
  bne PressLeftNote
  DownInput:
  lda DownTimer
  cmp #$08
  bne PressDownNote
    jmp ExitGetNoteInput1
PressLeftNote:
  lda LeftTimer
  cmp #$00
  beq DownInput
    lda NoteArray+1, x
    cmp #HIT_NOTE
    bcs ExitGetNoteInput1
      lda NoteArray, x
      cmp #$98
      bne ExitGetNoteInput1
        lda #$EE
        sta NoteArray+1, x
        lda #$04
        sta NoteArray+2, x
        lda Health
        sbc #$08
        sta Health
        jsr IncrementScore
        lda #$00  ; Play BF Left Animation
        sta AnimFrameBF
        lda #$01
        sta AnimIndexBF
        jmp ExitGetNoteInput1
PressDownNote:
  lda DownTimer
  cmp #$00
  beq ExitGetNoteInput1
    lda NoteArray+1, x
    cmp #HIT_NOTE
    bcs ExitGetNoteInput1
      lda NoteArray, x
      cmp #$B0
      bne ExitGetNoteInput1
        lda #$EE
        sta NoteArray+1, x
        lda #$04
        sta NoteArray+2, x
        lda Health
        sbc #$08
        sta Health
        jsr IncrementScore
        lda #$00  ; Play BF Down Animation
        sta AnimFrameBF
        lda #$02
        sta AnimIndexBF
        jmp ExitGetNoteInput1
ExitGetNoteInput1:
  inx
  inx
  inx
  cpx ArrayLimit
  bne GetNoteInputLoop1

GetNoteInput2:
  ldx #$00
GetNoteInputLoop2:
  lda UpTimer
  cmp #$08
  bne PressUpNote
  RightInput:
  lda RightTimer
  cmp #$08
  bne PressRightNote
    jmp ExitGetNoteInput2
PressUpNote:
  lda UpTimer
  cmp #$00
  beq RightInput
    lda NoteArray+1, x
    cmp #HIT_NOTE
    bcs ExitGetNoteInput2
      lda NoteArray, x
      cmp #$C8
      bne ExitGetNoteInput2
        lda #$EE
        sta NoteArray+1, x
        lda #$04
        sta NoteArray+2, x
        lda Health
        sbc #$08
        sta Health
        jsr IncrementScore
        lda #$00  ; Play BF Up Animation
        sta AnimFrameBF
        lda #$03
        sta AnimIndexBF
        jmp ExitGetNoteInput2
PressRightNote:
  lda RightTimer
  cmp #$00
  beq ExitGetNoteInput2
    lda NoteArray+1, x
    cmp #HIT_NOTE
    bcs ExitGetNoteInput2
      lda NoteArray, x
      cmp #$E0
      bne ExitGetNoteInput2
        lda #$EE
        sta NoteArray+1, x
        lda #$04
        sta NoteArray+2, x
        lda Health
        sbc #$08
        sta Health
        jsr IncrementScore
        lda #$00  ; Play BF Down Animation
        sta AnimFrameBF
        lda #$04
        sta AnimIndexBF
        jmp ExitGetNoteInput2
ExitGetNoteInput2:
  inx
  inx
  inx
  cpx ArrayLimit
  bne GetNoteInputLoop2

  lda MainNote_X ; Set the main note X position
  sta $0203
  lda MainNote_X
  adc #$07
  sta $020B
  lda MainNote_X
  sta $0207
  lda MainNote_X
  adc #$08
  sta $020F
  lda MainNote_Y ; Set the main note Y position
  sta $0200
  sta $0208
  lda MainNote_Y
  adc #$08
  sta $0204
  lda MainNote_Y
  adc #$08
  sta $020C

  lda MainNote_Dir  ; Set the main note Direction
  cmp #$00
  beq BFLeft
  cmp #$01
  beq BFDown
  cmp #$02
  beq BFUp
  cmp #$03
  beq BFRight
  jmp SkipBFDir
BFLeft:
  lda #%00000010
  sta $0202
  sta $0206
  sta $020A
  sta $020E
  lda #$00
  sta $0201
  lda #$10
  sta $0205
  lda #$01
  sta $0209
  lda #$11
  sta $020D
  jmp SkipBFDir
BFDown:
  lda #%00000000
  sta $0202
  sta $0206
  sta $020A
  sta $020E
  lda #$02
  sta $0201
  lda #$12
  sta $0205
  lda #$03
  sta $0209
  lda #$13
  sta $020D
  jmp SkipBFDir
BFUp:
  lda #%00000011
  sta $0202
  sta $0206
  sta $020A
  sta $020E
  lda #$04
  sta $0201
  lda #$14
  sta $0205
  lda #$05
  sta $0209
  lda #$15
  sta $020D
  jmp SkipBFDir
BFRight:
  lda #%00000000
  sta $0202
  sta $0206
  sta $020A
  sta $020E
  lda #$06
  sta $0201
  lda #$16
  sta $0205
  lda #$07
  sta $0209
  lda #$17
  sta $020D
  jmp SkipBFDir
SkipBFDir:

  lda Health ; Set BF Icon X position depending on the health
  sta $0220 + OAM_X
  sta $0224 + OAM_X
  lda Health
  adc #$07
  sta $0228 + OAM_X
  sta $022C + OAM_X
  lda Health
  adc #$10
  sta $0230 + OAM_X
  sta $0234 + OAM_X

  lda Health ; Set Opp Icon X position depending on the health
  clc
  sbc #$10
  sta $0210 + OAM_X
  sta $0214 + OAM_X
  lda Health
  clc
  adc #$08
  sbc #$10
  sta $0218 + OAM_X
  sta $021C + OAM_X

  lda Health
  cmp #$30
  bcs MaxHealth
  lda #$30
  sta Health
MaxHealth:

  lda Health
  cmp #$D1
  bcc MinHealth
  lda #$80
  sta Health
    ldx #$00
    : lda #$FE
      sta $0200, x
      inx
      bne :-
    lda #$03
    sta Game_State
    jsr famistudio_music_play
MinHealth:

; Song Start Delay
  lda song_delay
  cmp #$03
  beq start_song
  cmp #$00
  beq finish_start
    dec song_delay
    dec song_delay
    dec song_delay
    jmp finish_start
start_song:
  lda #$00
  sta song_delay
  ldx current_song
  cpx #$00
  beq play_bopeebo
  cpx #$01
  beq play_fresh
  cpx #$02
  beq play_dad_battle
  play_bopeebo:
    lda #$00
    jsr famistudio_music_play
    jmp finish_start
  play_fresh:
    lda #$01
    jsr famistudio_music_play
    jmp finish_start
  play_dad_battle:
    lda #$02
    jsr famistudio_music_play
    jmp finish_start
finish_start:

; Increment Score
Inc_1:
  lda Score+6
  cmp #$0A
  bcc IncDone_1
  lda #$00
  sta Score+6
  inc Score+5
IncDone_1:
  lda Score+5
  cmp #$0A
  bcc IncDone_2
  lda #$00
  sta Score+5
  inc Score+4
IncDone_2:
  lda Score+4
  cmp #$0A
  bcc IncDone_3
  lda #$00
  sta Score+4
  inc Score+3
IncDone_3:
  lda Score+3
  cmp #$0A
  bcc IncDone_4
  lda #$00
  sta Score+3
  inc Score+2
IncDone_4:
  lda Score+2
  cmp #$0A
  bcc IncDone_5
  lda #$00
  sta Score+2
  inc Score+1
IncDone_5:
  lda Score+1
  cmp #$0A
  bcc IncDone_6
  lda #$00
  sta Score+1
  inc Score
IncDone_6:

; Increment Misses
Mis_Inc:
  lda Misses+2
  cmp #$0A
  bcc Mis_Inc_1
  lda #$00
  sta Misses+2
  inc Misses+1
Mis_Inc_1:
  lda Misses+1
  cmp #$0A
  bcc Mis_Done
  lda #$00
  sta Misses+1
  inc Misses
Mis_Done: