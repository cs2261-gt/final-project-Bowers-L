#include "player.h"

ANISPRITE player;
const int playerMaxSpeed = 2;

void initPlayer() {
    player.worldRow = ENCODE8(487 - 16);
    player.worldCol = 0;
    player.screenRow = player.worldRow - vOff;
    player.screenCol = player.worldCol - hOff;
    player.rdel = 0;
    player.cdel = 0;
    player.raccel = 
    player.width = ENCODE8(16);
    player.height = ENCODE8(16);
    player.hide = 0;

    player.raccel = 0;
    player.caccel = 0;
    
    shadowOAM[0].attr0 = DECODE8(player.screenRow) | ATTR0_REGULAR | ATTR0_4BPP | ATTR0_SQUARE;
    shadowOAM[0].attr1 = DECODE8(player.screenCol) | ATTR1_SMALL;
    shadowOAM[0].attr2 = ATTR2_TILEID(0, 0) | ATTR2_PALROW(0);
}

void updatePlayer() {
    if (!debug) {    
        handlePlayerInput();
    }

    //update player's world and screen positions
    player.rdel = max(player.rdel + player.raccel, )
    player.worldRow += player.rdel;
    player.worldCol += player.cdel;
    player.screenRow = player.worldRow - vOff;
    player.screenCol = player.worldCol - hOff;

    shadowOAM[0].attr0 = DECODE8(player.screenRow) | ATTR0_REGULAR | ATTR0_4BPP | ATTR0_SQUARE;
    shadowOAM[0].attr1 = DECODE8(player.screenCol) | ATTR1_SMALL;
    shadowOAM[0].attr2 = ATTR2_TILEID(0, 0) | ATTR2_PALROW(0);
    
    if (player.hide) {
        shadowOAM[0].attr0 |= ATTR0_HIDE;
    }
}

void handlePlayerInput() {
    if (BUTTON_HELD(BUTTON_LEFT)) {
        if (player.worldCol < ENCODE8(MAPWH) - player.width) {
            player.rdel = playerMaxSpeed;
        }
    }
    if (BUTTON_HELD(BUTTON_RIGHT)) {
        if (player.worldCol)
    }
}