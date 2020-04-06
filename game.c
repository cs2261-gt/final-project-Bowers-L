#include "game.h"

GameState gameState;
int hOff;
int vOff;

int debug;

void init() {
    REG_DISPCTL = MODE0;
    setupInterrupts();
    initGame();
}

void initGame() {
    //initialize variables
    gameState = GAME;
    hOff = 0;
    vOff = ENCODE8(MAPWH - SCREENHEIGHT);
    debug = 1;

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
}

void updateStart() {

}

void updateGame() {
    if (debug) {
        cameraDebug();
    }

    updatePlayer();
}



void updatePause() {

}

void cameraDebug() {
    if (BUTTON_HELD(BUTTON_UP)) {
        if (vOff > 0) {
            vOff = max(vOff - playerMaxSpeed, 0);
        }
    }
    if (BUTTON_HELD(BUTTON_DOWN)) {
        if (vOff < ENCODE8(MAPWH - SCREENHEIGHT)) {
            vOff = min(vOff + playerMaxSpeed, ENCODE8(MAPWH - SCREENHEIGHT));
        }
    }
    if (BUTTON_HELD(BUTTON_LEFT)) {
        if (hOff > 0) {
            hOff = max(hOff - playerMaxSpeed, 0);
        }
    }
    if (BUTTON_HELD(BUTTON_RIGHT)) {
        if (hOff < ENCODE8(MAPWH - SCREENWIDTH)) {
            hOff = min(hOff + playerMaxSpeed, ENCODE8(MAPWH - SCREENWIDTH));
        }
    }
}

void handleVBlank() {
    REG_BG0HOFF = DECODE8(hOff);
    REG_BG0VOFF = DECODE8(vOff);
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