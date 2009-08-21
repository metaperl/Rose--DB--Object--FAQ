package MySchema::Film::Manager;

use strict;

use base qw(Rose::DB::Object::Manager);

use MySchema::Film;

sub object_class { 'MySchema::Film' }

__PACKAGE__->make_manager_methods('film');

1;

