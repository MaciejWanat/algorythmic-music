#!/usr/bin/env python3

import random
import sys

output = ""
isValid = True
withDrums = False

CPhrygian = ["c", "df", "ef", "g", "af", "bf"]
CLydic = ["c", "d", "e", "fs", "g", "a", "b"]

scales = { 
    "phrygian": CPhrygian,
    "lydic": CLydic 
    }

allowedOctaves = ["3", "4", "5"]
allowedRythmic = ["qn", "en", "sn"]

soundOrPause = ["sound", "sound", "sound", "pause"]

drums = "\ncrash2 = perc CrashCymbal2  qn\n\
snare = perc AcousticSnare en\n\
bassDrum = perc AcousticBassDrum qn\n\
hihat = perc ClosedHiHat qn\n\n\
percTact = times 2 ((bassDrum :=: (hihat :+: hihat)) :+: (snare :=: (hihat :+: hihat)))"

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

def generateMusic(scale, withDrums):
    output = "import Euterpea\n"
    output += "\nmelody1 = " + generateMelody(scale, 7)
    output += "\nmelody2 = " + generateMelody(scale, 10)
    output += "\nmelody3 = " + generateMelody(scale, 7)

    if (withDrums):
        output += drums
        output += "\n\nmusic = (times 4 melody1 :+: times 4 melody2 :+: times 4 melody3) :=: (times 8 percTact)"
    else:
        output += "\n\nmusic = times 4 melody1 :+: times 4 melody2 :+: times 4 melody3"

    return output    

if sys.argv[1].lower() not in scales:
    print("> Scale not found")
    isValid = False

if (isValid):
    scale = scales[sys.argv[1].lower()]
    if sys.argv[2].lower() == "true":
        withDrums = True

    output = generateMusic(scale, withDrums)

    with open("music.hs", "w") as musicFile:
        musicFile.write(output)

    print("> Music file generated to file: music.hs")