sr  = 44100
kr  = 4410

nchnls = 1


;  Single Carrier with parallelel modulators
;  -----------------------------------------
;
;
;
;     
;  imodamp1                   imodamp2
;      |                          |       
;      |   imodfrq1               |   imodfrq2
;      |      |                   |      |
;      |      |     icarfrq       |      |
;      V      V        |          V      V
;   +-----------+      |       +-----------+
;   |           |      |       |           |
;   |   OSCIL   |      |       |   OSCIL   |
;   |           |      |       |           |
;   +-----+-----+      |       +-----+-----+
;         |            V             |
;         |          +---+           |
;         |          |   |           |
;         +--------->+ + |<----------+
;                    |   |
;                    +-+-+
;             iamp     |
;               |      |
;               |      |
;               V      V        
;            +-----------+
;            |           |
;            |   OSCIL   |
;            |           |
;            +-----+-----+
;                  |
;                  |
;                  V
;                asig
;


instr 1
  ilen        = p3
  iamp        = p4

  icarfrq     = cpspch(p5)

  icarfrq1    = p6 * icarfrq
  imodratio1  = p7
  ifmindex1   = p8

  icarfrq2    = p9 * icarfrq
  imodratio2  = p10
  ifmindex2   = p11

  imodfrq1    = icarfrq1 * imodratio1
  imodamp1    = imodfrq1 * ifmindex1

  imodfrq2    = icarfrq2 * imodratio2
  imodamp2    = imodfrq2 * ifmindex2

  kfrq_mod_1  oscili imodamp1, imodfrq1, 1  
  kfrq_mod_2  oscili imodamp2, imodfrq2, 1  

  asig        oscili iamp    , icarfrq + kfrq_mod_1 + kfrq_mod_2, 1  

  kenv        linseg 1, ilen, 0
              out   asig * kenv
endin
