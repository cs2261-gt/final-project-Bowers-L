# 1 "camera.c"
# 1 "<built-in>"
# 1 "<command-line>"
# 1 "camera.c"
# 1 "camera.h" 1
       

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

int roundbase(int value, int base);
# 4 "camera.h" 2

# 1 "game.h" 1
       



# 1 "stateMachine.h" 1
       




# 1 "map.h" 1
# 22 "map.h"
extern const unsigned short mapTiles[272];


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
# 22 "InstructionsScreen.h"
extern const unsigned short InstructionsScreenTiles[2176];


extern const unsigned short InstructionsScreenMap[1024];


extern const unsigned short InstructionsScreenPal[256];
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
# 1 "player.h" 1
       


# 1 "mapCollision.h" 1
# 20 "mapCollision.h"
extern const unsigned short mapCollisionBitmap[1048576];
# 5 "player.h" 2

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

extern Item items[10];
extern ItemType playerInventory[10];

void initItem(Item* item, int col, int row, ItemType type);

void updateItem(Item* item);
void showItem(Item* item);

int checkCollisionPlayer(Item* item);

void equipItem(Item* item);
void useItem(ItemType item);
# 7 "player.h" 2

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
void equipBoots();
void equipLegs();
void equipGloves();
# 7 "game.h" 2


# 1 "laser.h" 1
       
# 16 "laser.h"
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

    int type;

    int index;
} Laser;

extern Laser lasers[50];

void initAllLasers();
void updateAllLasers();
void showAllLasers();

void initLaser(Laser* laser, int col, int row, int tall);
void updateLaser(Laser* laser);
void showLaser(Laser* laser);

void laserSling();
# 10 "game.h" 2





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
# 6 "camera.h" 2




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
# 2 "camera.c" 2

Camera camera;

void initCamera(int col, int row) {
    camera.col = col;
    camera.row = row;
    camera.sbbcol = clamp(((col) >> 4) / 256, 0, (1024 / 256) - 2);
    camera.sbbrow = clamp(((row) >> 4) / 256, 0, (1024 / 256) - 2);
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



    if (((camera.col) >> 4) < (camera.sbbcol) * 256
        && camera.sbbcol > 0) {
        camera.sbbcol--;


        for (int i = 0; i < (1024 / 256)-1; i++) {
            DMANow( 3,
                    &mapMap[1024*((i+1)*((1024 / 256))+(camera.sbbcol))],
                    &((screenblock *)0x6000000)[22 + ((i+1)*(2)+(camera.sbbcol))],
                    1024);
        }
    }

    if (((camera.col) >> 4) > (camera.sbbcol + 1) * 256
        && camera.sbbcol < (1024 / 256) - 2) {
        camera.sbbcol++;


        for (int i = 0; i < (1024 / 256)-1; i++) {
            DMANow( 3,
                    &mapMap[1024*((i)*((1024 / 256))+(camera.sbbcol+1))],
                    &((screenblock *)0x6000000)[22 + ((i)*(2)+(camera.sbbcol+1))],
                    1024);
        }
    }

    if (((camera.row) >> 4) < (camera.sbbrow) * 256
        && camera.sbbrow > 0) {
        camera.sbbrow--;
    }

    if (((camera.row) >> 4) > (camera.sbbrow + 1) * 256
        && camera.sbbrow < (1024 / 256) - 2) {
        camera.sbbrow++;
    }
}

void centerCameraToPlayer() {
    if (player.cdel < 0) {

        if ((camera.col > 0) && (player.screenCol + player.width / 2 < ((240 / 2) << 4))) {
            camera.col = max(camera.col + player.cdel, 0);
        }
    } else if (player.cdel > 0) {

        if ((camera.col + ((240 - 1) << 4) < ((1024) << 4)) && (player.screenCol + player.width / 2 > ((240 / 2) << 4))) {
            camera.col = min(camera.col + player.cdel, ((1024 - 240) << 4));
        }
    }

    if (player.rdel < 0) {

        if ((camera.row > 0) && (player.screenRow + player.height / 2 < ((160 / 2) << 4))) {
            camera.row = max(camera.row + player.rdel, 0);
        }
    } else if (player.rdel > 0) {

        if ((camera.row + ((160 - 1) << 4) < ((1024) << 4)) && (player.screenRow + player.height / 2 > ((160 / 2) << 4))) {
            camera.row = min(camera.row + player.rdel, ((1024 - 160) << 4));
        }
    }
}

void cameraDebug() {
    static int cameraSpeed = 32;

    if ((~((*(volatile unsigned short *)0x04000130)) & ((1<<5)))) {
        if (camera.col > 0) {
            camera.col = max(camera.col - cameraSpeed, 0);
        }
    }
    if ((~((*(volatile unsigned short *)0x04000130)) & ((1<<4)))) {
        if (camera.col < ((1024 - 240) << 4)) {
            camera.col = min(camera.col + cameraSpeed, ((1024 - 240) << 4));
        }
    }

    if ((~((*(volatile unsigned short *)0x04000130)) & ((1<<6)))) {
        if (camera.row > 0) {
            camera.row = max(camera.row - cameraSpeed, 0);
        }
    }
    if ((~((*(volatile unsigned short *)0x04000130)) & ((1<<7)))) {
        if (camera.row < ((1024 - 160) << 4)) {
            camera.row = min(camera.row + cameraSpeed, ((1024 - 160) << 4));
        }
    }
}
