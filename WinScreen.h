
//{{BLOCK(WinScreen)

//======================================================================
//
//	WinScreen, 256x256@4, 
//	+ palette 256 entries, not compressed
//	+ 77 tiles (t|f|p reduced) not compressed
//	+ regular map (flat), not compressed, 32x32 
//	Total size: 512 + 2464 + 2048 = 5024
//
//	Time-stamp: 2020-04-08, 22:23:12
//	Exported by Cearn's GBA Image Transmogrifier, v0.8.3
//	( http://www.coranac.com/projects/#grit )
//
//======================================================================

#ifndef GRIT_WINSCREEN_H
#define GRIT_WINSCREEN_H

#define WinScreenTilesLen 2464
extern const unsigned short WinScreenTiles[1232];

#define WinScreenMapLen 2048
extern const unsigned short WinScreenMap[1024];

#define WinScreenPalLen 512
extern const unsigned short WinScreenPal[256];

#endif // GRIT_WINSCREEN_H

//}}BLOCK(WinScreen)
