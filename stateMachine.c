#include "stateMachine.h"

void initSplash() {
    gameState = SPLASH;
    menuState = OPTSTART;

    REG_DISPCTL = MODE0 | BG0_ENABLE | BG2_ENABLE;
    REG_BG0CNT = BG_4BPP | BG_SIZE_SMALL | BG_CHARBLOCK(0) | BG_SCREENBLOCK(MAPSB - 1);
    REG_BG2CNT = BG_4BPP | BG_SIZE_SMALL | BG_CHARBLOCK(2) | BG_SCREENBLOCK(MAPSB - 2);

    DMANow(3, SplashScreen_StartTiles, &CHARBLOCK[0], SplashScreen_StartTilesLen/2);
    DMANow(3, SplashScreen_StartMap, &SCREENBLOCK[MAPSB - 1], SplashScreen_StartMapLen/2);
    DMANow(3, SplashScreenPal, PALETTE, 16);

    DMANow(3, SplashBackTiles, &CHARBLOCK[2], SplashScreen_StartTilesLen/2);
    DMANow(3, SplashBackMap, &SCREENBLOCK[MAPSB - 2], SplashScreen_StartMapLen/2);
    DMANow(3, &SplashBackPal[16], &PALETTE[16], 16);
}

void initInstructions() {
    gameState = INSTRUCTIONS;
    REG_DISPCTL = MODE0 | BG0_ENABLE;
    DMANow(3, InstructionsScreenTiles, &CHARBLOCK[0], InstructionsScreenTilesLen/2);
    DMANow(3, InstructionsScreenMap, &SCREENBLOCK[MAPSB - 1], InstructionsScreenMapLen/2);
}



void initPause() {
    gameState = PAUSED;
    menuState = OPTRESUME;
    REG_DISPCTL = MODE0 | BG0_ENABLE | BG1_ENABLE | BG2_ENABLE;
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

    glitchEffect();
}

void glitchEffect() {
    static int glitchCounter = 0;
    static int duration;
    if (rand() % 50 == 1) {
        glitchCounter = 1;
        duration = rand() % 10;
    }

    if (glitchCounter) {
        REG_BG0CNT = BG_4BPP | BG_SIZE_SMALL | BG_CHARBLOCK(0) | BG_SCREENBLOCK(MAPSB - 1) | BG_MOSAIC;
        REG_MOSAIC = MOSAIC_HORIZ_BG(rand() % 15);
        glitchCounter++;
        if (glitchCounter >= duration) {
            glitchCounter = 0;
        }
    } else {
        REG_BG0CNT = BG_4BPP | BG_SIZE_SMALL | BG_CHARBLOCK(0) | BG_SCREENBLOCK(MAPSB - 1);
    }
}

void updateInstructions() {
    if (BUTTON_PRESSED(BUTTON_SELECT)) {
        initSplash();
    }

    glitchEffect();
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
                playSoundA(mus_start, MUS_STARTLEN, 1);
                break;
        }
    }
}

void updateWin() {
    if (BUTTON_PRESSED(BUTTON_SELECT)) {
        initSplash();
        playSoundA(mus_start, MUS_STARTLEN, 1);
    }
}