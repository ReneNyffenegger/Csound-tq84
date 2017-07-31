sr = 44100
kr  =  441
ksmps= 100
nchnls = 1

instr 1;
ilen  = p3
iamp1 = p4   
ifq1  = cpspch(p5)   
iamp2 = 0.6 * iamp1
ifq2  = 75*ifq1/160
iamp3 = 0.3 * iamp1
ifq3  = 31*ifq1/160
iatt1 = .01
idec1 = 1.6
iatt2 = 0.01
idec2 = 1.61
iatt3 = 0.01
idec3 = 1.61


iseg1 = ilen-(iatt1+idec1)
iseg2 = ilen-(iatt2+idec2)
iseg3 = ilen-(iatt3+idec3)

   ae1  expseg   .00097,iatt1, .99,iseg1, .9,idec1, .00097       ; unit 1
   ae1  =        ae1 * iamp1
   a1   oscili   ae1, ifq1* 0.9, 1

   ae2  expseg   .0039,iatt2, .99,iseg2, .99,idec2, .0000000059   ; unit 2
   ae2  =        ae2 * iamp2
   a2   oscili   ae2, ifq2* 0.9, 2

   ae3  expseg   .0039,iatt3, .99,iseg3, .99,idec3,.00000000000009; unit 3
   ae3  =        ae3 * iamp3
   a3   oscili   ae3, ifq3*0.9, 3
        out      a1+a2+a3
endin
