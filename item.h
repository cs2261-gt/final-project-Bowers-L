#pragma once

#include "myLib.h"

#include "Spritesheet.h"

#include "game.h"

//Items: OAM 1-10

typedef enum {
    BOOTS
} ItemType;

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

    u16 color1;
    u16 color2;
} Item;

extern Item boots;

void initItem(Item* item, int col, int row);

void updateItem(Item* item);
void showItem(Item* item);