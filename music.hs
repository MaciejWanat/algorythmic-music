import Euterpea

melody1 = df 5 en :+: rest sn :+: ef 5 en :+: rest en :+: g 4 en :+: c 4 sn :+: df 5 en
melody2 = af 5 sn :+: df 5 en :+: c 4 sn :+: c 4 en :+: af 3 en :+: df 4 en :+: g 4 qn :+: af 4 qn :+: bf 5 qn :+: rest en
melody3 = af 3 en :+: bf 3 sn :+: rest en :+: g 3 en :+: rest en :+: g 5 sn :+: rest qn

crash2 = perc CrashCymbal2  qn
snare = perc AcousticSnare en
bassDrum = perc AcousticBassDrum qn
hihat = perc ClosedHiHat qn

percTact = times 2 ((bassDrum :=: (hihat :+: hihat)) :+: (snare :=: (hihat :+: hihat)))

music = (times 4 melody1 :+: times 4 melody2 :+: times 4 melody3) :=: tempo 2 (times 12 percTact)