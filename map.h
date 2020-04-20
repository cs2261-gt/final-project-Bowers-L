
//{{BLOCK(map)

//======================================================================
//
//	map, 1024x1024@4, 
//	+ 14 tiles (t|f|p reduced) not compressed
//	+ regular map (in SBBs), not compressed, 128x128 
//	Total size: 448 + 32768 = 33216
//
//	Time-stamp: 2020-04-19, 21:53:36
//	Exported by Cearn's GBA Image Transmogrifier, v0.8.3
//	( http://www.coranac.com/projects/#grit )
//
//======================================================================

#ifndef GRIT_MAP_H
#define GRIT_MAP_H

#define mapTilesLen 448
extern const unsigned short mapTiles[224];

#define mapMapLen 32768
extern const unsigned short mapMap[16384];

#endif // GRIT_MAP_H

//}}BLOCK(map)
