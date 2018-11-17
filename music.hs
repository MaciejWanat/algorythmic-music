import Euterpea

melody1 = rest qn :+: rest sn :+: f 5 en :+: e 5 sn :+: b 4 en :+: e 5 sn :+: e 4 sn :+: e 5 en :+: e 5 qn :+: d 3 qn
melody2 = rest qn :+: g 5 sn :+: g 5 en :+: g 5 en :+: f 4 qn
melody3 = d 3 sn :+: e 3 qn :+: c 5 qn :+: rest en :+: a 5 en :+: rest en :+: rest en :+: b 4 qn :+: e 5 qn :+: b 4 en
melody4 = a 4 sn :+: e 4 sn :+: rest qn :+: rest sn :+: b 4 qn :+: g 4 sn :+: c 3 qn

crash2 = perc CrashCymbal2  qn
snare = perc AcousticSnare en
bassDrum = perc AcousticBassDrum qn
hihat = perc ClosedHiHat qn

percTact = times 2 ((bassDrum :=: (hihat :+: hihat)) :+: (snare :=: (hihat :+: hihat)))

music = (times 2 (times 4 melody1 :+: times 4 melody2) :+: (times 2 melody3) :+: (times 4 melody2)) :=: tempo 2 (times 25 percTact)