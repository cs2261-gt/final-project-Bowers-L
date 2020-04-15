#pragma once

#define LASERINDEX 11

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

    int index;
} Laser;

extern Laser lasers[10];

void initAllLasers();
void updateAllLasers();

void initLaser();
void updateLaser();
void showLaser();