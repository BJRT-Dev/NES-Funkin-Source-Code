.segment "HEADER"
  ; .byte "NES", $1A      ; iNES header identifier
  .byte $4E, $45, $53, $1A
  .byte 2               ; 2x 16KB PRG code
  .byte 1               ; 1x  8KB CHR data
  .byte $00, $00        ; mapper 0, vertical mirroring

  ;76543210 - MAPPER
  ;||||||||
  ;|||||||+- Nametable arrangement: 0: vertical arrangement ("horizontal mirrored") (CIRAM A10 = PPU A11)
  ;|||||||                          1: horizontal arrangement ("vertically mirrored") (CIRAM A10 = PPU A10)
  ;||||||+-- 1: Cartridge contains battery-backed PRG RAM ($6000-7FFF) or other persistent memory
  ;|||||+--- 1: 512-byte trainer at $7000-$71FF (stored before PRG data)
  ;||||+---- 1: Alternative nametable layout
  ;++++----- Lower nybble of mapper number

.segment "ZEROPAGE"
  ppu_flag:          .res 1
  pointerLo:         .res 1
  pointerHi:         .res 1
  ChartLo:           .res 1
  ChartHi:           .res 1
  ChartEnd:          .res 1
  song_delay:        .res 1
  finish_song_delay: .res 1
  current_song:      .res 1
  end_game:          .res 1
  over_game:         .res 1

  down:              .res 1
  pressed:           .res 1
  LeftTimer:         .res 1
  DownTimer:         .res 1
  UpTimer:           .res 1
  RightTimer:        .res 1

  ArrayIndex:        .res 1
  NoteSpriteIndex:   .res 1

  ArrayLimit:        .res 1
  NoteGenNumber:     .res 1
  PlayIndex:         .res 1

  MainNote_X:        .res 1
  MainNote_Y:        .res 1
  MainNote_Dir:      .res 1
  NoteArray:         .res 24

  Health:            .res 1
  Misses:            .res 3
  Score:             .res 7

  AnimIndexBF:       .res 1
  AnimFrameBF:       .res 1
  AnimIndexDad:      .res 1
  AnimFrameDad:      .res 1

  BPM_Counter:       .res 1
  CurrentStep:       .res 1

  Game_State:        .res 1

.segment "VECTORS"
  .addr nmi
  .addr reset
  .addr 0

; "nes" linker config requires a STARTUP section, even if it's empty
.segment "STARTUP"

; Main code segment for the program
.segment "CODE"
; FamiStudio config.
FAMISTUDIO_CFG_EXTERNAL       = 1
FAMISTUDIO_CFG_DPCM_SUPPORT   = 1
FAMISTUDIO_CFG_SFX_SUPPORT    = 1 
FAMISTUDIO_CFG_SFX_STREAMS    = 2
FAMISTUDIO_CFG_EQUALIZER      = 1
FAMISTUDIO_USE_VOLUME_TRACK   = 1
FAMISTUDIO_USE_PITCH_TRACK    = 1
FAMISTUDIO_USE_SLIDE_NOTES    = 1
FAMISTUDIO_USE_VIBRATO        = 1
FAMISTUDIO_USE_ARPEGGIO       = 1
FAMISTUDIO_CFG_SMOOTH_VIBRATO = 1
FAMISTUDIO_USE_RELEASE_NOTES  = 1
FAMISTUDIO_DPCM_OFF           = $e000

JOYPAD1        = $4016

HIT_NOTE       = $1A

BOPEEBO_BPM    = $09
FRESH_BPM      = $08
DADBATTLE_BPM  = $05

BFSPRITE1      = $0238
BFSPRITE2      = $023C
BFSPRITE3      = $0240
BFSPRITE4      = $0244

DADSPRITE1     = $0248
DADSPRITE2     = $024C
DADSPRITE3     = $0250
DADSPRITE4     = $0254
DADSPRITE5     = $0258
DADSPRITE6     = $025C
DADHEADSPRITE1 = $0260
DADHEADSPRITE2 = $0264
DADHEADSPRITE3 = $0268

NOTE_SPRITE_ARRAY = $0270

BUTTON_A      = 1 << 7
BUTTON_B      = 1 << 6
BUTTON_SELECT = 1 << 5
BUTTON_START  = 1 << 4
BUTTON_UP     = 1 << 3
BUTTON_DOWN   = 1 << 2
BUTTON_LEFT   = 1 << 1
BUTTON_RIGHT  = 1 << 0

; CA65-specifc config.
.define FAMISTUDIO_CA65_ZP_SEGMENT   ZEROPAGE
.define FAMISTUDIO_CA65_RAM_SEGMENT  RAM
.define FAMISTUDIO_CA65_CODE_SEGMENT CODE

; Libraries
.include "lib/ppu.s"
.include "lib/famistudio_ca65.s"

reset:
  sei		      ; disable IRQs
  cld		      ; disable decimal mode
  ldx #$40
  stx $4017	  ; disable APU frame IRQ
  ldx #$FF 	  ; Set up stack
  txs		      ;
  inx		      ; now X = 0
  stx $2000	  ; disable NMI
  stx $2001 	; disable rendering
  stx $4010 	; disable DMC IRQs

;; first wait for vblank to make sure PPU is ready
vblankwait1:
  bit $2002
  bpl vblankwait1

clear_memory:
  lda #$00
  sta $0000, x
  sta $0100, x
  sta $0300, x
  sta $0400, x
  sta $0500, x
  sta $0600, x
  sta $0700, x
  lda #$FE
  sta $0200, x
  inx
  bne clear_memory

;; second wait for vblank, PPU is ready after this
vblankwait2:
  bit $2002
  bpl vblankwait2

LoadPalette:
  lda $2002
  lda #$3F
  sta $2006
  lda #$00
  sta $2006
  ldx #$00
LoadPalettesLoop:
  lda start_palettes, x
  sta $2007
  inx
  cpx #$20
  bne LoadPalettesLoop

  LoadNametable title_background

  lda #>bopeebo_chart
  sta ChartHi
  lda #<bopeebo_chart
  sta ChartLo

  lda #$03
  sta ArrayLimit

  lda #$80
  sta Health

  lda #$F3
  sta MainNote_Y

  lda #$04
  sta NoteArray+2
  sta NoteArray+5
  sta NoteArray+8
  sta NoteArray+11
  sta NoteArray+14
  sta NoteArray+17
  sta NoteArray+20
  sta NoteArray+23

  lda #$00
  sta Game_State

  ldx #.lobyte(music_data_nes_funkin_ost)
  ldy #.hibyte(music_data_nes_funkin_ost)
  lda #$01 ; NTSC
  jsr famistudio_init

  lda #%10010000
  sta $2000
  lda #%00011110
  sta $2001

loop:
  jsr Latch_P1 ; Latch Player 1 Controller
  jsr famistudio_update

  lda #%10000000
  ora ppu_flag
  sta ppu_flag
@wait_for_render:
  bit ppu_flag
  bmi @wait_for_render

  jmp loop

nmi:
  bit ppu_flag
  bpl nmi_return

  jsr PPU_Render

  lda #%01111111
  and ppu_flag
  sta ppu_flag

  GameEngine:
    lda Game_State
    cmp #$00
    beq TitleState
    cmp #$01
    beq PLAY_STATE
    cmp #$03
    beq GameOverState
  GameEngineDone:
nmi_return:
  rti

TitleState:
  .include "state/titlestate.s"
  jmp GameEngineDone

PLAY_STATE: jmp PlayState

GameOverState:
  .include "state/gameoverstate.s"
  jmp GameEngineDone
PlayState:
  .include "state/playstate.s"
  jmp GameEngineDone
  
Subroutines:
  .include "subroutines.s"

;;;;;;;;;;;;;;;;;;;;;;;;;;;; Read-Only Data ;;;;;;;;;;;;;;;;;;;;;;;;;;;;
.segment "RODATA"
song_data:
  .include "data/audio/music.s"

; Charts
  .include "data/charts/bopeebo.s"
  .include "data/charts/fresh.s"
  .include "data/charts/dadbattle.s"

title_background:
  .incbin "data/title_scene/title_screen.nam"
gameplay_background:
  .incbin "data/gameplay_scene/gameplay.nam"
end_background:
  .incbin "data/end_screen.nam"
gameover_background:
  .incbin "data/gameover_scene/gameover_screen.nam"

start_palettes:
  .incbin "data/bg_palettes/title_palette.pal"
  .incbin "data/sprite_palettes/sprite_palette.pal"
game_palettes:
  .incbin "data/bg_palettes/bg_palette.pal"
  .incbin "data/sprite_palettes/sprite_palette.pal"
gameover_palettes:
  .incbin "data/gameover_scene/gameover_palette.pal"
  .incbin "data/gameover_scene/gameover_palette.pal"
  
sprites:
  .byte $80, $00, %00000000, $98 ; Main Note
  .byte $88, $10, %00000000, $98
  .byte $80, $01, %00000000, $A0
  .byte $88, $11, %00000000, $A0

  .byte $C6, $3C, %00000001, $00 ; D.D. Health Icon
  .byte $CE, $3E, %00000001, $00
  .byte $C6, $3D, %00000001, $08
  .byte $CE, $3F, %00000001, $08

  .byte $C6, $0A, %01000000, $00 ; BF Health Icon
  .byte $CE, $1A, %01000000, $00
  .byte $C6, $09, %01000000, $08
  .byte $CE, $19, %01000000, $08
  .byte $C6, $08, %01000000, $10
  .byte $CE, $18, %01000000, $10

  .byte $90, $0C, %00000000, $A8 ; Boyfriend Sprites
  .byte $90, $0D, %00000000, $B0
  .byte $98, $20, %00000000, $A8
  .byte $98, $21, %00000000, $B0

  .byte $98, $30, %00000001, $50 ; Daddy Dearest Sprites
  .byte $98, $31, %00000001, $58
  .byte $90, $2E, %00000001, $50
  .byte $90, $2F, %00000001, $58
  .byte $88, $2C, %00000001, $50
  .byte $88, $2D, %00000001, $58
  .byte $7D, $2B, %00000001, $55 ; D.D. Head Sprites
  .byte $80, $2A, %00000010, $54
  .byte $80, $32, %00000011, $54

; Character memory
.segment "CHARS"
  .incbin "data/graphics.chr"