#include "laser.h"

Laser lasers[10];

void initAllLasers() {
    for (int i = 0; i < NUMITEMS; i++) {
        items[i].active = 0;
        playerInventory[i] = NONE;
    }

    initLaser()
}

void initItem(Laser* laser, int col, int row) {
    static int laserCount = 0;
    itemCount++;

    laser->worldRow = ENCODE4(row);
    laser->worldCol = ENCODE4(col);
    laser->screenRow = laser->worldRow - camera.row;
    laser->screenCol = laser->worldCol - camera.col;
    laser->width = ENCODE4(8);
    laser->height = ENCODE4(8);
    laser->curFrame = 0;
    laser->numFrames = 60;
    laser->hide = 1;
    laser->active = 1;

    laser->color1 = COLOR(16, 16, 16);
    laser->color2 = COLOR(27, 27, 0);

    laser->type = type;
    laser->index = itemCount;

    shadowOAM[item->index].attr0 = (DECODE4(item->screenRow) & ROWMASK) | ATTR0_REGULAR | ATTR0_4BPP | ATTR0_SQUARE;
    shadowOAM[item->index].attr1 = (DECODE4(item->screenCol) & COLMASK) | ATTR1_TINY;
    shadowOAM[item->index].attr2 = ATTR2_TILEID(9, 0) | ATTR2_PALROW(0);
}

void updateAllItems() {
    for (int i = 0; i < NUMITEMS; i++) {
        if (items[i].active) {
            updateItem(&items[i]);
        }
    }
}

void updateItem(Item* item) {
    //item animates so that it swaps between two colors
    if (item->curFrame > item->numFrames / 2) {
        SPRITEPALETTE[2] = COLOR(lerp(27, 16, item->curFrame, item->numFrames / 2),
                                lerp(27, 16, item->curFrame, item->numFrames / 2),
                                0
                                );
    } else {
        SPRITEPALETTE[2] = COLOR(lerp(16, 27, item->curFrame, item->numFrames / 2),
                                lerp(16, 27, item->curFrame, item->numFrames / 2),
                                lerp(16, 0, item->curFrame, item->numFrames / 2)
                                );
    }

    
    item->curFrame++;
    if (item->curFrame > item->numFrames) {
        item->curFrame = 0;
    }

    if (item->hide == 0 && checkCollisionPlayer(item)) {
        equipItem(item);
    }
}

int checkCollisionPlayer(Item* item) {
    return collision(player.worldCol, player.worldRow, player.width, player.height, item->worldCol, item->worldRow, item->width, item->height);
}

void showAllItems() {
    for (int i = 0; i < NUMITEMS; i++) {
        if (items[i].active) {
            showItem(&items[i]);
        }
    }
}

void showItem(Item* item) {
    item->screenRow = item->worldRow - camera.row;
    item->screenCol = item->worldCol - camera.col;

    //determine whether to hide sprite
    if ((item->screenRow < -item->height) || (item->screenRow > ENCODE4(SCREENHEIGHT - 1))
        || (item->screenCol < -item->width) || (item->screenCol > ENCODE4(SCREENWIDTH - 1))) {
        item->hide = 1;
    } else {
        item->hide = 0;
    }

    //set the OAM
    shadowOAM[item->index].attr0 = (DECODE4(item->screenRow) & ROWMASK) | ATTR0_REGULAR | ATTR0_4BPP | ATTR0_SQUARE;
    shadowOAM[item->index].attr1 = (DECODE4(item->screenCol) & COLMASK) | ATTR1_TINY;
    shadowOAM[item->index].attr2 = ATTR2_TILEID(0, 8) | ATTR2_PALROW(0);
    
    if (item->hide) {
        shadowOAM[item->index].attr0 |= ATTR0_HIDE;
    }
}