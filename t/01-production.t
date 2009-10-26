#!/usr/bin/env perl

use strict;
use lib::abs '../lib';
use Test::NoWarnings;
use Test::More tests => 2;
BEGIN { $ENV{DEBUG_MEM} = 0 }
use Dash::Leak sub { fail "Should not be called" };

my $memuse = 'x'x1000000;# allocate at least 1Mb
leaksz "check", sub { fail "Should not be called" };
ok 1;
