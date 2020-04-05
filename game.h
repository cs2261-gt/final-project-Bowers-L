#pragma once 

#include "myLib.h"
#include "mapFlat.h"
#include "mapSBB.h"

typedef enum {
    START, GAME, PAUSED
} GameState;

typedef enum {
    TITLE
} MenuState;

extern GameState gameState;
extern int hOff;
extern int vOff;

extern ANISPRITE player;
extern const int playerMaxSpeed;

void init();

void initStart();
void initGame();
void initPause();
void setupBackground();

void update();

void updateStart();
void updateGame();
void updatePause();

void updatePlayer();

//interrupts
void handleVBlank();
void setupInterrupts();
void interruptHandler();
