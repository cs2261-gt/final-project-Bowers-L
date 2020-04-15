# 1 "player.c"
# 1 "<built-in>"
# 1 "<command-line>"
# 1 "player.c"
# 1 "player.h" 1
       

# 1 "myLib.h" 1




typedef unsigned char u8;
typedef unsigned short u16;
typedef unsigned int u32;
# 66 "myLib.h"
extern unsigned short *videoBuffer;
# 90 "myLib.h"
typedef struct {
 u16 tileimg[8192];
} charblock;


typedef struct {
 u16 tilemap[1024];
} screenblock;



void setPixel3(int col, int row, unsigned short color);
void drawRect3(int col, int row, int width, int height, volatile unsigned short color);
void fillScreen3(volatile unsigned short color);
void drawImage3(int col, int row, int width, int height, const unsigned short *image);
void drawFullscreenImage3(const unsigned short *image);


void setPixel4(int col, int row, unsigned char colorIndex);
void drawRect4(int col, int row, int width, int height, volatile unsigned char colorIndex);
void fillScreen4(volatile unsigned char colorIndex);
void drawImage4(int col, int row, int width, int height, const unsigned short *image);
void drawFullscreenImage4(const unsigned short *image);


void waitForVBlank();
void flipPage();





typedef struct {
    unsigned short attr0;
    unsigned short attr1;
    unsigned short attr2;
    unsigned short fill;
} OBJ_ATTR;



extern OBJ_ATTR shadowOAM[];
# 162 "myLib.h"
void hideSprites();






typedef struct {
    int screenRow;
    int screenCol;
    int worldRow;
    int worldCol;
    int rdel;
    int cdel;
    int width;
    int height;
    int aniCounter;
    int aniState;
    int prevAniState;
    int curFrame;
    int numFrames;
    int hide;
} ANISPRITE;
# 232 "myLib.h"
extern unsigned short oldButtons;
extern unsigned short buttons;





void updateInput();
# 251 "myLib.h"
typedef volatile struct {
    volatile const void *src;
    volatile void *dst;
    volatile unsigned int cnt;
} DMA;


extern DMA *dma;
# 291 "myLib.h"
void DMANow(int channel, volatile const void *src, volatile void *dst, unsigned int cnt);
# 385 "myLib.h"
typedef struct{
    const unsigned char* data;
    int length;
    int frequency;
    int isPlaying;
    int loops;
    int duration;
    int priority;
    int vBlankCount;
} SOUND;




int collision(int colA, int rowA, int widthA, int heightA, int colB, int rowB, int widthB, int heightB);
int max(int a, int b);
int min(int a, int b);
int clamp(int value, int min, int max);
int signOf(int value);
int lerp(int a, int b, int curr, int max);

int round(int value, int base);
# 4 "player.h" 2
# 1 "mapCollision.h" 1
# 20 "mapCollision.h"
extern const unsigned short mapCollisionBitmap[1048576];
# 5 "player.h" 2
# 1 "game.h" 1
       



# 1 "stateMachine.h" 1
       




# 1 "map.h" 1
# 22 "map.h"
extern const unsigned short mapTiles[256];


extern const unsigned short mapMap[16384];


extern const unsigned short mapPal[256];
# 7 "stateMachine.h" 2
# 1 "SplashScreen.h" 1
# 22 "SplashScreen.h"
extern const unsigned short SplashScreen_StartTiles[1696];


extern const unsigned short SplashScreen_StartMap[1024];


extern const unsigned short SplashScreen_InstructionsTiles[1696];


extern const unsigned short SplashScreen_InstructionsMap[1024];


extern const unsigned short SplashScreenPal[256];
# 8 "stateMachine.h" 2
# 1 "InstructionsScreen.h" 1
# 21 "InstructionsScreen.h"
extern const unsigned short InstructionsScreenTiles[1776];


extern const unsigned short InstructionsScreenMap[1024];
# 9 "stateMachine.h" 2
# 1 "PauseScreen_Resume.h" 1
# 22 "PauseScreen_Resume.h"
extern const unsigned short PauseScreen_ResumeTiles[848];


extern const unsigned short PauseScreen_ResumeMap[1024];


extern const unsigned short PauseScreen_ResumePal[256];
# 10 "stateMachine.h" 2
# 1 "PauseScreen_Quit.h" 1
# 21 "PauseScreen_Quit.h"
extern const unsigned short PauseScreen_QuitTiles[848];


extern const unsigned short PauseScreen_QuitMap[1024];
# 11 "stateMachine.h" 2
# 1 "WinScreen.h" 1
# 22 "WinScreen.h"
extern const unsigned short WinScreenTiles[1232];


extern const unsigned short WinScreenMap[1024];


extern const unsigned short WinScreenPal[256];
# 12 "stateMachine.h" 2
# 1 "Spritesheet.h" 1
# 21 "Spritesheet.h"
extern const unsigned short SpritesheetTiles[16384];


extern const unsigned short SpritesheetPal[256];
# 13 "stateMachine.h" 2



typedef enum {
    SPLASH, INSTRUCTIONS, GAME, PAUSED, WIN
} GameState;

typedef enum {
    OPTSTART, OPTINST, OPTRESUME, OPTQUIT
} MenuState;

extern GameState gameState;
extern MenuState menuState;

void initSplash();
void initInstructions();
void initPause();
void initWin();

void updateSplash();
void updateInstructions();
void updatePause();
void updateWin();
# 6 "game.h" 2

# 1 "camera.h" 1
       
# 10 "camera.h"
typedef struct {

    int row;
    int col;



    int sbbrow;
    int sbbcol;
} Camera;

extern Camera camera;


void initCamera();
void updateCamera();

void cameraDebug();
void centerCameraToPlayer();

void updateSBB();
# 8 "game.h" 2
# 1 "item.h" 1
       
# 13 "item.h"
typedef enum {
    NONE, BOOTS, SHRINK, SPEED, GLOVES, Z
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

extern Item items[5];
extern ItemType playerInventory[5];

void initItem(Item* item, int col, int row, ItemType type);

void updateItem(Item* item);
void showItem(Item* item);

int checkCollisionPlayer(Item* item);

void equipItem(Item* item);
void useItem(ItemType item);
# 9 "game.h" 2





extern int debug;

void init();
void update();

void initGame();
void resumeGame();
void updateGame();

void drawGame();

void setupMap();



void setupDisplayInterrupt();
void interruptHandler();
# 6 "player.h" 2


typedef enum {
    LEFT, RIGHT
} PlayerState;

typedef struct {

    int screenRow;
    int screenCol;
    int worldRow;
    int worldCol;
    int rdel;
    int cdel;
    int width;
    int height;
    int aniCounter;
    int aniState;
    int prevAniState;
    int curFrame;
    int numFrames;
    int hide;


    int raccel;
    int caccel;


    int accelCurve;
    int decelCurve;
    int maxSpeed;
    int terminalVel;


    int isJumping;
    int jumpHeight;
    int jumpTime;
    int jumpSpeed;
    int gravity;

    int direction;


    int currentItem;
    int shrunk;
    int canWallJump;
} Player;


extern Player player;
extern const int playerMaxSpeed;

void initPlayer();
void updatePlayer();
void showPlayer();

void handlePlayerInput();


int collisionLeft();
int collisionRight();
int collisionAbove();
int collisionBelow();
int touchingGround();
int resolveCollisions();


void shrinkPlayer();
# 2 "player.c" 2

Player player;

void initPlayer() {
    player.worldRow = ((1024 - 56) << 4) - player.height;
    player.worldCol = ((30) << 4);
    player.screenRow = player.worldRow - camera.row;
    player.screenCol = player.worldCol - camera.col;
    player.rdel = 0;
    player.cdel = 0;
    player.width = ((8) << 4);
    player.height = ((16) << 4);
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

    player.currentItem = 0;
    player.shrunk = 0;
    player.canWallJump = 0;

    shadowOAM[0].attr0 = ((player.screenRow) >> 4) | (0<<8) | (0<<13) | (2<<14);
    shadowOAM[0].attr1 = ((player.screenCol) >> 4) | (0<<14);
    shadowOAM[0].attr2 = ((0)*32+(0)) | ((0)<<12);
}

void updatePlayer() {
    handlePlayerInput();


    if (touchingGround()) {
        player.raccel = 0;
    } else {
        player.raccel = player.gravity;
    }


    player.rdel = clamp(player.rdel + player.raccel, -player.jumpSpeed, player.terminalVel);
    player.cdel = clamp(player.cdel + player.caccel, -player.maxSpeed, player.maxSpeed);


    player.worldCol = clamp(player.worldCol + player.cdel, 0, ((1024) << 4) - player.width);
    player.worldRow = clamp(player.worldRow + player.rdel, 0, ((1024) << 4) - player.height);
    resolveCollisions();

}

void showPlayer() {

    player.screenRow = player.worldRow - camera.row;
    player.screenCol = player.worldCol - camera.col;

    if ((player.screenRow < -player.height) || (player.screenRow > ((160 - 1) << 4))
        || (player.screenCol < -player.width) || (player.screenCol > ((240 - 1) << 4))) {
        player.hide = 1;
    } else {
        player.hide = 0;
    }

    if (player.hide) {
        shadowOAM[0].attr0 |= (2<<8);
    }
    if (player.shrunk) {
        shadowOAM[0].attr0 = (((player.screenRow) >> 4) & 0xFF) | (0<<8) | (0<<13) | (0<<14);
        shadowOAM[0].attr1 = (((player.screenCol) >> 4) & 0x1FF) | (0<<14);
        shadowOAM[0].attr2 = ((0)*32+(1)) | ((0)<<12);
    } else {
        shadowOAM[0].attr0 = (((player.screenRow) >> 4) & 0xFF) | (0<<8) | (0<<13) | (2<<14);
        shadowOAM[0].attr1 = (((player.screenCol) >> 4) & 0x1FF) | (0<<14);
        shadowOAM[0].attr2 = ((0)*32+(0)) | ((0)<<12);
    }
}


void handlePlayerInput() {
    if (!(~((*(volatile unsigned short *)0x04000130)) & ((1<<5))) && !(~((*(volatile unsigned short *)0x04000130)) & ((1<<4)))) {

        if (signOf(player.direction) == signOf(player.cdel)) {

            player.caccel = -1 * signOf(player.direction) * player.decelCurve;
        } else {
            player.cdel = 0;
            player.caccel = 0;
        }
    } else {
        if ((~((*(volatile unsigned short *)0x04000130)) & ((1<<5)))) {
            player.direction = -1;
            if (player.worldCol > 0) {
                player.caccel = -player.accelCurve;
            }
        }
        if ((~((*(volatile unsigned short *)0x04000130)) & ((1<<4)))) {
            player.direction = 1;
            if (player.worldCol < ((1024) << 4) - player.width) {
                player.caccel = player.accelCurve;
            }
        }
    }



    if ((!(~(oldButtons)&((1<<0))) && (~buttons & ((1<<0))))) {
        if (touchingGround()
        || (player.canWallJump && (collisionLeft(2) || collisionRight(2)))
         ) {
            player.isJumping = 1;
            player.rdel = -player.jumpSpeed;
        }
    }

    if (!(~((*(volatile unsigned short *)0x04000130)) & ((1<<0)))) {
        if (player.isJumping) {
            player.rdel = 0;
            player.isJumping = 0;
        }
    }



    if ((!(~(oldButtons)&((1<<1))) && (~buttons & ((1<<1))))) {
        useItem(playerInventory[player.currentItem]);
    }

    if ((!(~(oldButtons)&((1<<9))) && (~buttons & ((1<<9))))) {
        if (player.currentItem > 0 && playerInventory[player.currentItem-1] != NONE) {
            player.currentItem--;
        }
    }

    if ((!(~(oldButtons)&((1<<8))) && (~buttons & ((1<<8))))) {
        if (player.currentItem < 5 - 1 && playerInventory[player.currentItem+1] != NONE) {
            player.currentItem++;
        }
    }
}
# 172 "player.c"
int collisionLeft(int offset) {
    return player.worldCol < 0
        || mapCollisionBitmap[((((player.worldRow) >> 4))*(1024)+(((player.worldCol) >> 4) - offset))]
        || mapCollisionBitmap[((((player.worldRow + player.height) >> 4) - 1)*(1024)+(((player.worldCol) >> 4) - offset))];
}

int collisionRight(int offset) {
    return player.worldCol + player.width >= ((1024) << 4)
        || mapCollisionBitmap[((((player.worldRow) >> 4))*(1024)+(((player.worldCol + player.width) >> 4) + offset))]
        || mapCollisionBitmap[((((player.worldRow + player.height) >> 4) - 1)*(1024)+(((player.worldCol + player.width) >> 4) + offset))];
}

int collisionAbove(int offset) {
    return player.worldRow < 0
        || mapCollisionBitmap[((((player.worldRow) >> 4) - offset)*(1024)+(((player.worldCol) >> 4)))]
        || mapCollisionBitmap[((((player.worldRow) >> 4) - offset)*(1024)+(((player.worldCol + player.width) >> 4) - 1))];
}

int collisionBelow(int offset) {
    return player.worldRow + player.height >= ((1024) << 4)
        || mapCollisionBitmap[((((player.worldRow + player.height) >> 4) - 1 + offset)*(1024)+(((player.worldCol) >> 4)))]
        || mapCollisionBitmap[((((player.worldRow + player.height) >> 4) - 1 + offset)*(1024)+(((player.worldCol + player.width) >> 4) - 1))];
}

int touchingGround() {
    return mapCollisionBitmap[((((player.worldRow + player.height) >> 4))*(1024)+(((player.worldCol) >> 4)))]
    || mapCollisionBitmap[((((player.worldRow + player.height) >> 4))*(1024)+(((player.worldCol + player.width) >> 4) - 1))];
}
# 215 "player.c"
int resolveCollisions() {
    int xDepth = 0;
    int yDepth = 0;


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

        player.worldCol = round(player.worldCol, 16);
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

void equipBoots() {
    if (player.jumpHeight == 1024) {
        player.jumpHeight = 512;
    } else {
        player.jumpHeight = 1024;
    }


    player.gravity = (2 * player.jumpHeight) / (player.jumpTime * player.jumpTime);
    player.jumpSpeed = player.gravity * player.jumpTime;
}

void shrinkPlayer() {
    if (player.shrunk) {
        if (!collisionAbove(8)) {
            player.shrunk = 0;
            player.height = ((16) << 4);
            player.worldRow -= ((8) << 4);
        }
    } else {
        player.shrunk = 1;
        player.height = ((8) << 4);
    }
}

void equipLegs() {
    if (player.maxSpeed == 16) {
        player.maxSpeed = 64;
    } else {
        player.maxSpeed = 16;
    }
}

void equipGloves() {
    if (player.canWallJump) {
        player.canWallJump = 0;
    } else {
        player.canWallJump = 1;
    }
}
