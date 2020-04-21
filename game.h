#pragma once 

#include "myLib.h"

#include "stateMachine.h"
#include "player.h"
#include "camera.h"
#include "item.h"
#include "laser.h"

//backgrounds
#include "GameOverlay.h"
#include "gameBackground.h"

//sound
#include "sound.h"
#include "mus_game1.h"

#define MAPWH 1024
#define MAPSB 22

//used to look around the level without camera being tied to the player
extern int debug;
extern int fadeIn;

void init();
void update();

void initGame();
void resumeGame();
void updateGame();

//do during vblank
void drawGame();

//misc
void setupMap();
void fade();


//interrupts
void setupDisplayInterrupt();
void interruptHandler();
