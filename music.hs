import Euterpea

melody1 = rest en :+: cs 5 sn :+: f 4 sn :+: rest sn :+: cs 3 qn :+: as 5 en :+: ds 3 en
melody2 = c 5 en :+: rest en :+: rest qn :+: c 5 qn :+: cs 5 qn :+: f 3 en :+: rest en :+: ds 5 qn :+: ds 3 qn :+: as 3 sn
melody3 = ds 3 en :+: rest en :+: f 4 sn :+: g 3 en :+: f 5 en :+: cs 5 qn :+: c 3 qn

crash2 = perc CrashCymbal2  qn
snare = perc AcousticSnare en
bassDrum = perc AcousticBassDrum qn
hihat = perc ClosedHiHat qn

percTact = times 2 ((bassDrum :=: (hihat :+: hihat)) :+: (snare :=: (hihat :+: hihat)))

music = (times 4 melody1 :+: times 4 melody2 :+: times 4 melody3) :=: tempo 2 (times 12 percTact)