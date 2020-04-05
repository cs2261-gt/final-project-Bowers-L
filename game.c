#include "game.h"

GameState gameState;
int hOff;
int vOff;

ANISPRITE player;
const int playerMaxSpeed = 2;

void init() {
    REG_DISPCTL = MODE0;
    setupInterrupts();
    initGame();
}

void initGame() {
    //initialize variables
    gameState = GAME;
    hOff = 0;
    vOff = 0;

    //setup background
    REG_DISPCTL |= BG0_ENABLE;
    REG_BG0CNT = BG_4BPP | BG_SIZE_LARGE | BG_CHARBLOCK(0) | BG_SCREENBLOCK(28);
    DMANow(3, mapSBBTiles, &CHARBLOCK[0], mapSBBTilesLen / 2);
    DMANow(3, mapSBBMap, &SCREENBLOCK[28], mapSBBMapLen / 2);
    DMANow(3, mapSBBPal, PALETTE, mapSBBPalLen / 2);
}

void update() {
    updateInput();
    hideSprites();
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
    
    if (BUTTON_HELD(BUTTON_UP)) {
        if (vOff > 0) {
            vOff = max(vOff - playerMaxSpeed, 0);
        }
    }
    if (BUTTON_HELD(BUTTON_DOWN)) {
        if (vOff < MAPWH - SCREENHEIGHT) {
            vOff = min(vOff + playerMaxSpeed, MAPWH - SCREENHEIGHT);
        }
    }
    if (BUTTON_HELD(BUTTON_LEFT)) {
        if (hOff > 0) {
            hOff = max(hOff - playerMaxSpeed, 0);
        }
    }
    if (BUTTON_HELD(BUTTON_RIGHT)) {
        if (hOff < MAPWH - SCREENWIDTH) {
            hOff = min(hOff + playerMaxSpeed, MAPWH - SCREENWIDTH);
        }
    }
    
}

void updatePlayer() {

    //update player's world and screen positions
    player.worldRow += player.rdel;
    player.worldCol += player.cdel;
    player.screenRow = player.worldRow - vOff;
    player.screenCol = player.worldCol - hOff;
}

void updatePause() {

}

void handleVBlank() {
    REG_BG0HOFF = hOff;
    REG_BG0VOFF = vOff;
    DMANow(3, shadowOAM, OAM, 128);
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

    if (REG_IF == INT_VBLANK) {
        handleVBlank();
    }

    REG_IF = REG_IF;
    
    REG_IME = 1;
}