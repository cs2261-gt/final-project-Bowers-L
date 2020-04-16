#pragma once

#include "myLib.h"

#include "Spritesheet.h"

#include "camera.h"

#define NUMITEMS 10

//Items: OAM 1-10

typedef enum {
    NONE, BOOTS, SHRINK, SPEED, GLOVES, Z
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
    int active;

    u16 color1;
    u16 color2;

    ItemType type;
    int index;
} Item;

extern Item items[NUMITEMS];
extern ItemType playerInventory[NUMITEMS];

void initItem(Item* item, int col, int row, ItemType type);

void updateItem(Item* item);
void showItem(Item* item);

int checkCollisionPlayer(Item* item);

void equipItem(Item* item);
void useItem(ItemType item);