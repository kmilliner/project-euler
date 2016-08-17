#!/usr/bin/perl

# Author: Daniel "Trizen" Șuteu
# Date: 18 August 2016
# License: GPLv3
# Website: https://github.com/trizen

# https://projecteuler.net/problem=221

use 5.010;
use strict;
use ntheory qw(divisors is_prime);

my %nums;
my $count = 0;

my $nth = 150000;
my $prev = 6;

OUT: for my $n (1 .. $nth) {
    foreach my $d (divisors($n**2 + 1)) {
        my $A = $n * ($n + $d) * ($n + ($n**2 + 1) / $d);

        --$count if ($A < $prev);

        if (not exists $nums{$A}) {
            undef $nums{$A};
            $prev = $A;
            last OUT if (++$count == $nth);
        }
    }
}

say +(sort { $a <=> $b } keys %nums)[$nth - 1];
