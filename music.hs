import Euterpea

melody1 = fs 3 en :+: g 4 qn :+: d 3 qn :+: b 4 en :+: c 3 sn :+: c 3 sn :+: g 4 en
melody2 = rest en :+: c 5 en :+: rest qn :+: fs 5 en :+: e 4 sn :+: rest en :+: a 4 en :+: rest qn :+: fs 3 en :+: e 3 qn
melody3 = rest en :+: rest en :+: d 4 qn :+: rest sn :+: rest en :+: d 4 qn :+: a 4 en
crash2 = perc CrashCymbal2  qn
snare = perc AcousticSnare en
bassDrum = perc AcousticBassDrum qn
hihat = perc ClosedHiHat qn

percTact = times 2 ((bassDrum :=: (hihat :+: hihat)) :+: (snare :=: (hihat :+: hihat)))

music = (times 4 melody1 :+: times 4 melody2 :+: times 4 melody3) :=: (times 8 percTact)