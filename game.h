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

#include "player.h"

#define MAPWH 512

typedef enum {
    SPLASH, INSTRUCTIONS, GAME, PAUSED, WIN
} GameState;

typedef enum {
    OPTSTART, OPTINST, OPTRESUME, OPTQUIT
} MenuState;

extern GameState gameState;
extern MenuState menuState;
extern int hOff;
extern int vOff;

//used to look around the level without camera being tied to the player
extern int debug;

void init();

void initSplash();
void initInstructions();
void initGame();
void initPause();
void initWin();
void setupBackground();

void update();

void updateSplash();
void updateInstructions();
void updateGame();
void updatePause();
void updateWin();


//interrupts
void handleVBlank();
void setupDisplayInterrupt();
void interruptHandler();
