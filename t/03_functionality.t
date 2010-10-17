#!/usr/bin/perl

use strict;
use warnings;

use Test::More;

BEGIN {
    $ENV{DEBUG_MEM} = 1;
    $SIG{__WARN__} = sub {};
}

BEGIN {
    use_ok("Dash::Leak");
}

cmp_ok( get_change(), '<', 2000, "non-leaky code causes only the raw usage to be recorded" );

cmp_ok( get_change('leak'), '>', 28000, "leaky code causes the raw usage and leaks to be recorded" );

done_testing;

exit;

sub get_change {
    my ( $leak_toggle ) = @_;

    my $change = { sum => 0 };
    allocate_memory( $change, $leak_toggle ) for 1 .. 30;

    return $change->{sum};
}

sub allocate_memory {
    my ( $change, $leak ) = @_;

    leaksz( "block label", sub { $change->{sum} += $_[0] } );

    my $memuse = { big => 'x'x1000000 }; # allocate at least 1Mb

    $memuse->{self} = $memuse if $leak; # set up circular reference if we should leak

    return;
}
