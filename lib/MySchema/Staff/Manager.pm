package MySchema::Staff::Manager;

use strict;

use base qw(Rose::DB::Object::Manager);

use MySchema::Staff;

sub object_class { 'MySchema::Staff' }

__PACKAGE__->make_manager_methods('staff');

1;

