#include "player.h"

Player player;

void initPlayer() {
    player.worldRow = ENCODE4(450);
    player.worldCol = ENCODE4(15);
    player.screenRow = player.worldRow - vOff;
    player.screenCol = player.worldCol - hOff;
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
    if (collisionBelow()) {
        player.raccel = 0;
    } else {
        player.raccel = player.gravity;
    }

    //update player velocity
    player.rdel = clamp(player.rdel + player.raccel, -player.jumpSpeed, player.terminalVel);
    player.cdel = clamp(player.cdel + player.caccel, -player.maxSpeed, player.maxSpeed);

    //update player's world and screen positions
    player.worldCol = clamp(player.worldCol + player.cdel, 0, ENCODE4(MAPWH) - player.width);
    resolveCollisionX();
    adjusthOff();

    player.worldRow = clamp(player.worldRow + player.rdel, 0, ENCODE4(MAPWH) - player.height);
    resolveCollisionY();
    adjustvOff();

    showPlayer();
}

void showPlayer() {
    //adjust screen coordinates to match world coordinates
    player.screenRow = player.worldRow - vOff;
    player.screenCol = player.worldCol - hOff;

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
        if (collisionBelow()) {
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

int resolveCollisionX() {
    
    while (collisionLeft()) {
        player.worldCol++;
        player.cdel = 0;
    }

    while (collisionRight()) {
        player.worldCol--;
        player.cdel = 0;
    }
}

int resolveCollisionY() {
    while (collisionAbove()) {
        player.rdel = 0;
        player.worldRow++;
    }

    while (collisionBelow()) {
        player.rdel = 0;
        player.worldRow--;
    }
}

void adjusthOff() {
    if (player.cdel < 0) {
        //left
        if ((hOff > 0) && (player.screenCol + player.width / 2 < ENCODE4(SCREENWIDTH / 2))) {
            hOff = max(hOff + player.cdel, 0);
        }
    } else if (player.cdel > 0) {
        //right
        if ((hOff + ENCODE4(SCREENWIDTH - 1) < ENCODE4(MAPWH)) && (player.screenCol + player.width / 2 > ENCODE4(SCREENWIDTH / 2))) {
            hOff = min(hOff + player.cdel, ENCODE4(MAPWH - SCREENWIDTH));
        }
    }
}

void adjustvOff() {
    if (player.rdel < 0) {
        //up
        if ((vOff > 0) && (player.screenRow + player.height / 2 < ENCODE4(SCREENHEIGHT / 2))) {
            vOff = max(vOff + player.rdel, 0);
        }
    } else if (player.rdel > 0) {
        if ((vOff + ENCODE4(SCREENHEIGHT - 1) < ENCODE4(MAPWH)) && (player.screenRow + player.height / 2 > ENCODE4(SCREENHEIGHT / 2))) {
            vOff = min(vOff + player.rdel, ENCODE4(MAPWH - SCREENHEIGHT));
        }
    }
}