package MySchema::FilmActor::Manager;

use strict;

use base qw(Rose::DB::Object::Manager);

use MySchema::FilmActor;

sub object_class { 'MySchema::FilmActor' }

__PACKAGE__->make_manager_methods('film_actor');

1;

