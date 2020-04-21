#include "game.h"

GameState gameState;
MenuState menuState;

int debug;
int fadeIn;

void init() {
    REG_DISPCTL = MODE0;
    playSoundA(mus_start, MUS_STARTLEN, 1);
    initSplash();
    setupDisplayInterrupt();
    setupSounds();

    debug = 0;
    fadeIn = 0;
}

void initGame() {
    playSoundA(mus_game1, MUS_GAME1LEN, 1);
    
    //initialize variables
    gameState = GAME;
    initCamera(0, ENCODE4(MAPWH - SCREENHEIGHT));
    
    //setup background(s)
    REG_DISPCTL = MODE0 | BG0_ENABLE | BG1_ENABLE | BG2_ENABLE | SPRITE_ENABLE;

    DMANow(3, GameOverlayTiles, &CHARBLOCK[0], GameOverlayTilesLen / 2);
    DMANow(3, GameOverlayMap, &SCREENBLOCK[MAPSB-1], GameOverlayMapLen / 2);
    REG_BG0CNT = BG_4BPP | BG_SIZE_SMALL | BG_CHARBLOCK(0) | BG_SCREENBLOCK(MAPSB-1);

    DMANow(3, gameBackgroundTiles, &CHARBLOCK[2], gameBackgroundTilesLen / 2);
    DMANow(3, gameBackgroundMap, &SCREENBLOCK[MAPSB-2], gameBackgroundMapLen / 2);
    REG_BG2CNT = BG_4BPP | BG_SIZE_SMALL | BG_CHARBLOCK(2) | BG_SCREENBLOCK(MAPSB-2);

    DMANow(3, gameBackgroundPal, PALETTE, 16);

    setupMap();

    //setup spritesheet
    hideSprites();
    DMANow(3, SpritesheetTiles, &CHARBLOCK[4], SpritesheetTilesLen / 2);
    DMANow(3, SpritesheetPal, SPRITEPALETTE, SpritesheetPalLen / 2);

    //Set screen to first appear black
    REG_BLDCNT = BLD_BG0a | BLD_BG1a | BLD_BG2a | BLD_OBJa  //layers to blend
                | BLD_BLACK;
    REG_BLDY = BLD_EY(17);

    initPlayer();
    if (BUTTON_HELD(BUTTON_B)) {
        initAllItems(1);
    } else {
        initAllItems(0);
    }

    initAllLasers();

    fadeIn = 1;
}

void resumeGame() {
    gameState = GAME;

    REG_DISPCTL = MODE0 | BG0_ENABLE | BG1_ENABLE | BG2_ENABLE | SPRITE_ENABLE;

    //Re-DMA Background 0 since that was being used by the pause menu
    DMANow(3, GameOverlayTiles, &CHARBLOCK[0], GameOverlayTilesLen / 2);
    DMANow(3, GameOverlayMap, &SCREENBLOCK[MAPSB-1], GameOverlayMapLen / 2);
    REG_BG0CNT = BG_4BPP | BG_SIZE_SMALL | BG_CHARBLOCK(0) | BG_SCREENBLOCK(MAPSB-1);

    REG_BG1CNT = BG_4BPP | BG_SIZE_LARGE | BG_CHARBLOCK(1) | BG_SCREENBLOCK(MAPSB + OFFSET(camera.sbbcol, camera.sbbrow, 2));

    REG_BG2CNT = BG_4BPP | BG_SIZE_SMALL | BG_CHARBLOCK(2) | BG_SCREENBLOCK(MAPSB-2);

    DMANow(3, gameBackgroundPal, PALETTE, gameBackgroundPalLen / 2);
}

void update() {
    updateInput();
    switch (gameState) {
        case SPLASH:
            updateSplash();
            break;
        case INSTRUCTIONS:
            updateInstructions();
            break;
        case GAME:
            updateGame();
            break;
        case PAUSED:
            updatePause();
            break;
        case WIN:
            updateWin();
            break;
    }
    waitForVBlank();
}

void updateGame() {
    /*
    if (BUTTON_PRESSED(BUTTON_L)) {
        if (debug > 0) {
            debug = 0;
        } else {
            debug = 1;
        }
    }

    //THIS IS TEMPORARY!
    if (BUTTON_PRESSED(BUTTON_R)) {
        initWin();
    }
    */

    if (player.worldRow < 0) {
        initWin();
    }

    if (BUTTON_PRESSED(BUTTON_SELECT)) {
        initPause();
    }

    if (!debug) {
        updatePlayer();
    }
    updateAllItems();
    updateAllLasers();
    
    updateCamera();

    showPlayer();
    showAllItems();
    showAllLasers();

    if (fadeIn) {
        fade();
    }
}

void drawGame() {

    REG_BG1CNT = BG_4BPP | BG_SIZE_LARGE | BG_CHARBLOCK(1) | BG_SCREENBLOCK(MAPSB + OFFSET(camera.sbbcol, camera.sbbrow, 2));
    REG_BG1HOFF = DECODE4(camera.col) - camera.sbbcol * 256;
    REG_BG1VOFF = DECODE4(camera.row) - camera.sbbrow * 256;

    DMANow(3, shadowOAM, OAM, 128 * 4);
}

void fade() {
    static int count = 0;
    const static int speed = 1;
    if (count/speed > 17) {
        fadeIn = 0;
        count = 0;
    } else {
        REG_BLDY = BLD_EY(17 - count/speed);
    }

    count++;
}

void setupMap() {
    /*
    1024x1024 map using 10 screenblocks. Game starts at screeenblock 4.
    Initially, 0-7 is set to cover the leftmost 512x1024, and 8-9 are set accordingly.
    Changes in the hoff trigger certain DMA calls that load parts of the map offscreen.
    VRAM
    |-------------------|
    |   0   1   2   3   |
    |   2   3   4   5   |
    |   4   5   6   7   |
    |   6   7   8   9   |
    |-------------------|

    map.h
    |-------------------|
    |   0   1   2   3   |
    |   4   5   6   7   |
    |   8   9  10  11   |
    |  12  13  14  15   |
    |-------------------|
    */
    REG_BG1CNT = BG_4BPP | BG_SIZE_LARGE | BG_CHARBLOCK(1) | BG_SCREENBLOCK(MAPSB + OFFSET(camera.sbbcol, camera.sbbrow, 2));

    /* DMA Arguments
    src: mapMap[SBBSIZE * coordinate in map.h visual]
    dest: &SCREENBLOCK[MAPSB + cooresponding coordinate in VRAM]
    cnt: SBBSIZE * however many screenblocks to copy
    */
    for (int i = 0; i < 4; i++) {
        DMANow(3, &mapMap[SBBSIZE * i * 4], &SCREENBLOCK[MAPSB + 2*i], SBBSIZE * 2);
    }
    DMANow(3, &mapMap[SBBSIZE * 14], &SCREENBLOCK[MAPSB + 8], SBBSIZE * 2);

    //dma the charblock and palette as well
    DMANow(3, mapTiles, &CHARBLOCK[1], mapTilesLen / 2);
}

void setupDisplayInterrupt() {
    REG_IME = 0;    //turn interrupts off
    REG_INTERRUPT = interruptHandler;   //set the handler function

    //setup specific interrupts
    REG_IE |= INT_VBLANK;
    REG_DISPSTAT |= INT_VBLANK_ENABLE;

    REG_IME = 1;    //turn interrupts back on
}

//handle interrupts
void interruptHandler() {
    REG_IME = 0;

    if (REG_IF & INT_VBLANK) {
        if (gameState == GAME) {
            drawGame();
        }
        handleSoundVBlank();
    }

    REG_IF = REG_IF;
    
    REG_IME = 1;
}