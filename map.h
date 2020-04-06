
//{{BLOCK(map)

//======================================================================
//
//	map, 512x512@4, 
//	+ palette 256 entries, not compressed
//	+ 25 tiles (t|f|p reduced) not compressed
//	+ regular map (in SBBs), not compressed, 64x64 
//	Total size: 512 + 800 + 8192 = 9504
//
//	Time-stamp: 2020-04-06, 00:01:51
//	Exported by Cearn's GBA Image Transmogrifier, v0.8.3
//	( http://www.coranac.com/projects/#grit )
//
//======================================================================

#ifndef GRIT_MAP_H
#define GRIT_MAP_H

#define MAPWH 512

#define mapTilesLen 800
extern const unsigned short mapTiles[400];

#define mapMapLen 8192
extern const unsigned short mapMap[4096];

#define mapPalLen 512
extern const unsigned short mapPal[256];

#endif // GRIT_MAP_H

//}}BLOCK(map)
