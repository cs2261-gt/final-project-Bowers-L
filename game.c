#include "game.h"

GameState gameState;
MenuState menuState;
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
    menuState = OPTSTART;
    hOff = 0;
    vOff = 0;

    REG_DISPCTL |= BG0_ENABLE;
    REG_BG0CNT = BG_4BPP | BG_SIZE_SMALL | BG_CHARBLOCK(0) | BG_SCREENBLOCK(28);
    DMANow(3, SplashScreen_StartTiles, &CHARBLOCK[0], SplashScreen_StartTilesLen/2);
    DMANow(3, SplashScreen_StartMap, &SCREENBLOCK[28], SplashScreen_StartMapLen/2);
    DMANow(3, SplashScreenPal, PALETTE, SplashScreenPalLen/2);
}

void initInstructions() {
    gameState = INSTRUCTIONS;
    DMANow(3, InstructionsScreenTiles, &CHARBLOCK[0], InstructionsScreenTilesLen/2);
    DMANow(3, InstructionsScreenMap, &SCREENBLOCK[28], InstructionsScreenMapLen/2);
}

void initGame() {
    //initialize variables
    gameState = GAME;
    hOff = 0;
    vOff = ENCODE4(MAPWH - SCREENHEIGHT);
    
    //setup background(s)

    //As convention I am using charblock 0 for background 0 tiles and screenblocks 28-31 for displaying the large background
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

void resumeGame() {
    REG_DISPCTL |= SPRITE_ENABLE;
    gameState = GAME;

    REG_BG0CNT = BG_4BPP | BG_SIZE_LARGE | BG_CHARBLOCK(0) | BG_SCREENBLOCK(28);
    DMANow(3, mapTiles, &CHARBLOCK[0], mapTilesLen / 2);
    DMANow(3, mapMap, &SCREENBLOCK[28], mapMapLen / 2);
    DMANow(3, mapPal, PALETTE, mapPalLen / 2);

}

void initPause() {
    gameState = PAUSED;
    menuState = OPTRESUME;
    REG_DISPCTL &= ~SPRITE_ENABLE;
    REG_BG0CNT = BG_4BPP | BG_SIZE_SMALL | BG_CHARBLOCK(0) | BG_SCREENBLOCK(28);
    //waitForVBlank();    //need to do or else the offset update will lag

    DMANow(3, PauseScreen_ResumeTiles, &CHARBLOCK[0], PauseScreen_ResumeTilesLen/2);
    DMANow(3, PauseScreen_ResumeMap, &SCREENBLOCK[28], PauseScreen_ResumeMapLen/2);
    DMANow(3, PauseScreen_ResumePal, PALETTE, PauseScreen_ResumePalLen/2);
    
}

void initWin() {
    gameState = WIN;
    REG_DISPCTL &= ~SPRITE_ENABLE;
    REG_BG0CNT = BG_4BPP | BG_SIZE_SMALL | BG_CHARBLOCK(0) | BG_SCREENBLOCK(28);

    DMANow(3, WinScreenTiles, &CHARBLOCK[0], WinScreenTilesLen/2);
    DMANow(3, WinScreenMap, &SCREENBLOCK[28], WinScreenMapLen/2);
    DMANow(3, WinScreenPal, PALETTE, WinScreenPalLen/2);
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
    if (BUTTON_PRESSED(BUTTON_SELECT)) {
        initSplash();
    }
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
        showPlayer();
    } else {
        updatePlayer();
    }
}



void updatePause() {
    if (BUTTON_PRESSED(BUTTON_DOWN) && (menuState == OPTRESUME)) {
        menuState = OPTQUIT;
        DMANow(3, PauseScreen_QuitTiles, &CHARBLOCK[0], PauseScreen_QuitTilesLen/2);
        DMANow(3, PauseScreen_QuitMap, &SCREENBLOCK[28], PauseScreen_QuitMapLen/2);
    }

    if (BUTTON_PRESSED(BUTTON_UP) && (menuState == OPTQUIT)) {
        menuState = OPTRESUME;
        DMANow(3, PauseScreen_ResumeTiles, &CHARBLOCK[0], PauseScreen_ResumeTilesLen/2);
        DMANow(3, PauseScreen_ResumeMap, &SCREENBLOCK[28], PauseScreen_ResumeMapLen/2);
    }

    if (BUTTON_PRESSED(BUTTON_A)) {
        switch (menuState) {
            case OPTRESUME:
                resumeGame();
                break;
            case OPTQUIT:
                initSplash();
                break;
        }
    }
}

void updateWin() {
    if (BUTTON_PRESSED(BUTTON_SELECT)) {
        initSplash();
    }
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
    if (gameState == GAME) {
        REG_BG0HOFF = DECODE4(hOff);
        REG_BG0VOFF = DECODE4(vOff);
    DMANow(3, shadowOAM, OAM, 128 * 4);
    } else {
        REG_BG0HOFF = 0;
        REG_BG0VOFF = 0;
    }

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