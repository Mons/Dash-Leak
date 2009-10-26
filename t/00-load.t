#!usr/bin/env perl

use strict;
use warnings;
use lib::abs '../lib';
use Test::NoWarnings;
use Test::More tests => 2;

BEGIN {
	use_ok( 'Dash::Leak' );
}

diag( "Testing Dash::Leak $Dash::Leak::VERSION, Perl $], $^X" );
