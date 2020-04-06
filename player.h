#pragma once

#include "myLib.h"
#include "mapCollision.h"
#include "game.h"

typedef enum {
    LEFT, RIGHT
} PlayerState;

typedef struct {
    //animated sprite 
    int screenRow;
    int screenCol;
    int worldRow;
    int worldCol;
    int rdel;
    int cdel;
    int width;
    int height;
    int aniCounter;
    int aniState;
    int prevAniState;
    int curFrame;
    int numFrames;
    int hide;

    int raccel;
    int caccel;

    int accelCurve;
    int decelCurve;
    int maxSpeed;

    int isJumping;
    int jumpCounter;
    int jumpSpeed;
    int maxJump;
    int terminalVel;
    int gravity;

    int direction;
} Player;

extern Player player;
extern const int playerMaxSpeed;

void initPlayer();
void updatePlayer();

void handlePlayerInput();

void adjusthOff();
void adjustvOff();

int playerInAir();
int noCollisionLeft();
int noCollisionRight();