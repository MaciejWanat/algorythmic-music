#!/usr/bin/env python3

import random

output = ""

CPhrygian = ["c", "df", "ef", "g", "af", "bf"]
CLydic = ["c", "d", "e", "fs", "g", "a", "b"]

allowedOctaves = ["3", "4", "5"]
allowedRythmic = ["qn", "en", "sn"]

soundOrPause = ["sound", "sound", "pause"]

def generateMelody(scale, length):
    melody = ""
    i = 0
    while (i < length):
        isSound = random.choice(soundOrPause)

        if (isSound == "pause"):
            sound = "rest"   \
                + " " + random.choice(allowedRythmic)
        else:
            sound = random.choice(scale)    \
                + " " + random.choice(allowedOctaves)   \
                + " " + random.choice(allowedRythmic)
        melody += sound + " :+: "
        i += 1
    melody = melody[:-5]
    return melody

def generateMusic(scale):
    output = "import Euterpea\n"
    output += "\nmelody1 = " + generateMelody(scale, 10)
    output += "\nmelody2 = " + generateMelody(scale, 10)
    output += "\nmelody3 = " + generateMelody(scale, 10)
    output += "\nmusic = times 4 melody1 :+: times 4 melody2 :+: times 4 melody3"
    return output    

output = generateMusic(CLydic)

with open("music.hs", "w") as musicFile:
    musicFile.write(output)

print("Music file generated to file: music.hs")