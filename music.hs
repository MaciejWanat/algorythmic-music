import Euterpea

melody1 = e 3 en :+: g 4 sn :+: e 4 en :+: rest sn :+: rest qn :+: c 4 en :+: a 5 en :+: b 3 qn :+: rest en :+: e 4 en
melody2 = rest sn :+: b 4 en :+: a 5 qn :+: f 3 en :+: rest sn
melody3 = rest en :+: c 3 qn :+: rest sn :+: rest qn :+: rest sn :+: rest qn :+: c 4 qn :+: rest qn :+: rest en :+: rest qn
melody4 = g 4 qn :+: rest sn :+: rest sn :+: a 4 sn :+: d 5 qn :+: rest qn :+: rest en

crash2 = perc CrashCymbal2  qn
snare = perc AcousticSnare en
bassDrum = perc AcousticBassDrum qn
hihat = perc ClosedHiHat qn

percTact = times 2 ((bassDrum :=: (hihat :+: hihat)) :+: (snare :=: (hihat :+: hihat)))

music = (times 2 (times 4 melody1 :+: times 4 melody2) :+: (times 2 melody3) :+: (times 4 melody2)) :=: tempo 2 (times 20 percTact)