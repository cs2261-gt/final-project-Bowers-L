#pragma once

#include "myLib.h"

//backgrounds
#include "map.h"
#include "SplashScreen.h"
#include "InstructionsScreen.h"
#include "PauseScreen_Resume.h"
#include "PauseScreen_Quit.h"
#include "WinScreen.h"
#include "Spritesheet.h"

#include "game.h"

//sounds
#include "sound.h"
#include "mus_start.h"

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