
//{{BLOCK(map)

//======================================================================
//
//	map, 1024x1024@4, 
//	+ palette 256 entries, not compressed
//	+ 11 tiles (t|f|p reduced) not compressed
//	+ regular map (in SBBs), not compressed, 128x128 
//	Total size: 512 + 352 + 32768 = 33632
//
//	Time-stamp: 2020-04-14, 01:22:00
//	Exported by Cearn's GBA Image Transmogrifier, v0.8.3
//	( http://www.coranac.com/projects/#grit )
//
//======================================================================

#ifndef GRIT_MAP_H
#define GRIT_MAP_H

#define mapTilesLen 352
extern const unsigned short mapTiles[176];

#define mapMapLen 32768
extern const unsigned short mapMap[16384];

#define mapPalLen 512
extern const unsigned short mapPal[256];

#endif // GRIT_MAP_H

//}}BLOCK(map)
