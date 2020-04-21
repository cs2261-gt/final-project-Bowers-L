#include "player.h"

Player player;
short sinLut[360];
SlingData* nearestLaser;

void initPlayer() {
    player.worldRow = ENCODE4(MAPWH - 32);
    player.worldCol = ENCODE4(30);
    player.screenRow = player.worldRow - camera.row;
    player.screenCol = player.worldCol - camera.col;
    player.rdel = 0;
    player.cdel = 0;
    player.width = ENCODE4(8);
    player.height = ENCODE4(16);
    player.hide = 1;

    player.raccel = 0;
    player.caccel = 0;

    player.accelCurve = 4;
    player.decelCurve = 8;
    player.maxSpeed = 16;
    player.hardSpeedCap = 128;
    player.terminalVel = 64;

    //Note: Normal jump speed: 512, High jump speed: ~700
    player.isJumping = 0;
    player.jumpHeight = 512;
    player.jumpTime = 16;
    
    player.gravity = (2 * player.jumpHeight) / (player.jumpTime * player.jumpTime);
    player.jumpSpeed = player.gravity * player.jumpTime;

    player.direction = 0;

    player.currentItem = 0;
    player.shrunk = 0;
    player.canWallJump = 0;

    player.rotation = 90;   //start out on side

    

    //animations
    player.aniState = IDLE;
    player.curFrame = 0;
    player.numFrames = 4;
    player.aniSpeed = 15;
    player.isIdle = 1;
    player.specialAnim = GETUP;

    generateSinLut(sinLut, 360);
}

void updatePlayer() {
    if (player.specialAnim) {
        switch (player.specialAnim) {
            case GETUP:
                getUpAnimation();
                break;
            case LASER:
                laserSlingAnimation();
                break;
        }
    } else {
        handlePlayerInput();

        //simulate gravity
        if (touchingGround()) {
            player.raccel = 0;
        } else {
            if (player.canWallJump && (collisionRight(2) || collisionLeft(2))) {
                player.raccel = player.gravity / 2;
            } else {
                player.raccel = player.gravity;
            }
        }
    }

    //update player velocity
    player.rdel = clamp(player.rdel + player.raccel, -player.hardSpeedCap, player.terminalVel);
    player.cdel = clamp(player.cdel + player.caccel, -player.hardSpeedCap, player.hardSpeedCap);

    //update player's world and screen positions
    player.worldCol = clamp(player.worldCol + player.cdel, 0, ENCODE4(MAPWH) - player.width);
    player.worldRow = clamp(player.worldRow + player.rdel, -64, ENCODE4(MAPWH) - player.height);
    resolveCollisions();
}

void showPlayer() {
    //adjust screen coordinates to match world coordinates
    player.screenRow = player.worldRow - camera.row;
    player.screenCol = player.worldCol - camera.col;

    if (!player.shrunk) {
        player.screenRow -= (player.height / 2) * sinLut[(player.rotation+90) % 360] * signOf(sinLut[(player.rotation+90) % 360]) / 256;
        player.screenRow -= (player.width / 2) * sinLut[(player.rotation) % 360] * signOf(sinLut[(player.rotation) % 360]) / 256;
        player.screenCol -= (player.width / 2) * sinLut[(player.rotation+90) % 360] * signOf(sinLut[(player.rotation+90) % 360]) / 256;
        player.screenCol -= (player.height / 2) * sinLut[(player.rotation) % 360] * signOf(sinLut[(player.rotation) % 360]) / 256;
    }

    if ((player.screenRow < -player.height) || (player.screenRow > ENCODE4(SCREENHEIGHT - 1))
        || (player.screenCol < -player.width) || (player.screenCol > ENCODE4(SCREENWIDTH - 1))) {
        player.hide = 1;
    } else {
        player.hide = 0;
    }
    
    if (player.hide) {
        shadowOAM[0].attr0 |= ATTR0_HIDE;
    }
    if (player.shrunk) {
        shadowOAM[0].attr0 = (DECODE4(player.screenRow) & ROWMASK) | ATTR0_REGULAR | ATTR0_4BPP | ATTR0_SQUARE | ATTR0_BLEND;
        shadowOAM[0].attr1 = (DECODE4(player.screenCol) & COLMASK) | ATTR1_TINY;
        shadowOAM[0].attr2 = ATTR2_TILEID(NUMSTATES + player.aniState, (player.curFrame / player.aniSpeed)) | ATTR2_PALROW(0);
    } else {
        shadowOAM[0].attr0 = (DECODE4(player.screenRow) & ROWMASK) | ATTR0_DOUBLEAFFINE | ATTR0_4BPP | ATTR0_TALL | ATTR0_BLEND;
        shadowOAM[0].attr1 = (DECODE4(player.screenCol) & COLMASK) | ATTR1_TINY | ATTR1_AFFINE(0);
        shadowOAM[0].attr2 = ATTR2_TILEID(0 + player.aniState, (player.curFrame / player.aniSpeed)*2) | ATTR2_PALROW(0);
    }

    setTransform(0, 1, 1, player.rotation);
    
    if (!player.isIdle) {
        player.curFrame++;
        player.curFrame = player.curFrame % (player.numFrames * player.aniSpeed);
    }

}


void handlePlayerInput() {
    if (!BUTTON_HELD(BUTTON_LEFT) && !BUTTON_HELD(BUTTON_RIGHT)) {
        //if (touchingGround()) {

        //}

        if (signOf(player.direction) == signOf(player.cdel)) {
            //implement friction to slow down player
            player.caccel = -1 * signOf(player.direction) * player.decelCurve;
        } else {
            player.cdel = 0;
            player.caccel = 0;
        }
        player.aniState = IDLE;
    } else {
        if (BUTTON_HELD(BUTTON_LEFT)) {
            player.direction = -1;
            if (player.worldCol > 0) {
                if (player.cdel > -player.maxSpeed) {
                    player.caccel = -player.accelCurve;
                } else {
                    player.caccel = 0;
                }
            }
            
            if (touchingGround()) {
                player.isIdle = 0;
                if (player.cdel < -32) {
                    player.aniState = SPEEDLEFT;
                } else {
                    player.aniState = LEFT;
                }
            }
        }
        if (BUTTON_HELD(BUTTON_RIGHT)) {
            player.direction = 1;
            if (player.worldCol < ENCODE4(MAPWH) - player.width) {
                if (player.cdel < player.maxSpeed) {
                    player.caccel = player.accelCurve;
                } else {
                    player.caccel = 0;
                }
            }

            if (touchingGround()) {
                player.isIdle = 0;
                if (player.cdel > 32) {
                    player.aniState = SPEEDRIGHT;
                } else {
                    player.aniState = RIGHT;
                }
            }
        }
    }

    //Jumping

    if (BUTTON_PRESSED(BUTTON_A)) {
        if (touchingGround()
        || (player.canWallJump && (collisionLeft(2) || collisionRight(2)))
         ) {
            player.isJumping = 1;
            player.rdel = -player.jumpSpeed;
            player.isIdle = 1;
            player.curFrame = 0;
        }

    }

    if (!BUTTON_HELD(BUTTON_A)) {
        if (player.isJumping) {
            player.rdel = 0;
            player.isJumping = 0;
        }
    }

    //Items

    if (BUTTON_PRESSED(BUTTON_B)) {
        useItem(playerInventory[player.currentItem]);
    }

    if (BUTTON_PRESSED(BUTTON_L)) {
        if (player.currentItem > 0 && playerInventory[player.currentItem-1] != NONE) {
            player.currentItem--;

            showSelectorOnItem();
        }
    }

    if (BUTTON_PRESSED(BUTTON_R)) {
        if (player.currentItem < NUMITEMS - 1 && playerInventory[player.currentItem+1] != NONE) {
            player.currentItem++;

            showSelectorOnItem();
        }
    }
}

/*
* * * * * * * *
*             *
*             *
*             *
*             *
*             *
*             *
*             *
*             *
*             *
*             *
*             *
*             *
*             *
*             *
* * * * * * * *
*/

int collisionLeft(int offset) {
    return player.worldCol < 0
        || mapCollisionBitmap[OFFSET(DECODE4(player.worldCol) - offset, DECODE4(player.worldRow) , MAPWH)]
        || mapCollisionBitmap[OFFSET(DECODE4(player.worldCol) - offset, DECODE4(player.worldRow + player.height) - 1, MAPWH)];
}

int collisionRight(int offset) {
    return player.worldCol + player.width >= ENCODE4(MAPWH)
        || mapCollisionBitmap[OFFSET(DECODE4(player.worldCol + player.width) + offset, DECODE4(player.worldRow), MAPWH)]
        || mapCollisionBitmap[OFFSET(DECODE4(player.worldCol + player.width) + offset, DECODE4(player.worldRow + player.height) - 1, MAPWH)];
}

int collisionAbove(int offset) {
    return mapCollisionBitmap[OFFSET(DECODE4(player.worldCol), DECODE4(player.worldRow) - offset, MAPWH)]
        || mapCollisionBitmap[OFFSET(DECODE4(player.worldCol + player.width) - 1, DECODE4(player.worldRow) - offset, MAPWH)];
}

int collisionBelow(int offset) {
    return player.worldRow + player.height >= ENCODE4(MAPWH)
        || mapCollisionBitmap[OFFSET(DECODE4(player.worldCol), DECODE4(player.worldRow + player.height) - 1 + offset, MAPWH)]
        || mapCollisionBitmap[OFFSET(DECODE4(player.worldCol + player.width) - 1, DECODE4(player.worldRow + player.height) - 1 + offset, MAPWH)];
}

int touchingGround() {
    if (player.gravity > 0) {
        return mapCollisionBitmap[OFFSET(DECODE4(player.worldCol), DECODE4(player.worldRow + player.height), MAPWH)]
        || mapCollisionBitmap[OFFSET(DECODE4(player.worldCol + player.width) - 1, DECODE4(player.worldRow + player.height), MAPWH)];
    } else {
        return mapCollisionBitmap[OFFSET(DECODE4(player.worldCol), DECODE4(player.worldRow) - 1, MAPWH)]
        || mapCollisionBitmap[OFFSET(DECODE4(player.worldCol + player.width) - 1, DECODE4(player.worldRow) - 1, MAPWH)];  
    }

}

/*
Collisions: 
The current method of handling collisions waits until the player's position conflicts with an occupied
pixel in the collision map and resolves it by pushing the player in the direction that results in the shortest
distance traveled for there not to be a collision. 

The main arguable downside is a rounding effect on corners of overhead platforms where the 
player clips to the left or right edge rather than being stopped by the corner.

Update:
-less off by one errors
-bug with corners when moving down (player teleporting to other side of platform)
-rounded off corners to make these less frequent
*/
int resolveCollisions() {
    int xDepth = 0;
    int yDepth = 0;

    //so don't have to recalculate these
    int collisionOnLeft = 0;
    int collisionOnAbove = 0;

    int step = 2;

    if (collisionLeft(0)) {
        collisionOnLeft = 1;
        while (collisionLeft(0)) {
            player.worldCol += step;
            xDepth++;
        }
        player.worldCol -= xDepth * step;
    } else {
        while (collisionRight(0)) {
            player.worldCol-= step;
            xDepth++;
        }
        player.worldCol += xDepth * step;
    }

    if (collisionAbove(0)) {
        collisionOnAbove = 1;
        while (collisionAbove(0)) {
            player.worldRow += step;
            yDepth++;
        }
        player.worldRow -= yDepth * step;
    } else {
        while (collisionBelow(0)) {
            player.worldRow-= step;
            yDepth++;
        }
        player.worldRow += yDepth * step;
    }

    if (xDepth <= yDepth) {
        if (xDepth != 0) {
            player.cdel = 0;
        }
        if (collisionOnLeft) {
            player.worldCol += xDepth * step;
        } else {
            player.worldCol -= xDepth * step;
        }
        //round the position to a multiple of 16 (need to this or else off by one errors occur on right side collisions)
        player.worldCol = roundbase(player.worldCol, 16);
    } else {
        if (yDepth != 0) {
            player.rdel = 0;
        }
        if (collisionOnAbove) {
            player.worldRow += yDepth * step;
        } else {
            player.worldRow -= yDepth * step;
        }
        //round the position to a multiple of 16 (need to this or else off by one errors occur when collision is below)
    }
}

void equipBoots() {
    if (player.jumpHeight == 1024) {
        player.jumpHeight = 512;
        player.jumpTime = 16;
        equipCurrentItem(0);
    } else {
        player.jumpHeight = 1024;
        player.jumpTime = 20;
        equipCurrentItem(1);
    }


    player.gravity = (2 * player.jumpHeight) / (player.jumpTime * player.jumpTime);
    player.jumpSpeed = player.gravity * player.jumpTime;
}

void shrinkPlayer() {
    if (player.shrunk) {
        if (!collisionAbove(8)) {
            player.shrunk = 0;
            player.height = ENCODE4(16);
            player.worldRow -= ENCODE4(8);
            equipCurrentItem(0);
        } 
    } else {
        player.shrunk = 1;
        player.height = ENCODE4(8);
        equipCurrentItem(1);
    }
}

void equipLegs() {
    if (player.maxSpeed == 16) {
        player.maxSpeed = 64;
        equipCurrentItem(1);
    } else {
        player.maxSpeed = 16;
        equipCurrentItem(0);
    }
}

void equipGloves() {
    if (player.canWallJump) {
        player.canWallJump = 0;
        equipCurrentItem(0);
    } else {
        player.canWallJump = 1;
        equipCurrentItem(1);
    }
}

void startLaserSling() {
    nearestLaser = findCloseLaser();
    if (nearestLaser) {
        playSoundB(snd_Ding, SND_DINGLEN, 0);
        player.specialAnim = LASER;
    }
}

void finishLaserSling() {
    playSoundB(snd_Zap, SND_ZAPLEN, 0);
    if (nearestLaser->laser->type > 1) {
        player.worldRow += 2 * nearestLaser->distance;
        player.rdel = nearestLaser->distance / 4;
    } else {
        player.worldCol += 2 * nearestLaser->distance;
        player.cdel = nearestLaser->distance / 4;
    }
    free(nearestLaser);
}

void reverseGravity() {
    player.gravity *= -1;
    player.jumpSpeed *= -1;
    player.rotation = (player.rotation + 180) % 360;
}

void equipCurrentItem(int equip) {
    if (equip) {
        PALETTE[SELECTORPALINDEX + player.currentItem] = EQUIPPEDCOLOR;
    } else {
        PALETTE[SELECTORPALINDEX + player.currentItem] = BLACK;
    }
}

void setTransform(int index, short scalex, short scaley, int deg) {
    shadowOAMAffine[index].a = sinLut[(deg+90)%360] / scalex;
    shadowOAMAffine[index].b = -sinLut[(deg)%360] / scalex;
    shadowOAMAffine[index].c = sinLut[(deg)%360] / scaley;
    shadowOAMAffine[index].d = sinLut[(deg+90)%360] / scaley;
}

void generateSinLut(short table[], size_t size) {
    for (int i = 0; i < size; i++) {
        table[i] = (short) (256 * sin(i*PI / 180));
    }
}

void getUpAnimation() {
    static int numFrames = 240;
    static int curFrame = 0;

    if (curFrame > 120 && player.rotation > 0) {
        player.rotation--;
    }

    curFrame++;
    if (curFrame == numFrames) {
        player.specialAnim = 0;   
    }
}

void laserSlingAnimation() {
    static int numFrames = 60;
    static int curFrame = 0;

    player.raccel = 0;
    player.caccel = 0;
    player.rdel = 0;
    player.cdel = 0;
    player.isIdle = 1;
    
    curFrame++;
    if (curFrame > numFrames) {
        curFrame = 0;
        player.specialAnim = 0;
        finishLaserSling();
    }
}