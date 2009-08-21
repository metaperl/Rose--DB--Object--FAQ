package MySchema::Customer::Manager;

use strict;

use base qw(Rose::DB::Object::Manager);

use MySchema::Customer;

sub object_class { 'MySchema::Customer' }

__PACKAGE__->make_manager_methods('customer');

1;

