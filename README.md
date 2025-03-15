# NES Funkin' Source Code
Here you can find the source code of the NES demake of Friday Night Funkin'!
## Files
**game.s** - The main file of the game, contains the header and some variable names.

**subroutines.s** - This file contains all the subroutines that are used in the game.

**bf_animations.s / dad_animations.s** - This file contains code for Boyfriend and Daddy Dearest animations.

**"data" Folder** - Contains data that are used in the game.
- **graphics.chr** - 8k CHR file for graphics.

- **end_screen.nam** - Nametable for the end credits screen.

- **"audio/music.s"** - This file contains all the music code used in the game. (this file was generated with FamiStudio)

- **"bg_palettes" Subfolder**
    - **bg_palette.pal** - Color palette for gameplay screen. 
    - **title_palette.pal** - Color palette for title screen.
    
- **"charts" Subfolder**
    - **bopeebo.s** - Chart file for Bopeebo. 
    - **fresh.s** - Chart file for Fresh.
    - **dadbattle.s** - Chart file for Dad Battle.
 
- **"gameover_scene" Subfolder**
    - **gameover_screen.nam** - Nametable for the gameover screen.
    - **gameover_palette.pal** - Color palette for the gameover screen.
 
- **"gameplay_scene/gameplay.nam"** - Nametable for the gameplay screen.

- **"sprite_palettes/sprite_palette.pal"** - Color palette for sprites.

- **"title_scene/title_screen.nam"** - Nametable for the title screen.

**"lib" Folder** - Contains "libraries" that are used in the game, or are useful.
- **famistudio_ca65.s** - FamiStudio ca65 engine file, downloaded from the official FamiStudio site. https://famistudio.org/

- **ppu.s** - Useful PPU macros and constants, downloaded from the Platformer Movement repository by NesHacker. (file found in "src/lib/ppu.s") https://github.com/NesHacker/PlatformerMovement/

**"state" Folder** - Contains the code for the gameplay, title and gameover screens.
- **playstate.s** - Gameplay screen code.
  
- **titlestate.s** - Title screen code.
  
- **gameoverstate.s** - Gameover screen code.

## Building and Compiling (Windows)

1. **Install a Code Editor**:
   - Download and install [Visual Studio Code] from its official website.
   - Open VS Code and install the "CA65 Macro Assembler" extension for 6502 assembly language support.

2. **Set Up the Assembler**:
   - Download the CC65 compiler suite from [cc65's website].
   - Extract the downloaded files to `C:\cc65`.

3. **Install an Emulator**:
   - Download an NES emulator. (e.g., FCEUX, Mesen)
   - Install/Extract the emulator files.

4. **Open the Project and Building**:
   - Open Visual Studio Code.
   - Open the "source_code" Folder in Visual Studio Code.
   - Run the build task to generate a `.nes` ROM file (Ctrl-Shift-B).
   - Open the ROM file in the emulator to test the game.
  
For the full changelog, see [CHANGELOG.md](CHANGELOG.md).
