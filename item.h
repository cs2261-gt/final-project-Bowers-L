#pragma once

#include "myLib.h"

#include "Spritesheet.h"

#include "camera.h"

#include "sound.h"
#include "mus_game2.h"

#define NUMITEMS 10

#define ITEMSLOTROW 8
#define ITEMSLOTCOL 8
#define ITEMSLOTSPACING 20

#define SELECTORPALINDEX 6
#define SELECTEDCOLOR (COLOR(0, 24, 0))
#define EQUIPPEDCOLOR (COLOR(13, 13, 0))

//Items: OAM 1-10

typedef enum {
    NONE, BOOTS, SHRINK, SPEED, GLOVES, Z, GRAVITY
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

void initAllItems(int cheat);
void updateAllItems();
void showAllItems();

int checkCollisionPlayer(Item* item);

void getItem(Item* item);
void useItem(ItemType item);

void showSelectorOnItem();