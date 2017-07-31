#!/usr/bin/perl

use strict;
use warnings;

# open SCO, ">003_002.sco";
open SCO, ">003.sco";

print SCO << "END_DX7_COMMON";
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
END_DX7_COMMON

print SCO << "END_INSTR_2";
f11     0       8       -7      0       8       7
f12   0    32    -2    99    2   80   36   18   63   
        96   70   70   0   
        0   0   0.500000   0   
        2   
f13   0    32    -2    80    2   40   40   42   50   
        99   0   0   0   
        0   0   0.500000   0   
        1   
f14   0    32    -2    77    2   73   25   32   30   
        97   78   0   0   
        0   0   0.500000   0   
        2   
f15   0    32    -2    93    2   80   35   28   53   
        99   50   0   0   
        0   0   0.500000   0   
        2   
f16   0    32    -2    75    2   99   51   0   0   
        99   74   0   0   
        0   0   1.000000   0   
        2   
f17   0    32    -2    58    2   70   38   24   55   
        99   0   0   0   
        0   0   8.000000   0   
        2   
END_INSTR_2

print SCO<<"END_INSTR_3";
;f20     0       8       -7      0       8       7
f20   0    32    -2    99    0   84   29   28   76   
        99   89   0   0   
        0   0   0.500000   0   
        4   
f21   0    32    -2    76    2   80   39   28   54   
        99   89   0   0   
        0   0   0.500000   0   
        4   
f22   0    32    -2    60    1   84   29   28   76   
        99   89   0   0   
        0   0   1.000000   0   
        4   
f23   0    32    -2    97    2   94   68   24   55   
        96   76   0   0   
        0   0   0.500000   0   
        1   
f24   0    32    -2    51    2   99   0   0   0   
        99   0   0   0   
        0   0   0.500000   0   
        0   
f25   0    32    -2    82    5   94   56   24   55   
        96   78   0   0   
        0   0   4.000000   0   
        1   
END_INSTR_3

print SCO << "END_INSTR_4";
;f30     0       8       -7      0       8       7
f30   0    32    -2    99    0   99   39   32   71   
        99   98   80   0   
        0   0   0.500000   7   
        0   
f31   0    32    -2    84    0   99   39   32   71   
        99   98   80   0   
        0   0   0.500000   7   
        0   
f32   0    32    -2    99    0   99   39   32   71   
        99   98   81   0   
        0   0   0.500000   -3   
        0   
f33   0    32    -2    99    0   99   39   32   71   
        99   98   81   0   
        0   0   0.500000   -2   
        0   
f34   0    32    -2    99    0   99   39   32   71   
        99   98   81   0   
        0   0   0.500000   1   
        0   
f35   0    32    -2    80    0   99   39   32   71   
        99   98   88   0   
        0   0   0.500000   0   
        0   
END_INSTR_4


print SCO "f100 0 2048  10 1; for instr 1\n";
print SCO "t0 20\n";

#  Breath
for (my $i = 0 ; $i < 16; $i++) {
  
  my $f1 = int(800 + (3500-800)/16*$i);
  my $f2;

  if ($i % 2) {
    $f2 = int(750 + (1500-750)/16 * $i);
  }
  else {
    $f2 = int(100 + (500-100)/16 * $i)
  }

  print SCO "i1     $i    1  400   $f2   $f1\n";
}

# instr 2 (bass line)

my $bass_oct="6";
my $g =".07";
my $a =".09";
my $f =".05";
my $bb=".10";
my $eb=".03";
my $d =".02";
my $c_=".01";

my @bass_line =  (
  $bass_oct . $g,
  $bass_oct . $g,
  $bass_oct . $g,
  $bass_oct . $f,
  $bass_oct . $bb,
  $bass_oct . $eb,
  $bass_oct . $eb,
  $bass_oct . $d,
  $bass_oct . $g,
  $bass_oct . $c_,
  $bass_oct . $a,
);

my $t=0;
foreach my $bass_t (@bass_line) { 
  print SCO "i2 $t 1 $bass_t 60\n";
  $t++;
}



###### Instr 3

my @line_3 = (
  '8.06',
  '8.05',
  '8.03',
  '8.03',
  '8.02',
);
#);

$t=0;
for my $t3 (@line_3) {
  #my $l  = $t3->{l};
  #my $n  = $t3->{n};
  my $ampl=0.3;
  print SCO "i3 $t.00 0.25 $t3 $ampl 10\n";
  print SCO "i3 $t.25 0.25 $t3 $ampl 10\n";
  print SCO "i3 $t.50 0.25 $t3 $ampl 10\n";
  print SCO "i3 $t.75 0.25 $t3 $ampl 10\n";
  $t += 1;
}


### instr 4

my @line_4 = (
  '7.11',
  '7.10',
  '7.10',
  '7.09',
  '7.09',
);

$t=0;
for my $t4 (@line_4) {
  print SCO "i4 $t.00  0.625 $t4 0.1 20\n";
  print SCO "i4 $t.625 0.375 $t4 0.1 20\n";
  $t +=1;
}


__END__

      
 1      G  2    B  4   D     F#  3 
 2      G  2    Bb 4   D     F   3
 3      G  2    Bb 4   C     Eb  3
 4      F  2    A  4   C     Eb  3
 5      Bb 2    D      F     A   4
