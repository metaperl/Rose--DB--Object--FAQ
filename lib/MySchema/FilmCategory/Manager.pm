package MySchema::FilmCategory::Manager;

use strict;

use base qw(Rose::DB::Object::Manager);

use MySchema::FilmCategory;

sub object_class { 'MySchema::FilmCategory' }

__PACKAGE__->make_manager_methods('film_category');

1;

