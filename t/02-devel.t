#!/usr/bin/env perl

use strict;
use lib::abs '../lib';
use Test::NoWarnings;
use Test::More tests => 5;
BEGIN { $ENV{DEBUG_MEM} = 1 }
use Dash::Leak sub { pass "called during load" };

my $memuse = 'x'x1000000;# allocate at least 1Mb
leaksz "check", sub { pass "called for memuse" };

{
	leaksz "scoped", sub { pass "leaked in scope" };
	my $usescope = 'x'x1000000;# allocate at least 1Mb
}

ok 1, 'simple ok';
