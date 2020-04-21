
//{{BLOCK(map)

//======================================================================
//
//	map, 1024x1024@4, 
//	+ 12 tiles (t|f|p reduced) not compressed
//	+ regular map (in SBBs), not compressed, 128x128 
//	Total size: 384 + 32768 = 33152
//
//	Time-stamp: 2020-04-21, 15:28:43
//	Exported by Cearn's GBA Image Transmogrifier, v0.8.3
//	( http://www.coranac.com/projects/#grit )
//
//======================================================================

#ifndef GRIT_MAP_H
#define GRIT_MAP_H

#define mapTilesLen 384
extern const unsigned short mapTiles[192];

#define mapMapLen 32768
extern const unsigned short mapMap[16384];

#endif // GRIT_MAP_H

//}}BLOCK(map)
