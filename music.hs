import Euterpea

melody1 = ds 3 sn :+: g 3 qn :+: rest sn :+: as 5 en :+: as 4 qn :+: rest sn :+: gs 5 qn
melody2 = c 3 sn :+: rest en :+: gs 3 en :+: rest qn :+: as 5 en :+: g 3 sn :+: rest en :+: rest sn :+: f 4 qn :+: cs 4 sn
melody3 = as 4 en :+: c 4 qn :+: cs 3 sn :+: g 4 qn :+: gs 3 qn :+: ds 5 qn :+: cs 4 qn

crash2 = perc CrashCymbal2  qn
snare = perc AcousticSnare en
bassDrum = perc AcousticBassDrum qn
hihat = perc ClosedHiHat qn

percTact = times 2 ((bassDrum :=: (hihat :+: hihat)) :+: (snare :=: (hihat :+: hihat)))

music = (times 4 melody1 :+: times 4 melody2 :+: times 4 melody3) :=: tempo 2 (times 12 percTact)