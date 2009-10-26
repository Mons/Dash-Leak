#!/usr/bin/env perl

use common::sense;
use lib::abs '../lib';
use Test::More tests => 1;
BEGIN { $ENV{DEBUG_CB} = 0 }
use Devel::Leak::Cb;

my $sub;$sub = cb {
	$sub;
};
ok 1;