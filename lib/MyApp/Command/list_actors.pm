package MyApp::Command::list_actors;
use MyApp -command;

use strict;
use warnings;

sub run {
my $actors = MySchema::Actor::Manager->get_actor;

my $count;
for my $actor (@$actors) 
{
    warn $actor->first_name;
    last if ++$count > 5;
}

}

1;
