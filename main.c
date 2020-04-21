#include "game.h"

/*
*M3 Update:
* Progress:
* -All item functionalities implemented (in order):
*       -Spring Boots: Player's jump height doubles
*       -Shrink Ray: Player's height cut in half
*       -Speed Shoes: Player's max speed is x4
*       -Sticky Gloves: Player can wall jump
*       -Project Z: Player reflects their position off laser and appears on other side
*
* -Map is 1024x1024 (see setupMap in game.h for how that works)
* -Lower half of map is finished, upper half might need better design but is playable
*
*  Leftover tasks:
* -The UI for equipping/using items has not been made yet, but the functionality has
* -Sound
* -Player animations
* -The cheat (gravity flip item)
*
* Bugs:
* -There's a lot of bugs with collisions:
* -Jumping down into a corner sometimes zips the player somewhere else
* -off by one errors: Player appears one pixel above the platform (most have been stopped but this still sometimes happens)
* - Camera movement can influence other sprite positions by a couple of pixels
* - Player's x movement stopping when they hit the ground
* - High speed collisions
* - Possible to clip into laser cage with enough speed
* - Wall jump is inconsistent sometimes (not really a bug, but it could be made easier)
*
* Other Notes:
* - Since there's no item UI: The order that the items are collected is the order listed above.
*   - Use L/R to cycle through the player's inventory and B to toggle between equipping/unequipping the current item
*   - Equiping the item will cause it's properties to be bestowed to the player: so for example when the boots are collected
    pressing B will double the jump height of the player and pressing B again will return the jump height to normal.
* - The laser redirection item is the only one that must be used in real time rather than equipped. Pressing B near a laser will
    activate it's effect.
* 
* - Since even with this description it is still kind of hard to keep track of items without a visual, there is a file in this folder 
* called solution.mkv that is a video of how to complete the level with all of the item properties being used.
*
*
*M4 Update:
*Progress:
* -Added Item UI
* -Updated backgrounds
* -Added player animations
* -Added fade in at beginning using blending
* -Added player rotations ("wake up" animation at the beginning)
* -Added the cheat: Gravity Flip
* -Added glitch effect to splash screen
* -Added music
* -Added sound effects with laser sling ability
* -Gameplay:
*   -Increased friction between walls so that wall jumping is easier
*   -Changed the laser sling ability to have an animation that freezes the player in midair as it happens
*   -Laser sling adds velocity to the player based on distance from the laser
*   -General bug fixes: most notably with the laser sling ability
*
* Bugs:
*   -Essentially the same as M3, except they happen less often
*
* Other Notes:
* -Since there is now an item UI, it is easier to tell which item you are using
* -Activate the cheat by holding down B as you press A to start the game
* -An easy way to beat the game is to use the cheat, get the shrink ray item (near the bottom of the map),
*  and then use the cheat to reach the ceiling of the top left of the map. You can then drop down and use the shrink ray to go through to the final room of the game.
* Jumping through the top will take you to the win state.
* -I deleted the solution video because it was taking up space, but my demo on Tuesday 4/21 should cover the same material.
*/

int main() {
    init();

    while(1) {
        update();
    }
}