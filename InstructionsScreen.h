
//{{BLOCK(InstructionsScreen)

//======================================================================
//
//	InstructionsScreen, 256x256@4, 
//	+ palette 256 entries, not compressed
//	+ 136 tiles (t|f|p reduced) not compressed
//	+ regular map (in SBBs), not compressed, 32x32 
//	Total size: 512 + 4352 + 2048 = 6912
//
//	Time-stamp: 2020-04-15, 18:59:14
//	Exported by Cearn's GBA Image Transmogrifier, v0.8.3
//	( http://www.coranac.com/projects/#grit )
//
//======================================================================

#ifndef GRIT_INSTRUCTIONSSCREEN_H
#define GRIT_INSTRUCTIONSSCREEN_H

#define InstructionsScreenTilesLen 4352
extern const unsigned short InstructionsScreenTiles[2176];

#define InstructionsScreenMapLen 2048
extern const unsigned short InstructionsScreenMap[1024];

#define InstructionsScreenPalLen 512
extern const unsigned short InstructionsScreenPal[256];

#endif // GRIT_INSTRUCTIONSSCREEN_H

//}}BLOCK(InstructionsScreen)
