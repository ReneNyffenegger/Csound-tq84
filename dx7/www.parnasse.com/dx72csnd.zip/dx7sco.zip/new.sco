;====================================================================;
;       Test score for DX7 alg 17 orc                                ;
;                                                                    ;
;       (imitates the <Pluk>   2 voice...sorta)                      ;
;                                                                    ;
;       DX72Csound by Jeff Harrington  idealord@dorsai.org           ;
;       After Models by Russell Pinkston                             ;
;  Thanks to T. Suzuki of Yamaha Corp. for the DX7 frequency tables  ;
;====================================================================;
f01     0       512     10      1
; operator fpoutput level to amp scale function (data from Chowning/Bristow)
f02     0       128     7       0       10      .003    10      .013
        10      .031    10      .079    10      .188    10      .446
        5       .690    5       1.068   5       1.639   5       2.512
        5       3.894   5       6.029   5       9.263   4       13.119
        29      13.119
; rate scaling function
f03     0       128     7       0       128     1
; eg rate rise function for lvl change between 0 and 99 (data from Opcode)
f04     0       128     -7      38      5       22.8    5       12      5
        7.5     5       4.8     5       2.7     5       1.8     5       1.3
        8       .737    3       .615    3       .505    3       .409    3
        .321    6       .080    6       .055    2       .032    3       .024
        3       .018    3       .014    3       .011    3       .008    3
        .008    3       .007    3       .005    3       .003    32      .003
; eg rate rise percentage function
f05     0       128     -7      .00001  31      .00001  4       .02     5
        .06     10      .14     10      .24     10      .35     10      .50
        10      .70     5       .86     4       1.0     29      1.0
; eg rate decay function for lvl change between 0 and 99
f06     0       128     -7      318     4       181     5       115     5
        63      5       39.7    5       20      5       11.2    5       7
        8       5.66    3       3.98    6       1.99    3       1.34    3
        .99     3       .71     5       .41     3       .15     3       .081
        3       .068    3       .047    3       .037    3       .025    3
        .02     3       .013    3       .008    36      .008
; eg rate decay percentage function
f07     0       128     -7      .00001  10      .25     10      .35     10
        .43     10      .52     10      .59     10      .70     10      .77
        10      .84     10      .92     9       1.0     29      1.0
; eg level to peak deviation mapping function (index in radians = Index / 2PI)
f08     0       128     -7      0       10      .000477 10      .002
        10      .00493  10      .01257  10      .02992  10      .07098
        5       .10981  5       .16997  5       .260855 5       .39979
        5       .61974  5       .95954  5       1.47425 4       2.08795
        29      2.08795
; velocity to amp factor mapping function (rough guess)
f09     0       129     9       .25     1       0
; velocity sensitivity scaling function
f10     0       8       -7      0       8       1
; feedback scaling function
f11     0       8       -7      0       8       7
f12   0    32    -2    99    0   99   80   25   45   
        99   99   0   0   
        0   1   1.000000   0   
        2   
f13   0    32    -2    99    1   82   85   57   99   
        99   76   30   0   
        0   0   1.000000   -1   
        1   
f14   0    32    -2    99    1   99   90   50   99   
        99   74   37   66   
        0   0   2.000000   -7   
        4   
f15   0    32    -2    99    5   99   88   94   99   
        99   68   51   99   
        0   1   8318.000000   0   
        2   
f16   0    32    -2    99    7   99   60   46   19   
        99   93   76   0   
        0   0   0.500000   0   
        2   
f17   0    32    -2    88    7   94   35   32   17   
        99   51   99   99   
        0   0   0.505000   -2   
        2   

i01 0 0.0 0.00 87 0 10 9 34  12 13 14 15 16 17 2 4000 3 8 4 6 10 9 11 6
; Algorithm = 17
; Patch name is <Pluk>   2
t 0 128


i01.1	0.00000  0.4500	       1046.50226	75;   C6 ch 1
i01.2	0.00000  0.9000	        659.25511	75;   E5 ch 1
i01.3	0.00000  0.9000	        466.16376	75;  A#4 ch 1
i01.4	0.50000  0.4500	        783.99060	75;   G5 ch 1
i01.5	1.00000  0.2250	        932.32752	75;  A#5 ch 1
i01.6	1.00000  0.9000	        622.25397	75;  D#5 ch 1
i01.7	1.00000  0.9000	        523.25113	75;   C5 ch 1
i01.8	1.25000  0.6750	        932.32752	75;  A#5 ch 1
i01.9	2.00000  1.8000	        783.99060	75;   G5 ch 1
i01.1	2.00000  1.8000	        523.25113	75;   C5 ch 1
i01.2	2.00000  1.8000	        659.25511	75;   E5 ch 1
i01.3	2.00000  1.8000	        466.16376	75;  A#4 ch 1
; time: 04/04 beat
; time: 24 clocks per quarter note
; time: 08 notated 32-nd notes in a MIDI quarter-note
; bar 1
i01.1	4.00000  0.4500	        783.99060	75;   G5 ch 1
i01.2	4.00000  0.9000	        659.25511	75;   E5 ch 1
i01.3	4.00000  0.9000	        466.16376	75;  A#4 ch 1
i01.4	4.50000  0.4500	       1046.50226	75;   C6 ch 1
i01.5	5.00000  0.4500	        783.99060	75;   G5 ch 1
i01.6	5.50000  0.2250	        932.32752	75;  A#5 ch 1
i01.7	5.00000  0.9000	        622.25397	75;  D#5 ch 1
i01.8	5.00000  0.9000	        523.25113	75;   C5 ch 1
i01.9	5.75000  0.6750	        932.32752	75;  A#5 ch 1
i01.1	6.50000  0.9000	        783.99060	75;   G5 ch 1
i01.2	6.00000  1.5000	        659.25511	75;   E5 ch 1
i01.3	0.00000  7.6000	        130.81278	75;   C3 ch 1
i01.4	0.00000  7.6000	        261.62557	75;   C4 ch 1
i01.5	6.00000  1.8000	        523.25113	75;   C5 ch 1
i01.6	7.50000  0.3000	        659.25511	75;   E5 ch 1
i01.7	6.00000  1.8000	        466.16376	75;  A#4 ch 1
; single note off  ch:  1  1. 52 (0x34)  2.  0 (0x00)
; statusbyte -128 = 0xff80
; time: 04/04 beat
; time: 24 clocks per quarter note
; time: 08 notated 32-nd notes in a MIDI quarter-note
; bar 2
i01.1	8.00000  0.4500	       1567.98174	75;   G6 ch 1
i01.2	8.00000  0.4500	       1244.50793	75;  D#6 ch 1
i01.3	8.00000  0.4500	       2093.00452	75;   C7 ch 1
i01.4	8.00000  0.4500	        932.32752	75;  A#5 ch 1
i01.5	8.00000  0.9000	        174.61412	75;   F3 ch 1
i01.6	8.00000  0.9000	        349.22823	75;   F4 ch 1
i01.7	8.50000  0.4500	       1567.98174	75;   G6 ch 1
i01.8	8.50000  0.4500	       1318.51023	75;   E6 ch 1
i01.9	8.50000  0.4500	       1244.50793	75;  D#6 ch 1
i01.1	9.00000  0.2250	       1864.65505	75;  A#6 ch 1
i01.2	9.00000  0.4500	        523.25113	75;   C5 ch 1
i01.3	9.25000  0.6750	       1864.65505	75;  A#6 ch 1
i01.4	9.50000  0.4500	        440.00000	75;   A4 ch 1
i01.5	9.50000  0.4500	        783.99060	75;   G5 ch 1
i01.6	10.00000  0.2250	        932.32752	75;  A#5 ch 1
i01.7	9.00000  1.3500	       1244.50793	75;  D#6 ch 1
i01.8	9.00000  1.3500	       1318.51023	75;   E6 ch 1
i01.9	10.00000  0.4500	       1567.98174	75;   G6 ch 1
i01.1	10.25000  0.6750	        466.16376	75;  A#4 ch 1
i01.2	10.50000  0.4500	       1318.51023	75;   E6 ch 1
i01.3	10.50000  0.4500	       1244.50793	75;  D#6 ch 1
i01.4	10.50000  0.9000	       2093.00452	75;   C7 ch 1
i01.5	11.00000  0.4500	       1318.51023	75;   E6 ch 1
i01.6	11.00000  0.4500	        391.99544	75;   G4 ch 1
i01.7	11.00000  0.4500	       1244.50793	75;  D#6 ch 1
i01.8	11.00000  0.4500	        783.99060	75;   G5 ch 1
i01.9	11.50000  0.2250	        932.32752	75;  A#5 ch 1
i01.1	11.50000  0.4500	       1567.98174	75;   G6 ch 1
i01.2	11.75000  0.2250	        466.16376	75;  A#4 ch 1
; time: 04/04 beat
; time: 24 clocks per quarter note
; time: 08 notated 32-nd notes in a MIDI quarter-note
; bar 3
i01.1	12.00000  0.2250	        233.08188	75;  A#3 ch 1
i01.2	12.00000  0.4500	       1567.98174	75;   G6 ch 1
i01.3	11.50000  0.9500	       1318.51023	75;   E6 ch 1
i01.4	11.50000  0.9500	       1244.50793	75;  D#6 ch 1
i01.5	12.25000  0.6750	        155.56349	75;  D#3 ch 1
i01.6	12.50000  0.4500	       1567.98174	75;   G6 ch 1
i01.7	12.50000  0.4500	        932.32752	75;  A#5 ch 1
i01.8	12.50000  0.4500	       2093.00452	75;   C7 ch 1
i01.9	12.50000  0.4500	       1244.50793	75;  D#6 ch 1
i01.1	13.00000  0.4500	       1567.98174	75;   G6 ch 1
i01.2	13.00000  0.4500	       1244.50793	75;  D#6 ch 1
i01.3	13.00000  0.4500	        523.25113	75;   C5 ch 1
i01.4	13.00000  0.4500	       1318.51023	75;   E6 ch 1
i01.5	13.50000  0.2250	       1864.65505	75;  A#6 ch 1
i01.6	13.50000  0.4500	        349.22823	75;   F4 ch 1
i01.7	13.50000  0.4500	        783.99060	75;   G5 ch 1
i01.8	14.00000  0.2250	        932.32752	75;  A#5 ch 1
i01.9	13.75000  0.6750	       1864.65505	75;  A#6 ch 1
i01.1	13.50000  1.3500	       1244.50793	75;  D#6 ch 1
i01.2	13.50000  1.3500	       1318.51023	75;   E6 ch 1
i01.3	14.25000  0.6750	        466.16376	75;  A#4 ch 1
i01.4	14.50000  0.9000	       1567.98174	75;   G6 ch 1
i01.5	15.00000  0.4500	       1318.51023	75;   E6 ch 1
i01.6	15.00000  0.4500	        391.99544	75;   G4 ch 1
i01.7	15.00000  0.4500	       1244.50793	75;  D#6 ch 1
i01.8	15.00000  0.4500	        783.99060	75;   G5 ch 1
i01.9	15.50000  0.2250	        466.16376	75;  A#4 ch 1
i01.1	15.50000  0.4500	       2093.00452	75;   C7 ch 1
i01.2	15.50000  0.4500	       1318.51023	75;   E6 ch 1
i01.4	15.50000  0.4500	       1244.50793	75;  D#6 ch 1
i01.5	15.75000  1.2250	        261.62557	75;   C4 ch 1

; noteoff =    88   noteon  =    88   polyaft =     0
; control =     0   program =     0   chnpres =     0
; pchbend =     0   systems =     5   defs    =     0

; end of track


; end of score
e
