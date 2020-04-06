#pragma once

#include "myLib.h"
#include "game.h"

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
} Player;

extern Player player;
extern const int playerMaxSpeed;

void initPlayer();
void updatePlayer();

void handlePlayerInput();