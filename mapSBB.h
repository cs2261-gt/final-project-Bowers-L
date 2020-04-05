
//{{BLOCK(mapSBB)

//======================================================================
//
//	mapSBB, 512x512@4, 
//	+ palette 256 entries, not compressed
//	+ 31 tiles (t|f|p reduced) not compressed
//	+ regular map (in SBBs), not compressed, 64x64 
//	Total size: 512 + 992 + 8192 = 9696
//
//	Time-stamp: 2020-04-04, 21:50:19
//	Exported by Cearn's GBA Image Transmogrifier, v0.8.3
//	( http://www.coranac.com/projects/#grit )
//
//======================================================================

#ifndef GRIT_MAPSBB_H
#define GRIT_MAPSBB_H

#define MAPWH 512

#define mapSBBTilesLen 992
extern const unsigned short mapSBBTiles[496];

#define mapSBBMapLen 8192
extern const unsigned short mapSBBMap[4096];

#define mapSBBPalLen 512
extern const unsigned short mapSBBPal[256];

#endif // GRIT_MAPSBB_H

//}}BLOCK(mapSBB)
