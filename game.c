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
    REG_DISPCTL |= BG1_ENABLE;
    REG_DISPCTL &= ~BG0_ENABLE;
    setupMap();

    //setup spritesheet
    REG_DISPCTL |= SPRITE_ENABLE;
    hideSprites();
    DMANow(3, SpritesheetTiles, &CHARBLOCK[4], SpritesheetTilesLen / 2);
    DMANow(3, SpritesheetPal, SPRITEPALETTE, SpritesheetPalLen / 2);

    initPlayer();
    initItem(&boots, 496, 496);
}

void resumeGame() {
    REG_DISPCTL |= SPRITE_ENABLE;
    gameState = GAME;

    REG_BG0CNT = BG_4BPP | BG_SIZE_LARGE | BG_CHARBLOCK(0) | BG_SCREENBLOCK(27);
    DMANow(3, mapTiles, &CHARBLOCK[0], mapTilesLen / 2);
    DMANow(3, mapMap, &SCREENBLOCK[28], mapMapLen / 2);
    DMANow(3, mapPal, PALETTE, mapPalLen / 2);
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

    if (BUTTON_PRESSED(BUTTON_SELECT)) {
        initPause();
    }

    if (debug) {
        cameraDebug();
    } else {
        updatePlayer();
        updateItem(&boots);
    }
    updateCamera();

    showPlayer();
    showItem(&boots);
}

void drawGame() {
    REG_BG1CNT = BG_4BPP | BG_SIZE_LARGE | BG_CHARBLOCK(1) | BG_SCREENBLOCK(23 + OFFSET(camera.sbbcol, camera.sbbrow, 2));
    REG_BG1HOFF = DECODE4(camera.col) - camera.sbbcol * 256;
    REG_BG1VOFF = DECODE4(camera.row) - camera.sbbrow * 256;

    DMANow(3, shadowOAM, OAM, 128 * 4);
}

void setupMap() {
    /*
    1024x1024 map using 9 screenblocks. Game starts at screeenblock 4
    |-------------------|
    |   0   1   2   3   |
    |   2   3   4   5   |
    |   4   5   6   7   |
    |   6   7   8   9   |
    |-------------------|
    */
    REG_BG1CNT = BG_4BPP | BG_SIZE_LARGE | BG_CHARBLOCK(1) | BG_SCREENBLOCK(23 + OFFSET(camera.sbbcol, camera.sbbrow, 2));
    
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