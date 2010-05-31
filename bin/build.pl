#!/usr/bin/env perl
use strict;
use warnings;
use Template::Declare::Tags;
use Jarsonmar;
use File::Path qw(mkpath);
Template::Declare->init(dispatch_to => ['Jarsonmar']);

my $base = 'site';
foreach my $section (@Jarsonmar::Sections) {
    open my $fh, '>', "$base/$Jarsonmar::Sections{$section}->[1]"
        or die $!;
    print $fh Template::Declare->show($section);
    close $fh;
}

