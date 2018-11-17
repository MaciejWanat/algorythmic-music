import Euterpea

melody1 = af 4 sn :+: af 5 sn :+: af 5 sn :+: ef 4 qn :+: df 5 qn :+: rest en :+: rest en
melody2 = c 5 en :+: g 4 en :+: df 3 sn :+: af 3 en :+: af 5 en :+: bf 4 qn :+: af 3 sn :+: df 4 sn :+: c 5 sn :+: ef 4 sn
melody3 = df 3 sn :+: ef 3 sn :+: rest sn :+: g 3 en :+: g 3 qn :+: bf 3 qn :+: ef 4 qn
crash2 = perc CrashCymbal2  qn
snare = perc AcousticSnare en
bassDrum = perc AcousticBassDrum qn
hihat = perc ClosedHiHat qn

percTact = times 2 ((bassDrum :=: (hihat :+: hihat)) :+: (snare :=: (hihat :+: hihat)))

music = (times 4 melody1 :+: times 4 melody2 :+: times 4 melody3) :=: (times 8 percTact)