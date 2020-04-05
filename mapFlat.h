
//{{BLOCK(mapFlat)

//======================================================================
//
//	mapFlat, 512x512@4, 
//	+ palette 256 entries, not compressed
//	+ 31 tiles (t|f|p reduced) not compressed
//	+ regular map (flat), not compressed, 64x64 
//	Total size: 512 + 992 + 8192 = 9696
//
//	Time-stamp: 2020-04-04, 21:50:08
//	Exported by Cearn's GBA Image Transmogrifier, v0.8.3
//	( http://www.coranac.com/projects/#grit )
//
//======================================================================

#ifndef GRIT_MAPFLAT_H
#define GRIT_MAPFLAT_H

#define mapFlatTilesLen 992
extern const unsigned short mapFlatTiles[496];

#define mapFlatMapLen 8192
extern const unsigned short mapFlatMap[4096];

#define mapFlatPalLen 512
extern const unsigned short mapFlatPal[256];

#endif // GRIT_MAPFLAT_H

//}}BLOCK(mapFlat)
