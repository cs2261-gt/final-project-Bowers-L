#pragma once

#include "myLib.h"

Sound soundA;
Sound soundB;

#define SOUND_FREQ 11025

void setupSounds();
void playSoundA(const signed char* sound, int length, int loops);
void playSoundB(const signed char* sound, int length, int loops);

void handleSoundVBlank();

void pauseSound();
void unpauseSound();
void stopSound();