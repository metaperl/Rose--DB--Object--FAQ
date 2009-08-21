package MySchema::Actor::Manager;

use strict;

use base qw(Rose::DB::Object::Manager);

use MySchema::Actor;

sub object_class { 'MySchema::Actor' }

__PACKAGE__->make_manager_methods('actor');

1;

