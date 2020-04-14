#include "camera.h"

Camera camera;

void initCamera(int col, int row) {
    camera.col = col;
    camera.row = row;
    camera.sbbcol = clamp(DECODE4(col) / SBBWH, 0, SBBROWLEN - 2);
    camera.sbbrow = clamp(DECODE4(row) / SBBWH, 0, SBBROWLEN - 2);
}

void updateCamera() {
    if (debug) {
        cameraDebug();
    } else {
        centerCameraToPlayer();
    }

    updateSBB();
}

void updateSBB() {
    //handle changes in SBB
    
    //left
    if (DECODE4(camera.col) < (camera.sbbcol) * SBBWH
        && camera.sbbcol > 0) {
        camera.sbbcol--;

        //dma bottom left half of map into screenblocks
        for (int i = 0; i < SBBROWLEN-1; i++) {
            DMANow( 3, 
                    &mapMap[SBBSIZE*OFFSET(camera.sbbcol, i+1, SBBROWLEN)],
                    &SCREENBLOCK[MAPSB + OFFSET(camera.sbbcol, i+1, 2)],
                    SBBSIZE);
        }
    }
    //right
    if (DECODE4(camera.col) > (camera.sbbcol + 1) * SBBWH
        && camera.sbbcol < SBBROWLEN - 2) {
        camera.sbbcol++;

        //dma top right half of map into screenblocks
        for (int i = 0; i < SBBROWLEN-1; i++) {
            DMANow( 3, 
                    &mapMap[SBBSIZE*OFFSET(camera.sbbcol+1, i, SBBROWLEN)],
                    &SCREENBLOCK[MAPSB + OFFSET(camera.sbbcol+1, i, 2)],
                    SBBSIZE);
        }
    }
    //up
    if (DECODE4(camera.row) < (camera.sbbrow) * SBBWH
        && camera.sbbrow > 0) {
        camera.sbbrow--;
    }
    //down
    if (DECODE4(camera.row) > (camera.sbbrow + 1) * SBBWH
        && camera.sbbrow < SBBROWLEN - 2) {
        camera.sbbrow++;
    }
}

void centerCameraToPlayer() {
    if (player.cdel < 0) {
        //left
        if ((camera.col > 0) && (player.screenCol + player.width / 2 < ENCODE4(SCREENWIDTH / 2))) {
            camera.col = max(camera.col + player.cdel, 0);
        }
    } else if (player.cdel > 0) {
        //right
        if ((camera.col + ENCODE4(SCREENWIDTH - 1) < ENCODE4(MAPWH)) && (player.screenCol + player.width / 2 > ENCODE4(SCREENWIDTH / 2))) {
            camera.col = min(camera.col + player.cdel, ENCODE4(MAPWH - SCREENWIDTH));
        }
    }

    if (player.rdel < 0) {
        //up
        if ((camera.row > 0) && (player.screenRow + player.height / 2 < ENCODE4(SCREENHEIGHT / 2))) {
            camera.row = max(camera.row + player.rdel, 0);
        }
    } else if (player.rdel > 0) {
        //down
        if ((camera.row + ENCODE4(SCREENHEIGHT - 1) < ENCODE4(MAPWH)) && (player.screenRow + player.height / 2 > ENCODE4(SCREENHEIGHT / 2))) {
            camera.row = min(camera.row + player.rdel, ENCODE4(MAPWH - SCREENHEIGHT));
        }
    }
}

void cameraDebug() {
    static int cameraSpeed = 32;

    if (BUTTON_HELD(BUTTON_LEFT)) {
        if (camera.col > 0) {
            camera.col = max(camera.col - cameraSpeed, 0);
        }
    }
    if (BUTTON_HELD(BUTTON_RIGHT)) {
        if (camera.col < ENCODE4(MAPWH - SCREENWIDTH)) {
            camera.col = min(camera.col + cameraSpeed, ENCODE4(MAPWH - SCREENWIDTH));
        }
    }

    if (BUTTON_HELD(BUTTON_UP)) {
        if (camera.row > 0) {
            camera.row = max(camera.row - cameraSpeed, 0);
        }
    }
    if (BUTTON_HELD(BUTTON_DOWN)) {
        if (camera.row < ENCODE4(MAPWH - SCREENHEIGHT)) {
            camera.row = min(camera.row + cameraSpeed, ENCODE4(MAPWH - SCREENHEIGHT));
        }
    }
}