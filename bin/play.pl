#!/usr/bin/perl

use strict; use warnings;

use FindBin;
use lib "$FindBin::Bin/../lib";

use Data::Dumper;
use MySchema::Actor;
use MySchema::Actor::Manager;



my $actors = MySchema::Actor::Manager->get_actor;

my $count;
for my $actor (@$actors) 
{
    warn $actor->first_name;
    last if ++$count > 5;
}

