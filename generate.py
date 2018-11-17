#!/usr/bin/env python3

import random
import sys

output = ""
isValid = True
withDrums = False

chromatic = ["c", "cs", "d", "ds", "e", "f", "fs", "g", "gs", "a", "as", "b"]
chromaticLooped = chromatic + chromatic
baseChromatic = ["c", "d", "e", "f", "g", "a", "h"] 

# w - whole tone, h - half tone
phrygianIntervals = ["h", "w", "w", "w", "h", "w"]
lydicIntervals = ["w", "w", "w", "h", "w", "w"]
ionicIntervals = ["w", "w", "h", "w", "w", "w"]
doricIntervals = ["w", "h", "w", "w", "w", "h"]
aeolianIntervals = ["w", "h", "w", "w", "h", "w"]
mixolydianIntervals = ["w", "w", "h", "w", "w", "h"]

chromaticIntervals = ["h", "h", "h", "h", "h", "h", "h", "h", "h", "h", "h"]

scales = {
    "phrygian": phrygianIntervals,
    "lydic" : lydicIntervals,
    "ionic" : ionicIntervals,
    "doric" : doricIntervals,
    "dorian"  : doricIntervals,
    "aeolian" : aeolianIntervals,
    "mixolydian" : mixolydianIntervals,
    "chromatic": chromaticIntervals
}

allowedOctaves = ["3", "4", "5"]
allowedRythmic = ["qn", "en", "sn"]

soundOrPause = ["sound", "sound", "sound", "pause"]

drums = "\n\ncrash2 = perc CrashCymbal2  qn\n\
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

# Caomposition 1: Short melody, short start, longer mid, short end
def generateComposition1(scale, withDrums):
    output = ""

    output += "\nmelody1 = " + generateMelody(scale, 7)
    output += "\nmelody2 = " + generateMelody(scale, 10)
    output += "\nmelody3 = " + generateMelody(scale, 7)

    if (withDrums):
        output += drums
        output += "\n\nmusic = (times 4 melody1 :+: times 4 melody2 :+: times 4 melody3) :=: tempo 2 (times 12 percTact)"
    else:
        output += "\n\nmusic = times 4 melody1 :+: times 4 melody2 :+: times 4 melody3"

    return output

compositions = {
    1: generateComposition1
}

def generateMusic(scale, withDrums, compositionNumber):
    output = "import Euterpea\n"
    output += compositions[compositionNumber](scale, withDrums)
    return output    

def generateScale(sound, scale):
    chromaIter = iter(chromaticLooped)

    currItem = next(chromaIter)
    while(currItem != sound):
        currItem = next(chromaIter)
    
    result = [currItem]
    for interval in scale:
        if interval == "w":
            next(chromaIter)
            currItem = next(chromaIter)
        if interval == "h":
            currItem = next(chromaIter)
        result.append(currItem)

    return result

if sys.argv[1].lower() not in scales:
    print("> Scale not found")
    isValid = False

if sys.argv[2].lower() not in chromatic:
    print("> Base sound not found")
    isValid = False        

compositionNumber = int(sys.argv[3])
if compositionNumber not in compositions:
    print("> Composition number ", int(sys.argv[3]), " not found")
    isValid = False    

if (isValid):
    if sys.argv[4].lower() == "true":
        withDrums = True

    scale = generateScale(sys.argv[2], scales[sys.argv[1].lower()])
    print("> Generated scale: ", scale)
    output = generateMusic(scale, withDrums, compositionNumber)
    print("> Generated music with pattern", compositionNumber, ", in key", sys.argv[2].upper(), sys.argv[1].lower())
    with open("music.hs", "w") as musicFile:
        musicFile.write(output)

    print("> Saved to file: music.hs")