package MySchema::Address::Manager;

use strict;

use base qw(Rose::DB::Object::Manager);

use MySchema::Address;

sub object_class { 'MySchema::Address' }

__PACKAGE__->make_manager_methods('address');

1;

