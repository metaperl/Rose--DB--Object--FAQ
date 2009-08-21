package MySchema::Country::Manager;

use strict;

use base qw(Rose::DB::Object::Manager);

use MySchema::Country;

sub object_class { 'MySchema::Country' }

__PACKAGE__->make_manager_methods('country');

1;

