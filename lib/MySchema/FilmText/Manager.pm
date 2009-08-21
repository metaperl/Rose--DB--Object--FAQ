package MySchema::FilmText::Manager;

use strict;

use base qw(Rose::DB::Object::Manager);

use MySchema::FilmText;

sub object_class { 'MySchema::FilmText' }

__PACKAGE__->make_manager_methods('film_text');

1;

