package MyApp::Command::many2many;
use MyApp -command;

use strict;
use warnings;

sub run 
{
    my $actors = MySchema::Actor::Manager->get_actor
      (
       require_objects => [ 'film' ],
       query => [ actor_id => 1 ]
      );

}

1;
