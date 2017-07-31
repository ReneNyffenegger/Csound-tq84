sr     = 44100
kr     = 44100
nchnls = 2


instr 1

  ilen    = p3
  iamp    = p4
  ifrq    = cpspch(p5)

  ix      = p6
  iy      = p7
  
  idistr  = sqrt ( iy*iy + (ix-0.1) * (ix-0.1) )
  idistl  = sqrt ( iy*iy + (ix+0.1) * (ix+0.1) )

  ;print idistr
  ;print idistl

  idelayr = idistr/340
  idelayl = idistl/340

  ;print idelayr
  ;print idelayl

  p3      = p3 + (idelayr > idelayl ? idelayr : idelayl)

  iloudr  = iamp/(idistr*idistr)
  iloudl  = iamp/(idistl*idistl)

  kenvr     linseg 0, idelayr, 0, 0.02, iloudr, ilen-0.02 - 0.1, iloudr*0.7, 0.1, 0
  kenvl     linseg 0, idelayl, 0, 0.02, iloudl, ilen-0.02 - 0.1, iloudl*0.7, 0.1, 0

  asigr     oscili kenvr, ifrq, 1
  asigl     oscili kenvl, ifrq, 1
   
  outs asigl, asigr
endin
