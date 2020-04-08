#include "game.h"

GameState gameState;
int hOff;
int vOff;

int debug;

void init() {
    REG_DISPCTL = MODE0;
    initSplash();
    setupDisplayInterrupt();

    debug = 0;
}

void initSplash() {
    gameState = SPLASH;
    hOff = 0;
    vOff = 0;

    REG_DISPCTL |= BG0_ENABLE;
    REG_BG0CNT = BG_4BPP | BG_SIZE_LARGE | BG_CHARBLOCK(0) | BG_SCREENBLOCK(28);
    DMANow(3, SplashScreen_StartTiles, &CHARBLOCK[0], SplashScreen_StartTilesLen/2);
    DMANow(3, SplashScreen_StartMap, &SCREENBLOCK[28], SplashScreen_StartMapLen/2);
    DMANow(3, SplashScreenPal, PALETTE, SplashScreenPalLen/2);


}

void initInstructions() {

}

void initGame() {
    //initialize variables
    gameState = GAME;
    hOff = 0;
    vOff = ENCODE4(MAPWH - SCREENHEIGHT);
    

    //setup background(s)
    REG_DISPCTL |= BG1_ENABLE;
    REG_DISPCTL &= ~BG0_ENABLE;
    //As convention I am using charblock 0 for background 0 tiles and screenblocks 28-31 for displaying the background
    REG_BG1CNT = BG_4BPP | BG_SIZE_LARGE | BG_CHARBLOCK(1) | BG_SCREENBLOCK(28);
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

void resumeGame() {
    
}

void initPause() {

}

void initWin() {

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

void updateSplash() {
    static int menuState = OPTSTART;
    if (BUTTON_PRESSED(BUTTON_DOWN) && (menuState == OPTSTART)) {
        menuState = OPTINST;
        DMANow(3, SplashScreen_InstructionsTiles, &CHARBLOCK[0], SplashScreen_InstructionsTilesLen/2);
        DMANow(3, SplashScreen_InstructionsMap, &SCREENBLOCK[28], SplashScreen_InstructionsMapLen/2);
    }

    if (BUTTON_PRESSED(BUTTON_UP) && (menuState == OPTINST)) {
        menuState = OPTSTART;
        DMANow(3, SplashScreen_StartTiles, &CHARBLOCK[0], SplashScreen_StartTilesLen/2);
        DMANow(3, SplashScreen_StartMap, &SCREENBLOCK[28], SplashScreen_StartMapLen/2);
    }

    if (BUTTON_PRESSED(BUTTON_A)) {
        switch (menuState) {
            case OPTSTART:
                initGame();
                break;
            case OPTINST:
                initInstructions();
                break;
        }
    }
}

void updateInstructions() {

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

void updateWin() {

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
    REG_BG1HOFF = DECODE4(hOff);
    REG_BG1VOFF = DECODE4(vOff);
    DMANow(3, shadowOAM, OAM, 128 * 4);
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
        handleVBlank();
    }

    REG_IF = REG_IF;
    
    REG_IME = 1;
}