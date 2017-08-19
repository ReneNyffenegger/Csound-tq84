 <CsoundSynthesizer>

   <CsOptions>
     -odac
   </CsOptions>

   <CsInstruments>

     instr 2
       iamp = ampdb(p4)
       iamp = iamp * 0.5
       a0 soundin "../../../in/hellorcb.aif"
       a1 = a0/30000
       
       scanu 1, 0.01, 6, 2, 33, 44, 5, 2, 0.01, 0.05, -0.05, 0.1, 0.5, 0, 0, a1, 1, 0

       a2 scans iamp, cpspch(p5)     ,  7, 0
       a3 scans iamp, cpspch(p5)*1.01, 77, 0
       
       out a3 + a2 + a0*0.1
     endin
  </CsInstruments>

  <CsScore>

  ; Initial condition
    f1 0 128 7 0 64 1 64 0

  ; Masses
    f2 0 128 -7 1 128 1

  ; Spring matrices
    f33 0 16384 -23 "../../../in/cylinder-128,8"
    
  ; Centering force
    f44 0 128 -7 2 64 0 64 2

  ; Damping
    f5 0 128 -7 1 128 1
  
  ; Initial velocity
    f6 0 128 -7 -.0 128 .0
    
  ; Trajectories
    f7  0 128 -5 .001 128 128
    f77 0 128 -23 "../../../in/spiral-8,16,128,2,1over2"
    
  ; Note list
  
    i2  0 5 63 6.00
    i2  6 5 60 7.00
    i2 10 5 60 8.00
    i2 14 7 60 5.00
    
  </CsScore>
</CsoundSynthesizer> 
