#!/usr/bin/perl
use warnings;
use strict;

open ORC, ">granul01.orc";
open SCO, ">granul01.sco";

my $nof_granules    =  400;
my $nof_func_tables =  400;

print SCO "f1 0 1024 10 1\n";

for (my $i=2; $i<=$nof_func_tables+1;$i++) {

  my $len_a = 2 + int (rand(8));
  my $len_b = 2 + int (rand(15));
  my $len_c = 2 + int (rand(6));
  
  my $start = int (rand(900));

  my $total_len = 1024;

  my $remaining   = $total_len - $len_a - $len_b - $len_c;

  print SCO "f$i  0  $total_len 7 0 $start 0 $len_a 1 $len_b 1 $len_c 0 $remaining 0\n";
}

print SCO << 'END';

i1 0  2 10000 7.00
;i1 2  2 10000 7.03
;i1 4  2 10000 7.07
;i1 6  2 10000 7.10
;i1 8  2 10000 8.00

END


print ORC << 'END';
sr     = 44100
kr     = 44100
ksmps  = 1
nchnls = 1

instr 1
  ilen =        p3 ; unused....
  iamp =        p4 / 10
  ifrq = cpspch(p5)

  atot = 0
END

for (my $i=2; $i<=$nof_func_tables+1;$i++) {
  my $freq = 1/ (1 + rand(1));
  print ORC "  kenv$i oscili 1, $freq, $i\n";
}

for (my $i = 0; $i<$nof_granules; $i++) {

  my $ft = 2+int rand($nof_func_tables-1);
  my $fd = 0.99 + rand(0.02);

  my $o;

  my $r = rand;

  if ($r > 0.7) {
    $o = 1;
  }
  elsif ($r > 0.6) {
    $o = 2;
  }
  elsif ($r > 0.6) {
    $o = 2;
  }
  elsif ($r > 0.45) {
    $o = 3;
  }
  elsif ($r > 0.2) {
    $o = 4;
  }
  else {
    $o = 5;
  }


print ORC << "END";

  asig$i oscili iamp, $o *  $fd * ifrq, 1
  asig$i = kenv$ft * asig$i
  ;asig$i = kenv$ft * 10000

  atot = asig$i + atot
END
}

print ORC << 'END';

  out atot 

endin
END
