#include "game.h"

GameState gameState;
MenuState menuState;

int debug;

void init() {
    REG_DISPCTL = MODE0;
    initSplash();
    setupDisplayInterrupt();

    debug = 0;
}

void initGame() {
    //initialize variables
    gameState = GAME;
    initCamera(0, ENCODE4(MAPWH - SCREENHEIGHT));
    
    //setup background(s)
    REG_DISPCTL = MODE0 | BG1_ENABLE;
    setupMap();

    //setup spritesheet
    REG_DISPCTL |= SPRITE_ENABLE;
    hideSprites();
    DMANow(3, SpritesheetTiles, &CHARBLOCK[4], SpritesheetTilesLen / 2);
    DMANow(3, SpritesheetPal, SPRITEPALETTE, SpritesheetPalLen / 2);

    initPlayer();
    initAllItems();
}

void resumeGame() {
    REG_DISPCTL |= SPRITE_ENABLE | BG1_ENABLE;
    REG_DISPCTL &= ~BG0_ENABLE;
    gameState = GAME;

    REG_BG1CNT = BG_4BPP | BG_SIZE_LARGE | BG_CHARBLOCK(1) | BG_SCREENBLOCK(MAPSB + OFFSET(camera.sbbcol, camera.sbbrow, 2));

    DMANow(3, mapPal, PALETTE, 16);
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

    if (BUTTON_PRESSED(BUTTON_SELECT)) {
        initPause();
    }

    if (!debug) {
        updatePlayer();
    }
    updateAllItems();
    
    updateCamera();

    showPlayer();
    showAllItems();
}

void drawGame() {
    REG_BG1CNT = BG_4BPP | BG_SIZE_LARGE | BG_CHARBLOCK(1) | BG_SCREENBLOCK(MAPSB + OFFSET(camera.sbbcol, camera.sbbrow, 2));
    REG_BG1HOFF = DECODE4(camera.col) - camera.sbbcol * 256;
    REG_BG1VOFF = DECODE4(camera.row) - camera.sbbrow * 256;

    DMANow(3, shadowOAM, OAM, 128 * 4);
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
    DMANow(3, mapPal, PALETTE, 16);
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
    }

    REG_IF = REG_IF;
    
    REG_IME = 1;
}