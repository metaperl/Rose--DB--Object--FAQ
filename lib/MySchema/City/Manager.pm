package MySchema::City::Manager;

use strict;

use base qw(Rose::DB::Object::Manager);

use MySchema::City;

sub object_class { 'MySchema::City' }

__PACKAGE__->make_manager_methods('city');

1;

