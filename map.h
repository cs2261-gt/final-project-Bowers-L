
//{{BLOCK(map)

//======================================================================
//
//	map, 1024x512@4, 
//	+ palette 256 entries, not compressed
//	+ 106 tiles (t|f|p reduced) not compressed
//	+ regular map (in SBBs), not compressed, 128x64 
//	Total size: 512 + 3392 + 16384 = 20288
//
//	Time-stamp: 2020-04-13, 22:04:49
//	Exported by Cearn's GBA Image Transmogrifier, v0.8.3
//	( http://www.coranac.com/projects/#grit )
//
//======================================================================

#ifndef GRIT_MAP_H
#define GRIT_MAP_H

#define mapTilesLen 3392
extern const unsigned short mapTiles[1696];

#define mapMapLen 16384
extern const unsigned short mapMap[8192];

#define mapPalLen 512
extern const unsigned short mapPal[256];

#endif // GRIT_MAP_H

//}}BLOCK(map)
