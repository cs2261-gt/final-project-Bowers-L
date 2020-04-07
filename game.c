#include "game.h"

GameState gameState;
int hOff;
int vOff;

int debug;

void init() {
    REG_DISPCTL = MODE0;
    initGame();
    setupInterrupts();
}

void initGame() {
    //initialize variables
    gameState = GAME;
    hOff = 0;
    vOff = ENCODE4(MAPWH - SCREENHEIGHT);
    debug = 0;

    //setup background
    REG_DISPCTL |= BG0_ENABLE;
    REG_BG0CNT = BG_4BPP | BG_SIZE_LARGE | BG_CHARBLOCK(0) | BG_SCREENBLOCK(28);
    DMANow(3, mapTiles, &CHARBLOCK[0], mapTilesLen / 2);
    DMANow(3, mapMap, &SCREENBLOCK[28], mapMapLen / 2);
    DMANow(3, mapPal, PALETTE, mapPalLen / 2);

    //setup spritesheet
    REG_DISPCTL |= SPRITE_ENABLE;
    hideSprites();
    DMANow(3, SpritesheetTiles, &CHARBLOCK[4], SpritesheetTilesLen / 2);
    DMANow(3, SpritesheetPal, SPRITEPALETTE, SpritesheetPalLen / 2);

    initPlayer();
}

void update() {
    updateInput();
    switch (gameState) {
        case START:
            updateStart();
            break;
        case GAME:
            updateGame();
            break;
        case PAUSED:
            updatePause();
            break;
    }
    waitForVBlank();
}

void updateStart() {

}

void updateGame() {
    if (BUTTON_PRESSED(BUTTON_L)) {
        if (debug > 0) {
            debug = 0;
        } else {
            debug = 1;
        }
    }

    if (debug) {
        cameraDebug();
        showPlayer();
    } else {
        updatePlayer();
    }
}



void updatePause() {

}

void cameraDebug() {
    static int cameraSpeed = 32;

    if (BUTTON_HELD(BUTTON_UP)) {
        if (vOff > 0) {
            vOff = max(vOff - cameraSpeed, 0);
        }
    }
    if (BUTTON_HELD(BUTTON_DOWN)) {
        if (vOff < ENCODE4(MAPWH - SCREENHEIGHT)) {
            vOff = min(vOff + cameraSpeed, ENCODE4(MAPWH - SCREENHEIGHT));
        }
    }
    if (BUTTON_HELD(BUTTON_LEFT)) {
        if (hOff > 0) {
            hOff = max(hOff - cameraSpeed, 0);
        }
    }
    if (BUTTON_HELD(BUTTON_RIGHT)) {
        if (hOff < ENCODE4(MAPWH - SCREENWIDTH)) {
            hOff = min(hOff + cameraSpeed, ENCODE4(MAPWH - SCREENWIDTH));
        }
    }
}

void handleVBlank() {
    REG_BG0HOFF = DECODE4(hOff);
    REG_BG0VOFF = DECODE4(vOff);
    DMANow(3, shadowOAM, OAM, 128 * 4);
}

void setupInterrupts() {
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
        handleVBlank();
    }

    REG_IF = REG_IF;
    
    REG_IME = 1;
}