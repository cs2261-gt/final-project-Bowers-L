
//{{BLOCK(GameOverlay)

//======================================================================
//
//	GameOverlay, 256x256@4, 
//	+ 8 tiles (t|f|p reduced) not compressed
//	+ regular map (flat), not compressed, 32x32 
//	Total size: 256 + 2048 = 2304
//
//	Time-stamp: 2020-04-19, 02:18:20
//	Exported by Cearn's GBA Image Transmogrifier, v0.8.3
//	( http://www.coranac.com/projects/#grit )
//
//======================================================================

#ifndef GRIT_GAMEOVERLAY_H
#define GRIT_GAMEOVERLAY_H

#define GameOverlayTilesLen 256
extern const unsigned short GameOverlayTiles[128];

#define GameOverlayMapLen 2048
extern const unsigned short GameOverlayMap[1024];

#endif // GRIT_GAMEOVERLAY_H

//}}BLOCK(GameOverlay)
