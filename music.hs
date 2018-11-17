import Euterpea

melody1 = rest en :+: d 4 en :+: c 4 en :+: rest en :+: rest qn :+: rest qn :+: e 4 qn :+: e 4 qn :+: rest sn :+: g 4 sn
melody2 = rest sn :+: rest qn :+: b 5 sn :+: b 5 sn :+: b 5 qn :+: d 5 sn :+: c 5 qn
melody3 = d 3 qn :+: f 3 en :+: rest sn :+: f 3 qn :+: rest qn :+: a 3 en :+: d 3 en

crash2 = perc CrashCymbal2  qn
snare = perc AcousticSnare en
bassDrum = perc AcousticBassDrum qn
hihat = perc ClosedHiHat qn

percTact = times 2 ((bassDrum :=: (hihat :+: hihat)) :+: (snare :=: (hihat :+: hihat)))

music = (times 2 (times 8 melody1 :+: times 8 melody2) :+: (times 4 melody1) :+: (times 8 melody2) :+: (times 2 melody3) :+: (times 8 melody2)) :=: tempo 2 (times 30 percTact)