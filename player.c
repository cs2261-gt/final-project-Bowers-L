#include "player.h"

Player player;

void initPlayer() {
    player.worldRow = ENCODE4(MAPWH - 56) - player.height;
    player.worldCol = ENCODE4(30);
    player.screenRow = player.worldRow - camera.row;
    player.screenCol = player.worldCol - camera.col;
    player.rdel = 0;
    player.cdel = 0;
    player.width = ENCODE4(8);
    player.height = ENCODE4(16);
    player.hide = 0;

    player.raccel = 0;
    player.caccel = 0;

    player.accelCurve = 4;
    player.decelCurve = 8;
    player.maxSpeed = 16;
    player.terminalVel = 64;

    //Note: Normal jump speed: 512, High jump speed: ~700
    player.isJumping = 0;
    player.jumpHeight = 512;
    player.jumpTime = 16;
    
    player.gravity = (2 * player.jumpHeight) / (player.jumpTime * player.jumpTime);
    player.jumpSpeed = player.gravity * player.jumpTime;

    player.direction = 0;
    
    shadowOAM[0].attr0 = DECODE4(player.screenRow) | ATTR0_REGULAR | ATTR0_4BPP | ATTR0_TALL;
    shadowOAM[0].attr1 = DECODE4(player.screenCol) | ATTR1_TINY;
    shadowOAM[0].attr2 = ATTR2_TILEID(0, 0) | ATTR2_PALROW(0);
}

void updatePlayer() {
    handlePlayerInput();

    //simulate gravity
    if (touchingGround()) {
        player.raccel = 0;
    } else {
        player.raccel = player.gravity;
    }

    //update player velocity
    player.rdel = clamp(player.rdel + player.raccel, -player.jumpSpeed, player.terminalVel);
    player.cdel = clamp(player.cdel + player.caccel, -player.maxSpeed, player.maxSpeed);

    //update player's world and screen positions
    player.worldCol = clamp(player.worldCol + player.cdel, 0, ENCODE4(MAPWH) - player.width);
    player.worldRow = clamp(player.worldRow + player.rdel, 0, ENCODE4(MAPWH) - player.height);
    resolveCollisions();

}

void showPlayer() {
    //adjust screen coordinates to match world coordinates
    player.screenRow = player.worldRow - camera.row;
    player.screenCol = player.worldCol - camera.col;

    if ((player.screenRow < -player.height) || (player.screenRow > ENCODE4(SCREENHEIGHT - 1))
        || (player.screenCol < -player.width) || (player.screenCol > ENCODE4(SCREENWIDTH - 1))) {
        player.hide = 1;
    } else {
        player.hide = 0;
    }

    shadowOAM[0].attr0 = (DECODE4(player.screenRow) & ROWMASK) | ATTR0_REGULAR | ATTR0_4BPP | ATTR0_TALL;
    shadowOAM[0].attr1 = (DECODE4(player.screenCol) & COLMASK) | ATTR1_TINY;
    shadowOAM[0].attr2 = ATTR2_TILEID(0, 0) | ATTR2_PALROW(0);
    
    if (player.hide) {
        shadowOAM[0].attr0 |= ATTR0_HIDE;
    }
}


void handlePlayerInput() {
    if (!BUTTON_HELD(BUTTON_LEFT) && !BUTTON_HELD(BUTTON_RIGHT)) {

        if (signOf(player.direction) == signOf(player.cdel)) {
            //implement friction to slow down player
            player.caccel = -1 * signOf(player.direction) * player.decelCurve;
        } else {
            player.cdel = 0;
            player.caccel = 0;
        }
    } else {
        if (BUTTON_HELD(BUTTON_LEFT)) {
            player.direction = -1;
            if (player.worldCol > 0) {
                player.caccel = -player.accelCurve;
            }
        }
        if (BUTTON_HELD(BUTTON_RIGHT)) {
            player.direction = 1;
            if (player.worldCol < ENCODE4(MAPWH) - player.width) {
                player.caccel = player.accelCurve;
            }
        }
    }

    if (BUTTON_PRESSED(BUTTON_A)) {
        if (touchingGround()) {
            player.isJumping = 1;
            player.rdel = -player.jumpSpeed;
        }
    }

    if (!BUTTON_HELD(BUTTON_A)) {
        if (player.isJumping) {
            player.rdel = 0;
            player.isJumping = 0;
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

int collisionLeft() {
    return player.worldCol < 0
        || mapCollisionBitmap[OFFSET(DECODE4(player.worldCol), DECODE4(player.worldRow), MAPWH)]
        || mapCollisionBitmap[OFFSET(DECODE4(player.worldCol), DECODE4(player.worldRow + player.height - 1), MAPWH)];
}

int collisionRight() {
    return player.worldCol + player.width >= ENCODE4(MAPWH)
        || mapCollisionBitmap[OFFSET(DECODE4(player.worldCol + player.width - 1), DECODE4(player.worldRow), MAPWH)]
        || mapCollisionBitmap[OFFSET(DECODE4(player.worldCol + player.width - 1), DECODE4(player.worldRow + player.height - 1), MAPWH)];
}

int collisionAbove() {
    return player.worldRow < 0
        || mapCollisionBitmap[OFFSET(DECODE4(player.worldCol), DECODE4(player.worldRow), MAPWH)]
        || mapCollisionBitmap[OFFSET(DECODE4(player.worldCol + player.width - 1), DECODE4(player.worldRow), MAPWH)];
}

int collisionBelow() {
    return player.worldRow + player.height >= ENCODE4(MAPWH)
        || mapCollisionBitmap[OFFSET(DECODE4(player.worldCol), DECODE4(player.worldRow + player.height - 1), MAPWH)]
        || mapCollisionBitmap[OFFSET(DECODE4(player.worldCol + player.width - 1), DECODE4(player.worldRow + player.height - 1), MAPWH)];
}

int touchingGround() {
    return mapCollisionBitmap[OFFSET(DECODE4(player.worldCol), DECODE4(player.worldRow + player.height - 1 + 1), MAPWH)]
    || mapCollisionBitmap[OFFSET(DECODE4(player.worldCol + player.width - 1), DECODE4(player.worldRow + player.height - 1 + 1), MAPWH)];
}

/*
Note about collisions: 
I've tried several ways of handling collisions, which each come with some associated problems.
The current method of handling collisions waits until the player's position conflicts with an occupied
pixel in the collision map and resolves it by pushing the player in the direction that results in the shortest
distance traveled for there not to be a collision. 

The main arguable downside is a rounding effect on corners of overhead platforms where the 
player clips to the left or right edge rather than being stopped by the corner.

There is also a known bug where the player sometimes stops one pixel below the ground rather than completely on the ground.
My belief is that this has to do with the positions not lining up with the subpixel speeds (each pixel is split into 16 subpixels)
associated with the gravity calculations. If I can't fix this by M3, then I'll change the precision to single pixels.
*/
int resolveCollisions() {
    int xDepth = 0;
    int yDepth = 0;

    //so don't have to recalculate these
    int collisionOnLeft = 0;
    int collisionOnAbove = 0;

    int step = 2;

    if (collisionLeft()) {
        collisionOnLeft = 1;
        while (collisionLeft()) {
            player.worldCol += step;
            xDepth++;
        }
        player.worldCol -= xDepth * step;
    } else {
        while (collisionRight()) {
            player.worldCol-= step;
            xDepth++;
        }
        player.worldCol += xDepth * step;
    }

    if (collisionAbove()) {
        collisionOnAbove = 1;
        while (collisionAbove()) {
            player.worldRow += step;
            yDepth++;
        }
        player.worldRow -= yDepth * step;
    } else {
        while (collisionBelow()) {
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
    } else {
        if (yDepth != 0) {
            player.rdel = 0;
        }
        if (collisionOnAbove) {
            player.worldRow += yDepth * step;
        } else {
            player.worldRow -= yDepth * step;
        }
    }
}