package MySchema::Payment::Manager;

use strict;

use base qw(Rose::DB::Object::Manager);

use MySchema::Payment;

sub object_class { 'MySchema::Payment' }

__PACKAGE__->make_manager_methods('payment');

1;

