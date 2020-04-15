#pragma once 

#include "myLib.h"

#include "stateMachine.h"
#include "player.h"
#include "camera.h"
#include "item.h"
#include "laser.h"

#define MAPWH 1024
#define MAPSB 22

//used to look around the level without camera being tied to the player
extern int debug;

void init();
void update();

void initGame();
void resumeGame();
void updateGame();

void drawGame();

void setupMap();


//interrupts
void setupDisplayInterrupt();
void interruptHandler();
