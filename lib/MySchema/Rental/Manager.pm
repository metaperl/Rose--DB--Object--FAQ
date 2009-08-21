package MySchema::Rental::Manager;

use strict;

use base qw(Rose::DB::Object::Manager);

use MySchema::Rental;

sub object_class { 'MySchema::Rental' }

__PACKAGE__->make_manager_methods('rental');

1;

