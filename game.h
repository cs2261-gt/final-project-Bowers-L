#pragma once 

#include "myLib.h"
#include "Spritesheet.h"
#include "map.h"
#include "player.h"

#define MAPWH 512

typedef enum {
    START, GAME, PAUSED
} GameState;

typedef enum {
    TITLE
} MenuState;

extern GameState gameState;
extern int hOff;
extern int vOff;

//used to look around the level without camera being tied to the player
extern int debug;

void init();

void initStart();
void initGame();
void initPause();
void setupBackground();

void update();

void updateStart();
void updateGame();
void updatePause();

//interrupts
void handleVBlank();
void setupInterrupts();
void interruptHandler();
