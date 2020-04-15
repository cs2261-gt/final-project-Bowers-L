#include "laser.h"

//A lot of this is copy/paste from item.c for obvious reasons

Laser lasers[NUMLASERS];

void initAllLasers() {
    for (int i = 0; i < NUMLASERS; i++) {
        lasers[i].active = 0;
    }

    for (int i = 0; i < 4; i++) {
        initLaser(&lasers[i], 376, 704 - i*16, 1);

    }
    for (int i = 4; i < 12; i++) {
        initLaser(&lasers[i], 64, 704 - (i-4)*16, 1);
        initLaser(&lasers[i+8], 80, 704 - (i-4)*16, 1);
    }

    for (int i = 20; i < 38; i++) {
        initLaser(&lasers[i], 360 - i*16, 648, 3);
    }
}

void initLaser(Laser* laser, int col, int row, int type) {
    static int laserCount = 0;

    laser->worldRow = ENCODE4(row);
    laser->worldCol = ENCODE4(col);
    laser->screenRow = laser->worldRow - camera.row;
    laser->screenCol = laser->worldCol - camera.col;
    laser->width = ENCODE4(8);
    laser->height = ENCODE4(8 + tall*8);
    laser->curFrame = 0;
    laser->numFrames = 60;
    laser->hide = 1;
    laser->active = 1;

    laser->type = type;

    laser->index = laserCount + LASERINDEX;
    laserCount++;

    if (laser->type % 2 == 0) {
        //normal
        shadowOAM[laser->index].attr0 = (DECODE4(laser->screenRow) & ROWMASK) | ATTR0_REGULAR | ATTR0_4BPP | ATTR0_SQUARE;   
    } else {
        if (laser->type == 1) {
            shadowOAM[laser->index].attr0 = (DECODE4(laser->screenRow) & ROWMASK) | ATTR0_REGULAR | ATTR0_4BPP | ATTR0_TALL;
        } else {
            shadowOAM[laser->index].attr0 = (DECODE4(laser->screenRow) & ROWMASK) | ATTR0_REGULAR | ATTR0_4BPP | ATTR0_WIDE;
        }
        
    }
    
    shadowOAM[laser->index].attr1 = (DECODE4(laser->screenCol) & COLMASK) | ATTR1_TINY;
    shadowOAM[laser->index].attr2 = ATTR2_TILEID(2, (laser->curFrame / (laser->numFrames / 4)) * 2) | ATTR2_PALROW(0);
}

void updateAllLasers() {
    for (int i = 0; i < NUMLASERS; i++) {
        if (lasers[i].active) {
            updateLaser(&lasers[i]);
        }
    }
}

void updateLaser(Laser* laser) {
    //laser animation
    
    laser->curFrame++;
    if (laser->curFrame >= laser->numFrames) {
        laser->curFrame = 0;
    }

    if (laser->hide == 0 && checkCollisionPlayerLaser(laser)) {
        int direction = player.worldCol - laser->worldCol;
        player.worldCol += signOf(direction) * KNOCKBACK;
        player.cdel = 0;
    }
}

int checkCollisionPlayerLaser(Laser* laser) {
    return collision(player.worldCol, player.worldRow, player.width, player.height, laser->worldCol, laser->worldRow, laser->width, laser->height);
}

void showAllLasers() {
    for (int i = 0; i < NUMLASERS; i++) {
        if (lasers[i].active) {
            showLaser(&lasers[i]);
        }
    }
}

void showLaser(Laser* laser) {
    laser->screenRow = laser->worldRow - camera.row;
    laser->screenCol = laser->worldCol - camera.col;

    //determine whether to hide sprite
    if ((laser->screenRow < -laser->height) || (laser->screenRow > ENCODE4(SCREENHEIGHT - 1))
        || (laser->screenCol < -laser->width) || (laser->screenCol > ENCODE4(SCREENWIDTH - 1))) {
        laser->hide = 1;
    } else {
        laser->hide = 0;
    }

    //set the OAM
    if (laser->tall) {
        shadowOAM[laser->index].attr0 = (DECODE4(laser->screenRow) & ROWMASK) | ATTR0_REGULAR | ATTR0_4BPP | ATTR0_TALL;
    } else {
        shadowOAM[laser->index].attr0 = (DECODE4(laser->screenRow) & ROWMASK) | ATTR0_REGULAR | ATTR0_4BPP | ATTR0_SQUARE;
    }
    
    shadowOAM[laser->index].attr1 = (DECODE4(laser->screenCol) & COLMASK) | ATTR1_TINY;
    shadowOAM[laser->index].attr2 = ATTR2_TILEID(2, (laser->curFrame / (laser->numFrames / 4)) * 2) | ATTR2_PALROW(0);
    
    if (laser->hide) {
        shadowOAM[laser->index].attr0 |= ATTR0_HIDE;
    }
}