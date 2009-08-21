package MySchema::Store::Manager;

use strict;

use base qw(Rose::DB::Object::Manager);

use MySchema::Store;

sub object_class { 'MySchema::Store' }

__PACKAGE__->make_manager_methods('store');

1;

