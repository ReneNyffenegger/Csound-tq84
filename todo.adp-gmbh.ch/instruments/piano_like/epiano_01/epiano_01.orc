sr     = 44100
kr     = 44100
ksmps  = 1
nchnls = 2

#define INTERP(a1' am' a2' b1' b2') #(($b2 - $b1)*($am - $a1)/($a2 - $a1)+$b1)#

;
; Gardner reverb uses zaw system audio channel 1
;

  zakinit 300,300



instr 1
  idur    =        p3
  iamp    = ampdb (p4)
  ifrq    = cpspch(p5)
  
  ipan    =        p6
  irvbch  =        p7
  iwet    =        p8
  
  iatt    =      0.01
  itail   =      0.05
  
  icmatt  =       1.0
  iindatt =       3.0
  
  icmbod  =       1.0
  iindbod =       2.0

  ; Generate attack sound
  aatt  foscili 1.0, ifrq*0.99, 1.0, 1.0/icmatt, iindatt, 1
  aatt  buthp aatt, 2.0*ifrq

  ; Generate main body sound
  kind  expseg 1.0, iatt, 1.0, 5.0, 0.001
  kind  = kind * iindbod
  abody foscili 1.0, ifrq, 1.0, 1.0/icmbod, kind, 1

  ; Fade between sounds
  kfade linseg 0.0, iatt, 1.0, idur-iatt, 1.0
  ;kfade   = 1.0
  asig  = kfade * abody + (1-kfade) * aatt
  asig  reson asig, 2.0*ifrq, ifrq, 1

  ; Apply ampl envelope
  kenv1 linseg 0.0, iatt, 1.0, idur, 1.0
  kenv2 expseg 1.0, iatt, 1.0, 10.0, 0.001
  kenv3 linseg 1.0, idur-itail, 1.0, itail, 0.0
  kenv  = kenv1 * kenv2 * kenv3
  asig  = asig * kenv * iamp

  aout  = asig

  aamb  = aout
  aamb  butlp aamb, 2000.0

  zawm aamb*iwet, irvbch

  outs (1.0-ipan)*(1.0-iwet)*aout, ipan*(1.0-iwet)*aout
endin

instr     2
  
  idur      =         p3
  iamp      =         p4
  iinch     =         p5
  
  aout91    init      0
  adel01    init      0
  adel11    init      0
  adel51    init      0
  adel52    init      0
  adel91    init      0
  adel92    init      0
  adel93    init      0
  
  kdclick   linseg    0, .002, iamp, idur-.004, iamp, .002, 0
  
  ; INITIALIZE
  asig0     zar       iinch
      zacl      iinch, iinch             ; clear for next iteration
  aflt01    butterlp  asig0, 4000              ; PRE-FILTER
  aflt02    butterbp  .5*aout91, 1000, 500     ; FEED-BACK FILTER
  asum01    =         aflt01+.5*aflt02         ; INITIAL MIX
  
  ; ALL-PASS 1
  asub01    =         adel01-.3*asum01         ; FEEDFORWARD
  adel01    delay     asum01+.3*asub01,.008    ; FEEDBACK
  
  ; ALL-PASS 2
  asub11    =         adel11-.3*asub01         ; FEEDFORWARD
  adel11    delay     asub01+.3*asub11,.012    ; FEEDBACK
  
  adel21    delay     asub11, .004             ; DELAY 1
  adel41    delay     adel21, .017             ; DELAY 2
  
  ; SINGLE NESTED ALL-PASS
  asum51    =         adel52-.25*adel51        ; INNER FEEDFORWARD
  aout51    =         asum51-.5*adel41         ; OUTER FEEDFORWARD
  adel51    delay     adel41+.5*aout51,   .025 ; OUTER FEEDBACK
  adel52    delay     adel51+.25*asum51, .062  ; INNER FEEDBACK
  
  adel61    delay     aout51, .031             ; DELAY 3
  adel81    delay     adel61, .003             ; DELAY 4
  
  ; DOUBLE NESTED ALL-PASS
  asum91    =         adel92-.25*adel91        ; FIRST  INNER FEEDFORWARD
  asum92    =         adel93-.25*asum91        ; SECOND INNER FEEDFORWARD
  aout91    =         asum92-.5*adel81         ; OUTER FEEDFORWARD
  adel91    delay     adel81+.5*aout91, .120   ; OUTER FEEDBACK
  adel92    delay     adel91+.25*asum91, .076  ; FIRST  INNER FEEDBACK
  adel93    delay     asum91+.25*asum92, .030  ; SECOND INNER FEEDBACK
  
  aout      =         .8*aout91+.8*adel61+1.5*adel21 ; COMBINE OUTPUTS
  
            outs      aout*kdclick, -aout*kdclick     ; FINAL OUTPUT
endin
