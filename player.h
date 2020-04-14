#pragma once

#include "myLib.h"
#include "mapCollision.h"
#include "game.h"

typedef enum {
    LEFT, RIGHT
} PlayerState;

typedef struct {
    //animated sprite stuff
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

    //acceleration
    int raccel;
    int caccel;

    //platforming factors
    int accelCurve;
    int decelCurve;
    int maxSpeed;
    int terminalVel;

    //jumping
    int isJumping;
    int jumpHeight;
    int jumpTime;
    int jumpSpeed;
    int gravity;

    int direction;
} Player;

//Player: OAM 0
extern Player player;
extern const int playerMaxSpeed;

void initPlayer();
void updatePlayer();
void showPlayer();

void handlePlayerInput();

void adjusthOff();
void adjustvOff();

int collisionLeft();
int collisionRight();
int collisionAbove();
int collisionBelow();

int resolveCollisionX();
int resolveCollisionY();