#pragma once

#include "myLib.h"

#include "Spritesheet.h"

#include "camera.h"

//Items: OAM 1-10

typedef enum {
    NONE, BOOTS
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
    int acquired;

    u16 color1;
    u16 color2;

    ItemType type;
    int index;
} Item;

extern Item boots;
extern int itemCount;
extern ItemType acquiredItems[10];

void initItem(Item* item, int col, int row, ItemType type);

void updateItem(Item* item);
void showItem(Item* item);

int checkCollisionPlayer(Item* item);

void equipItem(Item* item);