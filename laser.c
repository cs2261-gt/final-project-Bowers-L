#include "laser.h"

//A lot of this is copy/paste from item.c for obvious reasons

Laser lasers[NUMLASERS];
SlingData* nearestLaser;

void initAllLasers() {
    for (int i = 0; i < NUMLASERS; i++) {
        lasers[i].active = 0;
    }

    for (int i = 0; i < 4; i++) {
        initLaser(&lasers[i], 376, 704 - i*16, 1);

    }
    for (int i = 4; i < 12; i++) {
        initLaser(&lasers[i], 64, 704 - (i-4)*16, 1);
        if (i != 4) {
            initLaser(&lasers[i+8], 80, 704 - (i-4)*16, 1);
        }
    }

    for (int i = 20; i < 39; i++) {
        initLaser(&lasers[i], 376 - (i-20)*16, 656, 3);
    }

    for (int i = 39; i < 42; i++) {
        initLaser(&lasers[i], 632 , 488 - (i-39)*16, 1);
    }
    
    for (int i = 42; i < 44; i++) {
        initLaser(&lasers[i], 664, 448 - (i - 42)*16, 1);
    }
    initLaser(&lasers[44], 632, 416, 1);

    initLaser(&lasers[45], 472, 304, 1);
    initLaser(&lasers[46], 472, 288, 1);
    initLaser(&lasers[47], 472, 280, 0);

    initLaser(&lasers[48], 472, 232, 1);
    initLaser(&lasers[49], 472, 216, 1);

    initLaser(&lasers[50], 504, 200, 1);
    initLaser(&lasers[51], 504, 184, 1);

    /*
    initLaser(&lasers[52], 472, 168, 1);
    initLaser(&lasers[53], 472, 160, 0);
    
    initLaser(&lasers[54], 504, 152, 1);
    initLaser(&lasers[55], 504, 144, 0);

    initLaser(&lasers[56], 472, 136, 1);
    initLaser(&lasers[57], 472, 128, 0);
    */

    initLaser(&lasers[58], 504, 120, 1);
    initLaser(&lasers[59], 504, 112, 0);

    initLaser(&lasers[60], 288, 112, 3);
    initLaser(&lasers[61], 304, 112, 2);

    /*
    for (int i = 62; i < 65; i++) {
        initLaser(&lasers[i], 464, 32 - (i - 62) * 16, 3);
    }
    */

    //test lasers
    //initLaser(&lasers[38], 192, 984, 1);
}

void initLaser(Laser* laser, int col, int row, int type) {
    static int laserCount = 0;

    laser->worldRow = ENCODE4(row);
    laser->worldCol = ENCODE4(col);
    laser->screenRow = laser->worldRow - camera.row;
    laser->screenCol = laser->worldCol - camera.col;
    if (laser->type == 3) {
        laser->width = ENCODE4(16);
    } else {
        laser->width = ENCODE4(8);
    }
    if (laser->type == 1) {
        laser->height = ENCODE4(16);
    } else {
        laser->height = ENCODE4(8);
    }
    laser->curFrame = 0;
    laser->numFrames = 60;
    laser->hide = 1;
    laser->active = 1;

    laser->type = type;

    laser->index = laserCount + LASERINDEX;
    laserCount++;

    if (laser->type % 2 == 0) {
        //normal
        shadowOAM[laser->index].attr0 = (DECODE4(laser->screenRow) & ROWMASK) | ATTR0_HIDE | ATTR0_4BPP | ATTR0_SQUARE;   
    } else {
        if (laser->type == 1) {
            //tall vert
            shadowOAM[laser->index].attr0 = (DECODE4(laser->screenRow) & ROWMASK) | ATTR0_HIDE | ATTR0_4BPP | ATTR0_TALL;
        } else {
            //wide horiz
            shadowOAM[laser->index].attr0 = (DECODE4(laser->screenRow) & ROWMASK) | ATTR0_HIDE | ATTR0_4BPP | ATTR0_WIDE;
        }
        
    }
    
    shadowOAM[laser->index].attr1 = (DECODE4(laser->screenCol) & COLMASK) | ATTR1_TINY;

    if (laser->type > 1) {
        shadowOAM[laser->index].attr2 = ATTR2_TILEID(SPRITESHEETINDEX+1, (laser->curFrame / (laser->numFrames / 4))) | ATTR2_PALROW(0);
    } else {
        shadowOAM[laser->index].attr2 = ATTR2_TILEID(SPRITESHEETINDEX, (laser->curFrame / (laser->numFrames / 4)) * 2) | ATTR2_PALROW(0);
    }
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
        if (laser->type > 1) {
            int direction = player.worldRow - laser->worldRow;
            player.worldRow += signOf(direction) * KNOCKBACK;
            player.rdel = 0;
        } else {
            int direction = player.worldCol - laser->worldCol;
            player.worldCol += signOf(direction) * KNOCKBACK;
            player.cdel = 0;
        }
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
    if (laser->type % 2 == 0) {
        //normal
        shadowOAM[laser->index].attr0 = (DECODE4(laser->screenRow) & ROWMASK) | ATTR0_REGULAR | ATTR0_4BPP | ATTR0_SQUARE;   
    } else {
        if (laser->type == 1) {
            //tall vert
            shadowOAM[laser->index].attr0 = (DECODE4(laser->screenRow) & ROWMASK) | ATTR0_REGULAR | ATTR0_4BPP | ATTR0_TALL;
        } else {
            //wide horiz
            shadowOAM[laser->index].attr0 = (DECODE4(laser->screenRow) & ROWMASK) | ATTR0_REGULAR | ATTR0_4BPP | ATTR0_WIDE;
        }
        
    }
    
    shadowOAM[laser->index].attr1 = (DECODE4(laser->screenCol) & COLMASK) | ATTR1_TINY;

    if (laser->type > 1) {
        shadowOAM[laser->index].attr2 = ATTR2_TILEID(SPRITESHEETINDEX+1, (laser->curFrame / (laser->numFrames / 4))) | ATTR2_PALROW(0);
    } else {
        shadowOAM[laser->index].attr2 = ATTR2_TILEID(SPRITESHEETINDEX, (laser->curFrame / (laser->numFrames / 4)) * 2) | ATTR2_PALROW(0);
    }

    if (laser->hide) {
        shadowOAM[laser->index].attr0 |= ATTR0_HIDE;
    }
}

SlingData* findCloseLaser() {
    for (int i = 0; i < NUMLASERS; i++) {
        if (lasers[i].active && !lasers[i].hide) {
            //laser is active, on the screen
            int distance;
            if (lasers[i].type > 1) {
                distance = lasers[i].worldRow - player.worldRow;
            } else {
                distance = lasers[i].worldCol - player.worldCol;
            }

            if (distance < ENCODE4(16) && distance > -ENCODE4(16)) {
                SlingData* data = (SlingData*) malloc(sizeof(SlingData));
                if (data == NULL) {
                    return NULL;
                }
                data->laser = &lasers[i];
                data->distance = distance;
                
                return data;
            }
        }
    }

    return NULL;
}