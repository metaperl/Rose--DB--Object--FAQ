package MySchema::Language::Manager;

use strict;

use base qw(Rose::DB::Object::Manager);

use MySchema::Language;

sub object_class { 'MySchema::Language' }

__PACKAGE__->make_manager_methods('language');

1;

