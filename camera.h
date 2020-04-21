#pragma once

#include "myLib.h"

#include "game.h"
#include "player.h"

#define SBBROWLEN (MAPWH / SBBWH)

typedef struct {
    //the camera's row/col is based on its actual world position so that sprites are handled properly
    int row;
    int col;

    //which sbb row/col is being used. 
    //The SBB to display is calculated using OFFSET(sbbcol, sbbrow, 2) (rowlen is 2 and not 4 because the indices increment by 2 going down)
    int sbbrow;
    int sbbcol;
} Camera;

extern Camera camera;


void initCamera();
void updateCamera();

void cameraDebug();
void centerCameraToPlayer();

void updateSBB();