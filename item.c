#include "item.h"

Item boots;
int itemCount = 0;

ItemType acquiredItems[10];

void initItem(Item* item, int col, int row, ItemType type) {
    itemCount++;

    item->worldRow = ENCODE4(row);
    item->worldCol = ENCODE4(col);
    item->screenRow = item->worldRow - camera.row;
    item->screenCol = item->worldCol - camera.col;
    item->width = ENCODE4(8);
    item->height = ENCODE4(8);
    item->curFrame = 0;
    item->numFrames = 60;
    item->hide = 1;
    item->acquired = 0;

    item->color1 = COLOR(16, 16, 16);
    item->color2 = COLOR(27, 27, 0);

    item->type = type;
    item->index = itemCount;

    for (int i = 0; i < 10; i++) {
        acquiredItems[i] = NONE;
    }

    shadowOAM[item->index].attr0 = (DECODE4(item->screenRow) & ROWMASK) | ATTR0_REGULAR | ATTR0_4BPP | ATTR0_SQUARE;
    shadowOAM[item->index].attr1 = (DECODE4(item->screenCol) & COLMASK) | ATTR1_TINY;
    shadowOAM[item->index].attr2 = ATTR2_TILEID(9, 0) | ATTR2_PALROW(0);
}

void updateItem(Item* item) {
    //item animates so that it swaps between two colors
    if (item->curFrame > item->numFrames / 2) {
        SPRITEPALETTE[4] = COLOR(lerp(27, 16, item->curFrame, item->numFrames / 2),
                                lerp(27, 16, item->curFrame, item->numFrames / 2),
                                0
                                );
    } else {
        SPRITEPALETTE[4] = COLOR(lerp(16, 27, item->curFrame, item->numFrames / 2),
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
    shadowOAM[1].attr0 = (DECODE4(item->screenRow) & ROWMASK) | ATTR0_REGULAR | ATTR0_4BPP | ATTR0_SQUARE;
    shadowOAM[1].attr1 = (DECODE4(item->screenCol) & COLMASK) | ATTR1_TINY;
    shadowOAM[1].attr2 = ATTR2_TILEID(0, 8) | ATTR2_PALROW(0);
    
    if (item->hide) {
        shadowOAM[1].attr0 |= ATTR0_HIDE;
    }
}

void equipItem(Item* item) {
    item->acquired = 1;
    item->hide = 1;
    shadowOAM[1].attr0 |= ATTR0_HIDE;
    
    int i = 0;
    while (acquiredItems[i] == NONE) {
        i++;
    }
    acquiredItems[i] = item->type;

    switch (item->type) {
        case BOOTS:
            player.jumpHeight = 1024;
            player.gravity = (2 * player.jumpHeight) / (player.jumpTime * player.jumpTime);
            player.jumpSpeed = player.gravity * player.jumpTime;
            break;
    }
}