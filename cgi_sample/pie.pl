#!/usr/bin/perl -w

###################################################################
#
# Copyright (c) 1999 Dmitry Ovsyanko, do@mobile.ru
#
# This CGI script receives an arg list like 'a=1&b=2&z=13' 
# and outputs a PNG image with corresponding pie chart. 
#
###################################################################

use CGI;
use PNGgraph;
use PNGgraph::pie;

use vars qw/$q/;

my $treshold = 5;

$q = new CGI;

my $cap = $q -> param('cap');
my $sql = $q -> param('sql');

my @prms = $q -> param;

my %pv =();
my %pv2 =();

foreach (@prms) { $pv{$_} = $q -> param($_) };

my $i = 0;
my $s = 0;
my $n;
foreach $n (sort {$pv{$b}<=>$pv{$a}}(keys (%pv))) 
 {
  $i++;
  $s += $pv{$n};
  if ($i <= $treshold)
    {
     $pv2{$n} = $pv{$n};   
    }
   else
    {
     $pv2{'others'} += $pv{$n};   
    };
 };

my @x = ();
my @y = ();

foreach $n (sort {$pv2{$a}<=>$pv2{$b}}(keys (%pv2)))
 {
  push @x, $n.' ('.int(100*$pv2{$n}/$s).'%)';
  push @y, $pv2{$n};
 }; 

my $chart = new PNGgraph::pie (320,210);

#$chart -> set (start_angle => 10);

print $q -> header('image/png');
print $chart -> plot ([\@x, \@y]);

