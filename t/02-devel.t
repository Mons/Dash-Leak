#!/usr/bin/env perl

use strict;
use lib::abs '../lib';
use Test::NoWarnings;
use Test::More tests => 5;
BEGIN { $ENV{DEBUG_MEM} = 1 }
use Dash::Leak sub { diag "called during load @_"; $::load++; };

my $memuse = 'x'x1000000;# allocate at least 1Mb
leaksz "check", sub { diag "called for memuse @_"; $::use++; };

{
	leaksz "scoped", sub { diag "leaked in scope @_"; $::scope++; };
	my $usescope = 'x'x1000000;# allocate at least 1Mb
}

my $useother = 'x'x1000000;# allocate at least 1Mb

ok $::load, 'load ok';
ok $::use, 'use ok';
ok $::scope, 'scope ok';
ok 1, 'simple ok';
