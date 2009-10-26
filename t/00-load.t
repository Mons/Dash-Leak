#!usr/bin/env perl

use strict;
use lib::abs '../lib';
use Test::More tests => 1;

BEGIN {
	use_ok( 'Dash::Leak' );
}

diag( "Testing Dash::Leak $Dash::Leak::VERSION, Perl $], $^X" );
