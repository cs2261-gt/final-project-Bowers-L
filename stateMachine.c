#include "stateMachine.h"

void initSplash() {
    gameState = SPLASH;
    menuState = OPTSTART;

    REG_DISPCTL = MODE0 | BG0_ENABLE;
    REG_BG0CNT = BG_4BPP | BG_SIZE_SMALL | BG_CHARBLOCK(0) | BG_SCREENBLOCK(MAPSB - 1);
    DMANow(3, SplashScreen_StartTiles, &CHARBLOCK[0], SplashScreen_StartTilesLen/2);
    DMANow(3, SplashScreen_StartMap, &SCREENBLOCK[MAPSB - 1], SplashScreen_StartMapLen/2);
    DMANow(3, SplashScreenPal, PALETTE, 16);
}

void initInstructions() {
    gameState = INSTRUCTIONS;
    DMANow(3, InstructionsScreenTiles, &CHARBLOCK[0], InstructionsScreenTilesLen/2);
    DMANow(3, InstructionsScreenMap, &SCREENBLOCK[MAPSB - 1], InstructionsScreenMapLen/2);
}



void initPause() {
    gameState = PAUSED;
    menuState = OPTRESUME;
    //REG_DISPCTL = MODE0 | BG0_ENABLE;
    //REG_BG0CNT = BG_4BPP | BG_SIZE_SMALL | BG_CHARBLOCK(0) | BG_SCREENBLOCK(MAPSB - 1);

    DMANow(3, PauseScreen_ResumeTiles, &CHARBLOCK[0], PauseScreen_ResumeTilesLen/2);
    DMANow(3, PauseScreen_ResumeMap, &SCREENBLOCK[MAPSB - 1], PauseScreen_ResumeMapLen/2);
    //DMANow(3, PauseScreen_ResumePal, PALETTE, 16);
    
}

void initWin() {
    gameState = WIN;
    REG_DISPCTL &= ~SPRITE_ENABLE;
    REG_DISPCTL = MODE0 | BG0_ENABLE;
    REG_BG0CNT = BG_4BPP | BG_SIZE_SMALL | BG_CHARBLOCK(0) | BG_SCREENBLOCK(MAPSB - 1);

    DMANow(3, WinScreenTiles, &CHARBLOCK[0], WinScreenTilesLen/2);
    DMANow(3, WinScreenMap, &SCREENBLOCK[MAPSB - 1], WinScreenMapLen/2);
    DMANow(3, WinScreenPal, PALETTE, 16);
}

void updateSplash() {
    if (BUTTON_PRESSED(BUTTON_DOWN) && (menuState == OPTSTART)) {
        menuState = OPTINST;
        DMANow(3, SplashScreen_InstructionsTiles, &CHARBLOCK[0], SplashScreen_InstructionsTilesLen/2);
        DMANow(3, SplashScreen_InstructionsMap, &SCREENBLOCK[MAPSB - 1], SplashScreen_InstructionsMapLen/2);
    }

    if (BUTTON_PRESSED(BUTTON_UP) && (menuState == OPTINST)) {
        menuState = OPTSTART;
        DMANow(3, SplashScreen_StartTiles, &CHARBLOCK[0], SplashScreen_StartTilesLen/2);
        DMANow(3, SplashScreen_StartMap, &SCREENBLOCK[MAPSB - 1], SplashScreen_StartMapLen/2);
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

void updatePause() {
    if (BUTTON_PRESSED(BUTTON_DOWN) && (menuState == OPTRESUME)) {
        menuState = OPTQUIT;
        DMANow(3, PauseScreen_QuitTiles, &CHARBLOCK[0], PauseScreen_QuitTilesLen/2);
        DMANow(3, PauseScreen_QuitMap, &SCREENBLOCK[MAPSB - 1], PauseScreen_QuitMapLen/2);
    }

    if (BUTTON_PRESSED(BUTTON_UP) && (menuState == OPTQUIT)) {
        menuState = OPTRESUME;
        DMANow(3, PauseScreen_ResumeTiles, &CHARBLOCK[0], PauseScreen_ResumeTilesLen/2);
        DMANow(3, PauseScreen_ResumeMap, &SCREENBLOCK[MAPSB - 1], PauseScreen_ResumeMapLen/2);
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