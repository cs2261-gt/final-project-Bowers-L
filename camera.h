#pragma once

#include "myLib.h"

#include "game.h"
#include "player.h"

typedef struct {
    int row;
    int col;
    int sbbrow;
    int sbbcol;
} Camera;

extern Camera camera;

void cameraDebug();
void initCamera();
void updateCamer();