#pragma once

#include "myLib.h"

//backgrounds
#include "map.h"
#include "SplashScreen.h"
#include "SplashBack.h"
#include "InstructionsScreen.h"
#include "PauseScreen_Resume.h"
#include "PauseScreen_Quit.h"
#include "WinScreen.h"
#include "Spritesheet.h"


#include "game.h"
#include "camera.h"

//sounds
#include "sound.h"
#include "mus_start.h"
#include "mus_win.h"

#include "stdlib.h"

typedef enum {
    SPLASH, INSTRUCTIONS, GAME, PAUSED, WIN
} GameState;

typedef enum {
    OPTSTART, OPTINST, OPTRESUME, OPTQUIT
} MenuState;

extern GameState gameState;
extern MenuState menuState;

void initSplash();
void initInstructions();
void initPause();
void initWin();

void updateSplash();
void updateInstructions();
void updatePause();
void updateWin();