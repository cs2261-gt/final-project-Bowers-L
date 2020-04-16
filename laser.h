#pragma once

#include "myLib.h"
#include "Spritesheet.h"
#include "camera.h"

#include "laser.h"

#define NULL ((void*) 0)

#define LASERINDEX 11
#define NUMLASERS 50

#define KNOCKBACK (ENCODE4(8))

typedef struct {
    int screenRow;
    int screenCol;
    int worldRow;
    int worldCol;
    int width;
    int height;
    int curFrame;
    int numFrames;
    int hide;
    int active;

    int type;   //0: normalVert, 1: tallVert, 2: normalHoriz, 3: wideHoriz

    int index;
} Laser;

extern Laser lasers[NUMLASERS];

void initAllLasers();
void updateAllLasers();
void showAllLasers();

void initLaser(Laser* laser, int col, int row, int tall);
void updateLaser(Laser* laser);
void showLaser(Laser* laser);

void laserSling();