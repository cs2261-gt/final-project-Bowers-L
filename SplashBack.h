
//{{BLOCK(SplashBack)

//======================================================================
//
//	SplashBack, 256x256@4, 
//	+ palette 256 entries, not compressed
//	+ 18 tiles (t|f|p reduced) not compressed
//	+ regular map (flat), not compressed, 32x32 
//	Total size: 512 + 576 + 2048 = 3136
//
//	Time-stamp: 2020-04-21, 03:27:25
//	Exported by Cearn's GBA Image Transmogrifier, v0.8.3
//	( http://www.coranac.com/projects/#grit )
//
//======================================================================

#ifndef GRIT_SPLASHBACK_H
#define GRIT_SPLASHBACK_H

#define SplashBackTilesLen 576
extern const unsigned short SplashBackTiles[288];

#define SplashBackMapLen 2048
extern const unsigned short SplashBackMap[1024];

#define SplashBackPalLen 512
extern const unsigned short SplashBackPal[256];

#endif // GRIT_SPLASHBACK_H

//}}BLOCK(SplashBack)
