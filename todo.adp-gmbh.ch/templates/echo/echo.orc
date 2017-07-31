sr = 44100
kr = 4410
ksmps = 10
nchnls = 2

gareverb init 0

instr 1

iamp  = p4
ifreq = p5

kamp    linseg 0,0.01,iamp,0.1,iamp/4,p3-0.21,iamp/4,0.1,0
asig    oscil   kamp,ifreq,1
        outs    asig,asig
        
gareverb = gareverb + asig/2

endin

instr 100; reverb
gareverb init 0

irevtime  = p4

apdelay delay gareverb, sqrt(irevtime)/50

acomb0 comb apdelay,irevtime,0.05
acomb1 comb apdelay,irevtime,0.056
acomb2 comb apdelay,irevtime,0.061
acomb3 comb apdelay,irevtime,0.068
acomb4 comb apdelay,irevtime,0.072
acomb5 comb apdelay,irevtime,0.078
asum   =    (acomb0 + acomb1 + acomb2 + acomb3 + acomb4 + acomb5)/6
asig0 alpass asum,irevtime, 0.006
asig1 alpass asig0,irevtime,0.0063
asig2 alpass asum,irevtime, 0.0061
asig3 alpass asig1,irevtime ,0.0062
        outs (asig0+asig1),(asig2+asig3)
gareverb = 0
endin

