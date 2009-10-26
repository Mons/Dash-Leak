#!/usr/bin/env perl

use common::sense;
use lib::abs '../lib';
use Test::More tests => 2;
BEGIN { $ENV{DEBUG_CB} = 1 }
use Devel::Leak::Cb;

my $sub;$sub = cb {
	$sub;
};
END {
	$SIG{__WARN__} = sub {
		ok 1, "have warn";
		like $_[0],qr/^Leaked:/, 'warn correct';
	};
}