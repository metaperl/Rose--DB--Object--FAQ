package MySchema::Inventory::Manager;

use strict;

use base qw(Rose::DB::Object::Manager);

use MySchema::Inventory;

sub object_class { 'MySchema::Inventory' }

__PACKAGE__->make_manager_methods('inventory');

1;

