; A CSOUND HALLOWEEN PART 1

; 1. WIND
; 2. WOLF HOWL
; 3. THUNDER
; 4. PIPE ORGAN
; 5. CREAKING DOOR
; 6. CHURCH BELL
; 7. MOANING
; 8. BUBBLING CAULDRON
; 9. BIG METAL DOOR SLAM
;10. JACOB'S LADDER (MANDELBROT SET)
;11. GHOSTIES 1
;12. GHOSTIES 2
;13. ELECTRONIC NOISES *
;14. SCURRYING RATS *
;15. FLUTTERING BATS *
;16. GHOSTS *
;17. CHAINS *
;18. THUMPING *
;19. SCREAMS *
;* NOT IMPLEMENTED YET
;* SUGGESTED MUSIC (NOT IMPLEMENTED)
;BACH'S TOCATTA AND FUGUE IN DM (INTRO)
;MUGORSKI'S NIGHT ON BALD MOUNTAIN *
;DANCE MACABRE *
;THE CAT CAME BACK *

f1  0 8192  10    1  

f2  0 1024  -7    0     256   5000  256   2500  256   4000  256   0 
f3  0 1024  -7    800   256   5000  256   2000  256   800   256   1000
f4  0 1024  -7    2000  256   1000  256   500   256   2000  256   1000
f5  0 1024  7     1     512   0     512   1 
f9  0 1024  7     1     512   1     0     -1    512   -1
f13 0 2049  7     0     200   1     200   .5    1200  .5    448   0 
f14 0 2048  7     0     1024  1     1024  0
f19 0 1024  19    .5    .5    270   .5

; WIND
;   Sta  Dur  AmpTab  Fq1Tab  Fq2Tab  PanTab
i1  0  8      2      3      4      5    
i1  6  8      2      4      3      5    
i1  12 8      2      3      4      5    
i1  16 8      2      4      3      5    
i1  22 8      2      3      4      5    

f6  0 1024  -7    580   64    600   64    750   384   650   128   415   384   360
f7  0 1024  -7    740   448   720   64    460   784   326
f8  0 1024  -7    820   448   780   128   740   720   720
; FORMANTS
f20 0 1024  -7    492.3 128   492.2 128   518.8 256   518.8 512   475.5
f21 0 1024  -7    5     128   4     128   1     256   .9    512   .8 
f22 0 1024  -7    700.2 128   735.4 128   735.7 256   706   512   806
f23 0 1024  -7    11.2  128   20.4  128   44    256   75    512   85
f24 0 1024  -7    1079  128   1052  128   1080  256   1095  512   1095
f25 0 1024  -7    15.7  128   10    128   10    256   16.4  512   16.1
f26 0 1024  -7    1457  128   1453  128   1426  256   1426  512   1412
f27 0 1024  -7    5     128   8.7   128   8.3   256   40.6  512   30.7
f28 0 1024  -7    1672  128   1729  128   1776  256   1640  512   1686
f29 0 1024  -7    5.1   128   5     128   2.1   256   4.5   512   4.4
; WOLF HOWL
;    Sta  Dur  Amp  FqcTab  FrmTab  Pan  Fco
i2  12 4      10     6      20     1      1000 
i2  13 2      25     8      20     .2     1500
i2  15 4      150    7      20     .8     4000
i2  18 .5     80     6      20     .7     2000
i2  18.5      1      100    7      20     .6     3000
i2  19 4      170    6      20     .2     6000

; THUNDER
;    Sta   Dur  Amp   Fqc  Fco  Atk  Pan
i3  14 4      6000   100    100    40     .5  
i3  17 4      6800   80     200    10     .7  
i3  18 4      6000   150    150    15     .8  
i3  19 1.5    5200   400    400    2      .3   

; CREAKING DOOR
f30 0 1024  7     1     128   1     128   .8    128   .4    256   .5    128   .4    256   .001
f31 0 1024  7     0     256   1     128   -.2   128   .5    256   -1    256   0 
f32 0 1024  7     0     256   .2    256   0     256   1     256   1 
;   Sta  Dur  Amp   Fqc  FqcTab  Wave  PanTab  AmpTab
i5  0  4      2000   80     30     31     5      32   
i5  2  6      7000   300    30     31     5      32   
i5  22 4      2000   80     30     31     5      32   
i5  24 6      7000   600    30     31     5      32   

;BIG IRON DOOR SLAM
;   Sta  Dur  Gain  RevTime  RvFreq  FeedBk  Length  SHFqc   Fco  Atk  Pan
i9  30 3      7      18     .8     3.25   .125   3000   100    .01    1  

f40 0 1024  7     0     512   1     512   1 
; ORGAN INTRO TO BACH'S TOCCATA & FUGUE IN DMINOR
;   Sta   Dur   Amp    Fqc   Pan  OutCh1  OutCh2
i4  26 .12    200    7.09   .9     1      2    
i4  +  .1     300    7.07   .8     1      2    
i4  .  .8     400    7.09   .7     1      2    
i4  27.2      .16    500    7.07   .6     1      2    
i4  +  .14    600    7.05   .5     1      2    
i4  .  .12    700    7.04   .4     1      2    
i4  .  .12    800    7.02   .3     1      2    
i4  .  .56    900    7.01   .4     1      2    
i4  .  1.2    1200   7.02   .5     1      2    
;
i4  29.8      .12    1600   6.09   .5
i4  +  .1     .      6.07   .5
i4  .  .8     .      6.09   .5
i4  31 .3     .      6.05   .5
i4  +  .3     .      6.07   .5
i4  .  .3     .      6.01   .5
i4  .  1.2    .      6.02   .5
;
i4  33.2      .12    3000   5.09   .5
i4  +  .1     .      5.07   .5
i4  .  .8     .      5.09   .5
i4  34.4      .16    .      5.07   .5
i4  +  .14    .      5.05   .5
i4  .  .12    .      5.04   .5
i4  .  .12    .      5.02   .5
i4  .  .56    .      5.01   .5
i4  .  1.2    .      5.02   .5
;
i4  36.5      2.0    .      5.01   .5
i4  36.7      1.8    .      5.04   .5
i4  36.9      1.6    .      5.07   .5
i4  37.1      1.4    .      5.10   .5
i4  37.3      1.2    .      6.01   .5
;
i4  38.7      3.2    .      5.02   .5
i4  38.7      3.2    .      6.02   .5
i4  38.7      0.8    .      5.07   .5
i4  +  0.8    .      5.09   .5
i4  .  1.6    .      5.06   .5

f50 0 1024  7     .8    1024  .2
; REVERB
;   Sta  Dur  Amp  MixTab  InCh1  InCh2
i46 26 17     1      50     1      2    

; CHURCH BELL
;    Sta  Dur  Amp    Fqc   Pan  OutCh1  OutCh2
i6  42 2.0    1000   8.02   1.0    3      4    
i6  +  .      <      8.02   <      .      .    
i6  .  .      <      8.02   <      .      .    
i6  .  .      <      8.02   <      .      .    
i6  .  .      <      8.02   <      .      .    
i6  .  .      <      8.02   <      .      .    
i6  .  .      <      8.02   <      .      .    
i6  .  .      <      8.02   <      .      .    
i6  .  .      <      8.02   <      .      .    
i6  .  .      <      8.02   <      .      .    
i6  .  .      <      8.02   <      .      .    
i6  .  .      5000   8.02   0.0    .      .    
; REVERB
f51 0 1024  7     .3    1024  .01
;   Sta  Dur  Amp  MixTab  InCh1  InCh2
i46 42 26     1      51     3      4    

;BIG IRON DOOR SLAM
;   Sta  Dur  Gain  RevTime  RvFreq  FeedBk  Length  SHFqc   Fco  Atk  Pan
i9  66 3      12     18     .8     3.25   .125   2000   100    .01    .5 

;BUBBLING BREW
;     Sta  Dur  Gain  Fqc  Krt  PanTab
i8  66 12     .8     .1     100    14 
i8  66 6      .8     .2     100    14 
i8  +  6      .01    .2     100    14 
;i8    78   8     .8    .1   100  14

; ELECTRONIC ZAP FROM THE MANDELBROT SET.
;    Sta  Dur  Amp  Pitch XCorner  YCorner  XStep   YStep  MaxLoop  Pan
i10 70 1.0    60     7.00   -0.6   -0.8   .0002  .002   400    1.0
i10 71.7      0.2    30     7.00   <      -0.8   .0002  .002   400    0.5
i10 71.9      0.3    30     7.00   <      -0.8   .0002  .002   400    0.5
i10 72.5      1.2    20     7.00   <      -0.8   .0002  .002   400    0.3
i10 74.0      0.7    40     7.00   <      -0.8   .0002  .002   400    0.8
i10 74.8      2.0    50     7.00   -0.5   -0.8   .0002  .002   400    0.1

; GHOSTIES
;  Start  Dur  Amp  Frqc 
i11 44 6      5      7.00 
i12 48 3      7      8.00 
i11 50.4      0.8    12     7.06
i11 50.7      0.8    8      7.02 
i12 51.0      0.8    14     7.06
i12 51.3      0.8    9      7.02 
i12 51.0      4      15     9.00
i11 54 5      17     6.10
i12 58 2      25     8.02
i11 60.4      1.2    22     7.04
i11 60.7      1.2    13     8.05
i12 61.0      1.0    22     7.03
i12 61.3      1.0    13     7.02
i12 61.0      4      18     8.07


