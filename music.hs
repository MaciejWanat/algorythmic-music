import Euterpea

melody1 = b 4 en :+: rest qn :+: gs 5 sn :+: a 5 en :+: fs 5 en :+: rest qn :+: rest en
melody2 = e 3 sn :+: a 5 qn :+: f 4 qn :+: as 5 qn :+: a 3 sn :+: cs 4 qn :+: rest en :+: rest sn :+: rest qn :+: c 5 qn
melody3 = a 4 sn :+: c 4 en :+: rest en :+: rest sn :+: b 5 qn :+: d 3 en :+: fs 5 sn

crash2 = perc CrashCymbal2  qn
snare = perc AcousticSnare en
bassDrum = perc AcousticBassDrum qn
hihat = perc ClosedHiHat qn

percTact = times 2 ((bassDrum :=: (hihat :+: hihat)) :+: (snare :=: (hihat :+: hihat)))

music = (times 4 melody1 :+: times 4 melody2 :+: times 4 melody3) :=: tempo 2 (times 12 percTact)